import 'dart:io';

import 'package:fares/core/enums/enums.dart';
import 'package:fares/core/services/image_picker_service.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/core/utils/app_logger.dart';
import 'package:fares/features/store/parcels/data/models/store_parcels_response_model.dart';
import 'package:fares/features/store/parcels/data/repos/store_parcels_repo.dart';
import 'package:fares/features/store/prices/data/models/city_response_model.dart';
import 'package:fares/features/store/prices/data/repos/prices_repo.dart';
import 'package:fares/features/store/shipment/data/models/create_parcels_request_body.dart';
import 'package:fares/features/store/shipment/data/models/products_response_model.dart';
import 'package:fares/features/store/shipment/data/repositories/shipment_repo.dart';
import 'package:fares/features/store/shipment/presentation/cubit/update_parcles/update_parcels_state.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateParcelsCubit extends Cubit<UpdateParcelsState> {
  final ShipmentRepo _repo;
  final ImagePickerService _imagePickerService;
  final InternetService _internetService;
  final PricesRepo _pricesRepo;
  final StoreParcelsRepo _storeParcelsRepo;

  UpdateParcelsCubit(
    this._repo,
    this._imagePickerService,
    this._internetService,
    this._pricesRepo,
    this._storeParcelsRepo,
  ) : super(const UpdateParcelsState());

  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController qtyController = TextEditingController();

  Future<void> getCitiesPrices() async {
    emit(state.copyWith(getCitiesPricesState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(getCitiesPricesState: StateType.noInternet));
      return;
    }
    final result = await _pricesRepo.getCities();
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getCitiesPricesState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (response) {
        emit(
          state.copyWith(
            getCitiesPricesState: StateType.success,
            citiesPrices: response.data,
          ),
        );
      },
    );
  }

  Future<void> getParcel(int id) async {
    emit(state.copyWith(getParcelsState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(getParcelsState: StateType.noInternet));
      return;
    }
    final result = await _storeParcelsRepo.getStoreParcelDetails(id);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getParcelsState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (parcel) {
        // Fill the form data from the fetched parcel
        _emitGetParcel(parcel);
      },
    );
  }

  Future<void> updateParcel({
    required String phone,
    required String address,
    String? notes,
    required String description,
    String? recipientName,
    String? recipientPhone2,
  }) async {
    // Debug logging BEFORE emitting loading state
    AppLogger.info('=== BEFORE UPDATE LOADING STATE ===');
    AppLogger.info(
      'Selected SubCity: ${state.selectedSubCity?.name} (ID: ${state.selectedSubCity?.id})',
    );

    emit(
      state.copyWith(
        updateParcelState: StateType.loading,
        isDeposit: false,
        clearSubCityId: false, // Explicitly preserve subcity
      ),
    );

    // Debug logging AFTER emitting loading state
    AppLogger.info('=== AFTER UPDATE LOADING STATE ===');
    AppLogger.info('Updating parcel with:');
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
      qtys: state.qyts,
      subCityId: state.selectedSubCity?.id,
    );

    // Log the actual request body
    AppLogger.info('Request body subCityId: ${parcels.subCityId}');

    final result = await _repo.updateParcel(
      body: parcels,
      id: state.parcel!.id,
      image: state.selectedImage,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            updateParcelState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(updateParcelState: StateType.success));
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
    AppLogger.info('Selected City: ${city?.name} (ID: ${city?.id})');
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

  void _emitGetParcel(StoreParcelModel parcel) {
    // Ensure data is loaded before filling
    if (state.citiesPrices.isEmpty || state.products.isEmpty) {
      AppLogger.warning(
        'Cannot fill parcel: cities or products not loaded yet',
      );
      return;
    }

    AppLogger.info('Parcel subCityId from API: ${parcel.subCityId}');
    productPriceController.text = parcel.productPrice?.toString() ?? '0';
    qtyController.text = parcel.qty?.toString() ?? '0';

    final services = <String>{};
    if (parcel.breakable == "1") services.add(LocaleKeys.breakable);
    if (parcel.unmeasurable == "1") services.add(LocaleKeys.nonMeasurable);
    if (parcel.replacing == "1") services.add(LocaleKeys.exchangeNote);
    if (parcel.unopenable == "1") services.add(LocaleKeys.nonOpenable);
    if (parcel.measurable == "1") services.add(LocaleKeys.measurable);
    if (parcel.unreturnable == "1") services.add(LocaleKeys.nonReturnable);
    if (parcel.partialDelivery == "1") services.add(LocaleKeys.partialDelivery);

    final deliveryType = parcel.deliveryOn ?? LocaleKeys.customer;

    // Find and set selected city from available cities
    CityModel? selectedCity;
    SubCitiesModel? selectedSubCity;
    if (parcel.toCity != null) {
      try {
        selectedCity = state.citiesPrices.firstWhere(
          (city) => city.id == parcel.toCity!.id,
        );

        AppLogger.info(
          'Found city: ${selectedCity.name} with ${selectedCity.subCities?.length ?? 0} subcities',
        );

        // Find subcity if available
        if (parcel.subCityId != null && selectedCity.subCities != null) {
          try {
            selectedSubCity = selectedCity.subCities!.firstWhere(
              (subCity) => subCity.id.toString() == parcel.subCityId,
            );
            AppLogger.info(
              'Found subcity: ${selectedSubCity.name} (ID: ${selectedSubCity.id})',
            );
          } catch (e) {
            AppLogger.warning('SubCity not found with ID: ${parcel.subCityId}');
          }
        }
      } catch (e) {
        AppLogger.warning('City not found: ${parcel.toCity?.id}');
      }
    }

    final List<int> qtys = [];

    // If no products mapped, try to use the total qty
    if (qtys.isEmpty && parcel.qty != null) {
      final totalQty = int.tryParse(parcel.qty!) ?? 0;
      if (totalQty > 0) {
        qtys.add(totalQty);
      }
    }

    AppLogger.info(
      'Filling from parcel with ${parcel.products?.length ?? 0} products',
    );
    AppLogger.info(
      'Setting selectedSubCity to: ${selectedSubCity?.name} (ID: ${selectedSubCity?.id})',
    );

    emit(
      state.copyWith(
        selectedCity: selectedCity,
        selectedSubCity: selectedSubCity,
        onDeliveryType: deliveryType,
        selectedServices: services,
        selectedProduct: parcel.products != null && parcel.products!.isNotEmpty
            ? parcel.products![0]
            : null,
        selectedProducts: parcel.products ?? [],
        qyts: qtys.isNotEmpty ? qtys : [1],
        clearSelectedProduct: false,
        clearSelectedImage: false,
        clearSubCityId: false,
        getParcelsState: StateType.success,
        parcel: parcel,
      ),
    );

    // Verify after emit
    AppLogger.info(
      'After emit - SubCity in state: ${state.selectedSubCity?.name} (ID: ${state.selectedSubCity?.id})',
    );
  }

  @override
  Future<void> close() {
    productPriceController.dispose();
    qtyController.dispose();
    return super.close();
  }

  @override
  void emit(UpdateParcelsState state) {
    if (isClosed) {
      return;
    }
    super.emit(state);
  }
}
