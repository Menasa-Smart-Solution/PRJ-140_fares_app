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
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();

  Future<void> createParcels({
    required String phone,
    required String address,
    String? notes,
    required String description,
    String? recipientName,
    String? recipientPhone2,
  }) async {
    // Debug logging BEFORE emitting loading state
    AppLogger.info('=== BEFORE LOADING STATE ===');
    AppLogger.info(
      'Selected SubCity: ${state.selectedSubCity?.name} (ID: ${state.selectedSubCity?.id})',
    );

    emit(
      state.copyWith(createParcelsState: StateType.loading, isDeposit: false),
    );

    // Debug logging AFTER emitting loading state
    AppLogger.info('=== AFTER LOADING STATE ===');
    AppLogger.info('Creating parcels with:');
    AppLogger.info(
      'Selected City: ${state.selectedCity?.name} (ID: ${state.selectedCity?.id})',
    );
    AppLogger.info(
      'Selected SubCity: ${state.selectedSubCity?.name} (ID: ${state.selectedSubCity?.id})',
    );
    AppLogger.info('SubCity ID to send: ${state.selectedSubCity?.id}');

    final parcels = CreateParcelsRequestBody(
      customerName: recipientName,
      qty: int.parse(qtyController.text),
      desc: description,
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
      partialDelivery: isServiceSelected(LocaleKeys.partialDelivery) ? 1 : 0,
      productIds: state.selectedProducts.map((e) => e.id).toList(),
      qtys: state.selectedProducts.isEmpty
          ? [int.parse(qtyController.text)]
          : state.qyts,
      subCityId: state.selectedSubCity?.id,
    );

    // Log the actual request body
    AppLogger.info('Request body subCityId: ${parcels.subCityId}');

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
    String? notes,
    required String description,
    String? recipientName,
    String? recipientPhone2,
  }) async {
    emit(state.copyWith(createParcelsState: StateType.loading));
    final body = AddDepositRequestModel(
      customerName: recipientName,
      qty: int.parse(qtyController.text),
      desc: description,
      notes: notes,
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
    emit(state.copyWith(selectedCity: city, clearSubCityId: true));
  }

  void setSelectedSubCity(SubCitiesModel? subCity) {
    AppLogger.info('Setting SubCity: ${subCity?.name} (ID: ${subCity?.id})');
    emit(state.copyWith(selectedSubCity: subCity));
    // Log after emitting to verify state update
    AppLogger.info(
      'SubCity set in state: ${state.selectedSubCity?.name} (ID: ${state.selectedSubCity?.id})',
    );
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

  void updateQty(List<int> updatedQtys) {
    emit(state.copyWith(qyts: updatedQtys));
    updateTotalPrice();
    updateControllerQty();
  }

  void deleteQty(int index) {
    final updatedQtys = List<int>.from(state.qyts);
    final updatedProducts = List<ProductModel>.from(state.selectedProducts);
    final deletedProduct = updatedProducts[index];
    if (deletedProduct.id == state.selectedProduct?.id) {
      emit(state.copyWith(selectedProduct: null, clearSelectedProduct: true));
    }
    updatedQtys.removeAt(index);
    updatedProducts.removeAt(index);
    emit(state.copyWith(qyts: updatedQtys, selectedProducts: updatedProducts));
    updateTotalPrice();
    updateControllerQty();
  }

  void clearSelectedImage() {
    emit(state.copyWith(clearSelectedImage: true));
  }

  void setSelectedProduct(ProductModel? product) {
    if (state.selectedProducts.isEmpty) {
      qtyController.clear();
    }
    AppLogger.info('Selected Product: ${product?.name}');
    if (product != null) {
      final updatedProducts = List<ProductModel>.from(state.selectedProducts);
      final updatedQtys = List<int>.from(state.qyts);
      updatedProducts.add(product);
      updatedQtys.add(1); // Default quantity is 1 when adding a product
      emit(
        state.copyWith(selectedProducts: updatedProducts, qyts: updatedQtys),
      );
    }
    if (product != null) {
      updateTotalPrice();
      updateControllerQty();
    }

    emit(state.copyWith(selectedProduct: product, clearSelectedProduct: false));
  }

  void updateTotalPrice() {
    double total = 0.0;
    for (var product in state.selectedProducts) {
      final prodPrice = product.price;
      double price = 0.0;
      if (prodPrice is num) {
        price = double.tryParse(prodPrice.toString()) ?? 0.0;
      } else {
        price = double.tryParse(prodPrice.toString()) ?? 0.0;
      }
      total += price;
    }
    final formatted = (total % 1 == 0)
        ? total.toInt().toString()
        : total.toString();
    productPriceController.text = formatted;
  }

  void updateControllerQty() {
    // get the sum state.qyts and update the controller
    final sum = state.qyts.fold<int>(
      0,
      (previous, current) => previous + current,
    );
    qtyController.text = sum.toString();
  }

  void resetState() {
    emit(const CreateParcelsState());
  }

  @override
  Future<void> close() {
    productPriceController.dispose();
    qtyController.dispose();
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
