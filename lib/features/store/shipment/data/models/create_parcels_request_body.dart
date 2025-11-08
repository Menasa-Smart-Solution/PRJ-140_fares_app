class CreateParcelsRequestBody {
  final String desc;
  final String? customerName;
  final int qty;
  final String recipientNumber;
  final String? recipientNumber2;
  final num productPrice;
  final String address;
  final int cityId;
  final String deliveryOn;
  final String? notes;
  String? imagePath;
  final int breakable;
  final int replacing;
  final int unmeasurable;
  final int measurable;
  final int unreturnable;
  final int unopenable;

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
    this.imagePath,
    this.breakable = 0,
    this.replacing = 0,
    this.unmeasurable = 0,
    this.measurable = 0,
    this.unreturnable = 0,
    this.unopenable = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'desc': desc,
      'customer_name': customerName,
      'qty': qty.toString(),
      'recipient_number': recipientNumber,
      'recipient_number_2': recipientNumber2,
      'product_price': productPrice.toString(),
      'address': address,
      'to_city_id': cityId.toString(),
      'delivery_on': deliveryOn,
      'notes': notes,
      'breakable': breakable.toString(),
      'replacing': replacing.toString(),
      'unmeasurable': unmeasurable.toString(),
      'measurable': measurable.toString(),
      'unreturnable': unreturnable.toString(),
      'unopenable': unopenable.toString(),
      'image_path': imagePath,
    };
  }
}
