import 'package:fares/core/helpers/helper_func.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'receipt_response_model.g.dart';

@JsonSerializable(checked: true)
class ReceiptResponseModel {
  final ReceiptDataModel data;

  ReceiptResponseModel({required this.data});

  factory ReceiptResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptResponseModelFromJson(json);
}

@JsonSerializable(checked: true)
class ReceiptDataModel {
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'last_page')
  final int lastPage;
  final List<ReceiptModel> data;

  ReceiptDataModel({
    required this.currentPage,
    required this.lastPage,
    required this.data,
  });

  factory ReceiptDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptDataModelFromJson(json);
}

@JsonSerializable(checked: true)
class ReceiptModel {
  final int id;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'total_parcels_products_count')
  final int parcelsCount;
  @JsonKey(name: 'total_products_price')
  @StringConverter()
  final String totalPrice;
  @JsonKey(name: 'total_shipping_price')
  @StringConverter()
  final String shippingPrice;
  @JsonKey(name: 'total_withdrawal_transaction')
  @StringConverter()
  final String? withdrawalTransaction;
  @StringConverter()
  final String total;
  final List<ParcelModel>? parcels;

  ReceiptModel({
    required this.id,
    required this.createdAt,
    required this.parcelsCount,
    required this.totalPrice,
    required this.shippingPrice,
    this.withdrawalTransaction,
    required this.total,
    this.parcels,
  });

  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);
}
