import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';

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
  final File? imagePath;
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

  Future<FormData> toFormData() async {
    final Map<String, dynamic> data = {
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
    };

    // Add file if exists
    if (imagePath != null) {
      data['image_path'] = await MultipartFile.fromFile(
        imagePath!.path,
        filename: basename(imagePath!.path),
      );
    }

    return FormData.fromMap(data);
  }
}
