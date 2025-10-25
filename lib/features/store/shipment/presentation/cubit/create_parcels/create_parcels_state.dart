part of 'create_parcels_cubit.dart';

class CreateParcelsState extends Equatable {
  final StateType createParcelsState;
  final String? errorMessage;
  final CityModel? selectedCity;
  final String? onDeliveryType;
  final Set<String> selectedServices;
  final File? selectedImage;
  final StateType getProductsState;
  final List<ProductModel> products;
  final ProductModel? selectedProduct;

  const CreateParcelsState({
    this.createParcelsState = StateType.initial,
    this.errorMessage,
    this.selectedCity,
    this.onDeliveryType,
    this.selectedServices = const {},
    this.selectedImage,
    this.getProductsState = StateType.loading,
    this.products = const [],
    this.selectedProduct,
  });

  @override
  List<Object?> get props => [
    createParcelsState,
    errorMessage,
    selectedCity,
    onDeliveryType,
    selectedServices,
    selectedImage,
    getProductsState,
    selectedProduct,
    products,
  ];

  CreateParcelsState copyWith({
    StateType? createParcelsState,
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
  }) {
    return CreateParcelsState(
      createParcelsState: createParcelsState ?? this.createParcelsState,
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
    );
  }
}
