import 'package:json_annotation/json_annotation.dart';
part 'products_response_model.g.dart';

@JsonSerializable(checked: true)
class ProductsResponseModel {
  @JsonKey(name: 'data')
  final List<ProductModel> products;

  ProductsResponseModel({required this.products});

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);
}

@JsonSerializable(checked: true)
class ProductModel {
  final int id;
  final String name;
  final String price;
  final String qty;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.qty,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
