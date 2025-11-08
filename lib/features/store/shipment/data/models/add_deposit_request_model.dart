import 'package:json_annotation/json_annotation.dart';
part 'add_deposit_request_model.g.dart';

@JsonSerializable(checked: true)
class AddDepositRequestModel {
  final String desc;
  @JsonKey(name: 'customer_name')
  final String? customerName;
  final int qty;
  @JsonKey(name: 'recipient_number')
  final String recipientNumber;
  @JsonKey(name: 'recipient_number_2')
  final String? recipientNumber2;
  @JsonKey(name: 'product_price')
  final num productPrice;
  final String address;
  @JsonKey(name: 'to_city_id')
  final int cityId;
  @JsonKey(name: 'delivery_on')
  final String deliveryOn;
  final String? notes;
  @JsonKey(name: 'down_payment')
  final int downPayment;

  AddDepositRequestModel({
    required this.desc,
    this.customerName,
    required this.qty,
    required this.recipientNumber,
    this.recipientNumber2,
    required this.productPrice,
    required this.address,
    required this.cityId,
    required this.deliveryOn,
    this.notes,
    required this.downPayment,
  });

  Map<String, dynamic> toJson() => _$AddDepositRequestModelToJson(this);
}
