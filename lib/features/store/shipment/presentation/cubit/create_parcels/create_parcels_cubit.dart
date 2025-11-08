import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:fares/core/services/image_picker_service.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/store/prices/data/models/city_response_model.dart';
import 'package:fares/features/store/shipment/data/models/add_deposit_request_model.dart';
import 'package:fares/features/store/shipment/data/models/create_parcels_request_body.dart';
import 'package:fares/features/store/shipment/data/models/products_response_model.dart';
import 'package:fares/features/store/shipment/data/repositories/shipment_repo.dart';
part 'create_parcels_state.dart';

class CreateParcelsCubit extends Cubit<CreateParcelsState> {
  final ShipmentRepo _repo;
  final ImagePickerService _imagePickerService;
  final InternetService _internetService;
  CreateParcelsCubit(
    this._repo,
    this._imagePickerService,
    this._internetService,
  ) : super(const CreateParcelsState());
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();

  Future<void> createParcels({
    required String phone,
    required String address,
    required String qty,
    String? recipientName,
    String? recipientPhone2,
  }) async {
    emit(
      state.copyWith(createParcelsState: StateType.loading, isDeposit: false),
    );
    final parcels = CreateParcelsRequestBody(
      customerName: recipientName,
      qty: int.parse(qty),
      desc: descriptionController.text,
      recipientNumber: phone,
      recipientNumber2: recipientPhone2,
      productPrice: num.parse(productPriceController.text),
      address: address,
      cityId: state.selectedCity!.id,
      deliveryOn: state.onDeliveryType ?? LocaleKeys.customer,
      breakable: isServiceSelected(LocaleKeys.breakable) ? 1 : 0,
      unmeasurable: isServiceSelected(LocaleKeys.nonMeasurable) ? 1 : 0,
      replacing: isServiceSelected(LocaleKeys.exchangeNote) ? 1 : 0,
      unopenable: isServiceSelected(LocaleKeys.nonOpenable) ? 1 : 0,
      measurable: isServiceSelected(LocaleKeys.measurable) ? 1 : 0,
      unreturnable: isServiceSelected(LocaleKeys.nonReturnable) ? 1 : 0,
    );
    final result = await _repo.createShipment(
      body: parcels,
      image: state.selectedImage,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            createParcelsState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(createParcelsState: StateType.success));
      },
    );
  }

  void addDeposit({
    required String phone,
    required String address,
    required String qty,
    String? recipientName,
    String? recipientPhone2,
  }) async {
    emit(state.copyWith(createParcelsState: StateType.loading));
    final body = AddDepositRequestModel(
      customerName: recipientName,
      qty: int.parse(qty),
      desc: descriptionController.text,
      recipientNumber: phone,
      recipientNumber2: recipientPhone2,
      productPrice: num.parse(productPriceController.text),
      address: address,
      cityId: state.selectedCity!.id,
      deliveryOn: state.onDeliveryType ?? LocaleKeys.customer,
      downPayment: 1, // Example down payment value),
    );
    final result = await _repo.addDeposit(body: body);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            createParcelsState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            createParcelsState: StateType.success,
            isDeposit: true,
          ),
        );
      },
    );
  }

  Future<void> getProducts() async {
    emit(state.copyWith(getProductsState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(getProductsState: StateType.noInternet));
      return;
    }
    final result = await _repo.getProducts();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getProductsState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (response) {
        emit(
          state.copyWith(
            getProductsState: StateType.success,
            products: response.products,
          ),
        );
      },
    );
  }

  void setSelectedCity(CityModel? city) {
    AppLogger.info('Selected City: ${city?.name}');
    emit(state.copyWith(selectedCity: city));
  }

  void setOnDeliveryType(String onDelivery) {
    emit(state.copyWith(onDeliveryType: onDelivery));
  }

  void toggleServiceSelection(String service) {
    final updatedServices = Set<String>.from(state.selectedServices);
    if (updatedServices.contains(service)) {
      updatedServices.remove(service);
    } else {
      updatedServices.add(service);
    }
    emit(state.copyWith(selectedServices: updatedServices));
  }

  bool isServiceSelected(String service) {
    return state.selectedServices.contains(service);
  }

  void setSelectedImage() async {
    final File? image = await _imagePickerService.pickImage(
      type: ImageSourceType.gallery,
    );
    if (image != null) {
      emit(state.copyWith(selectedImage: image));
    }
  }

  void clearSelectedImage() {
    emit(state.copyWith(clearSelectedImage: true));
  }

  void setSelectedProduct(ProductModel? product) {
    AppLogger.info('Selected Product: ${product?.name}');
    descriptionController.text = product?.name ?? '';
    productPriceController.text = product?.price.toString() ?? '';
    emit(state.copyWith(selectedProduct: product, clearSelectedProduct: false));
  }

  void resetState() {
    emit(const CreateParcelsState());
  }

  @override
  Future<void> close() {
    descriptionController.dispose();
    productPriceController.dispose();
    return super.close();
  }

  @override
  void emit(CreateParcelsState state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }
}
