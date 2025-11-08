import 'package:json_annotation/json_annotation.dart';
part 'create_parcels_request_body.g.dart';

@JsonSerializable(checked: true)
class CreateParcelsRequestBody {
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
  @JsonKey(name: 'sub_city_id')
  final int? subCityId;
  @JsonKey(name: 'delivery_on')
  final String deliveryOn;
  final String? notes;
  @JsonKey(name: 'image_path')
  String? imagePath;
  final int breakable;
  final int replacing;
  final int unmeasurable;
  final int measurable;
  final int unreturnable;
  final int unopenable;
  @JsonKey(name: 'product_ids')
  final List<int> productIds;
  final List<int> qtys;
  @JsonKey(name: 'partial_delivery')
  final int partialDelivery;

  CreateParcelsRequestBody({
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
    this.partialDelivery = 0,
    required this.productIds,
    required this.qtys,
    this.subCityId,

    this.imagePath,
    this.breakable = 0,
    this.replacing = 0,
    this.unmeasurable = 0,
    this.measurable = 0,
    this.unreturnable = 0,
    this.unopenable = 0,
  });

  Map<String, dynamic> toJson() => _$CreateParcelsRequestBodyToJson(this);
  // Map<String, dynamic> toJson() {
  //   return {
  //     'desc': desc,
  //     'customer_name': customerName,
  //     'qty': qty.toString(),
  //     'recipient_number': recipientNumber,
  //     'recipient_number_2': recipientNumber2,
  //     'product_price': productPrice.toString(),
  //     'address': address,
  //     'to_city_id': cityId.toString(),
  //     'delivery_on': deliveryOn,
  //     'notes': notes,
  //     'breakable': breakable.toString(),
  //     'replacing': replacing.toString(),
  //     'unmeasurable': unmeasurable.toString(),
  //     'measurable': measurable.toString(),
  //     'unreturnable': unreturnable.toString(),
  //     'unopenable': unopenable.toString(),
  //     'image_path': imagePath,
  //     'product_ids': productIds,
  //     'qtys': qtys,
  //     'partial_delivery': partialDelivery.toString(),
  //   };
  // }
}
