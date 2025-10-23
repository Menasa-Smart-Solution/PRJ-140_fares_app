import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'store_parcels_response_model.g.dart';

@JsonSerializable(checked: true)
class StoreParcelsResponseModel {
  final StoreParcelsDataModel data;

  StoreParcelsResponseModel({required this.data});

  factory StoreParcelsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoreParcelsResponseModelFromJson(json);
}

@JsonSerializable(checked: true)
class StoreParcelsDataModel {
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'last_page')
  final int lastPage;
  @JsonKey(name: 'data')
  final List<StoreParcelModel> parcels;

  StoreParcelsDataModel({
    required this.currentPage,
    required this.lastPage,
    required this.parcels,
  });

  factory StoreParcelsDataModel.fromJson(Map<String, dynamic> json) =>
      _$StoreParcelsDataModelFromJson(json);
}

@JsonSerializable(checked: true)
class StoreParcelModel {
  @JsonKey(name: 'id')
  final int id;
  final String? city;
  final String? desc;
  @JsonKey(name: 'product_price')
  final String? productPrice;
  @JsonKey(name: 'recipient_number')
  final String? recipientNumber;
  @JsonKey(name: 'recipient_number_2')
  final String? recipientNumberTwo;
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @JsonKey(name: 'origin_qty')
  final String? qty;
  @JsonKey(name: 'delivery_on')
  final String? deliveryOn;
  @JsonKey(name: 'shipping_price')
  final String? shippingPrice;
  final String? status;
  final String? notes;
  @JsonKey(name: 'delivery_notes')
  final String? deliveryNotes;
  @JsonKey(name: 'call_record_count')
  final int? callRecordCount;
  @JsonKey(name: 'share_tracking_code_link')
  final String? shareTrackingCodeLink;
  @JsonKey(name: 'tocity')
  final ParcelCityModel? toCity;
  @JsonKey(name: 'origin_branch')
  final BranchModel? originBranch;
  final StoreModel? store;
  @JsonKey(name: 'deliveryman')
  final DeliverymanModel? deliveryman;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final List<ParcelsRecord>? records;

  StoreParcelModel({
    required this.id,
    this.city,
    this.desc,
    this.productPrice,
    this.recipientNumber,
    this.customerName,
    this.qty,
    this.deliveryOn,
    this.shippingPrice,
    this.status,
    this.notes,
    this.deliveryNotes,
    this.callRecordCount,
    this.shareTrackingCodeLink,
    this.toCity,
    this.originBranch,
    this.store,
    this.deliveryman,
    this.createdAt,
    this.recipientNumberTwo,
    this.records,
  });

  factory StoreParcelModel.fromJson(Map<String, dynamic> json) =>
      _$StoreParcelModelFromJson(json);
}

@JsonSerializable(checked: true)
class StoreModel {
  final int id;
  final String? name;
  @JsonKey(name: 'owner_name')
  final String? ownerName;
  @JsonKey(name: 'total_parcels_count')
  final int? totalParcelsCount;
  final String? balance;

  StoreModel({
    required this.id,
    required this.name,
    required this.ownerName,
    required this.totalParcelsCount,
    required this.balance,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}

@JsonSerializable(checked: true)
class DeliverymanModel {
  final int? id;
  final String? name;
  final String? phone;
  DeliverymanModel({this.id, this.name, this.phone});

  factory DeliverymanModel.fromJson(Map<String, dynamic> json) =>
      _$DeliverymanModelFromJson(json);
}

@JsonSerializable(checked: true)
class ParcelsRecord {
  final int id;
  final String? details;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'parcel_id')
  final String? parcelId;
  ParcelsRecord({
    required this.id,
    this.details,
    this.createdAt,
    this.parcelId,
  });
  factory ParcelsRecord.fromJson(Map<String, dynamic> json) =>
      _$ParcelsRecordFromJson(json);
}
