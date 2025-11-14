import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/features/store/parcels/data/models/store_parcels_response_model.dart';
import 'package:fares/features/store/prices/data/models/city_response_model.dart';
import 'package:fares/features/store/shipment/data/models/products_response_model.dart';

class UpdateParcelsState extends Equatable {
  final StateType getParcelsState;
  final StoreParcelModel? parcel;
  final String? errorMessage;
  final StateType updateParcelState;
  final CityModel? selectedCity;
  final String? onDeliveryType;
  final Set<String> selectedServices;
  final File? selectedImage;
  final StateType getProductsState;
  final List<ProductModel> products;
  final ProductModel? selectedProduct;
  final bool isDeposit;
  final List<ProductModel> selectedProducts;
  final List<int> qyts;
  final SubCitiesModel? selectedSubCity;
  final StateType getCitiesPricesState;
  final List<CityModel> citiesPrices;
  const UpdateParcelsState({
    this.updateParcelState = StateType.initial,
    this.errorMessage,
    this.selectedCity,
    this.onDeliveryType,
    this.selectedServices = const {},
    this.selectedImage,
    this.selectedSubCity,
    this.getCitiesPricesState = StateType.loading,
    this.citiesPrices = const [],

    this.getProductsState = StateType.loading,
    this.products = const [],
    this.selectedProduct,
    this.isDeposit = false,
    this.selectedProducts = const [],
    this.qyts = const [],
    this.getParcelsState = StateType.loading,
    this.parcel,
  });

  @override
  List<Object?> get props => [
    updateParcelState,
    errorMessage,
    selectedCity,
    onDeliveryType,
    selectedServices,
    selectedImage,
    getProductsState,
    selectedProduct,
    products,
    isDeposit,
    selectedProducts,
    qyts,
    selectedSubCity,
    getCitiesPricesState,
    citiesPrices,
    getParcelsState,
    parcel,
  ];

  UpdateParcelsState copyWith({
    StateType? updateParcelState,
    String? errorMessage,
    CityModel? selectedCity,
    String? onDeliveryType,
    Set<String>? selectedServices,
    File? selectedImage,
    bool clearSelectedImage = false,
    StateType? getProductsState,
    List<ProductModel>? products,
    ProductModel? selectedProduct,
    bool clearSelectedProduct = false,
    bool? isDeposit,
    List<ProductModel>? selectedProducts,
    List<int>? qyts,
    SubCitiesModel? selectedSubCity,
    bool clearSubCityId = false,
    StateType? getCitiesPricesState,
    List<CityModel>? citiesPrices,
    StateType? getParcelsState,
    StoreParcelModel? parcel,
  }) {
    return UpdateParcelsState(
      updateParcelState: updateParcelState ?? this.updateParcelState,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCity: selectedCity ?? this.selectedCity,
      onDeliveryType: onDeliveryType ?? this.onDeliveryType,
      selectedServices: selectedServices ?? this.selectedServices,
      selectedImage: clearSelectedImage
          ? null
          : selectedImage ?? this.selectedImage,
      getProductsState: getProductsState ?? this.getProductsState,
      products: products ?? this.products,
      selectedProduct: clearSelectedProduct
          ? null
          : selectedProduct ?? this.selectedProduct,
      isDeposit: isDeposit ?? this.isDeposit,
      selectedProducts: selectedProducts ?? this.selectedProducts,
      qyts: qyts ?? this.qyts,
      selectedSubCity: clearSubCityId
          ? null
          : selectedSubCity ?? selectedSubCity,
      getCitiesPricesState: getCitiesPricesState ?? this.getCitiesPricesState,
      citiesPrices: citiesPrices ?? this.citiesPrices,
      getParcelsState: getParcelsState ?? this.getParcelsState,
      parcel: parcel ?? this.parcel,
    );
  }
}
