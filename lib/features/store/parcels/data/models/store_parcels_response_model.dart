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

final List<StoreParcelModel> dummyParcels = List.generate(10, (index) {
  return StoreParcelModel(
    id: index + 1,
    city: ['Tripoli', 'Benghazi', 'Misrata', 'Zliten', 'Sabha'][index % 5],
    desc: 'Parcel number ${index + 1} - Test description',
    productPrice: '${(index + 1) * 50}',
    recipientNumber: '09${(index + 10) * 123456 % 9999999}',
    recipientNumberTwo: '09${(index + 20) * 987654 % 9999999}',
    customerName: 'Customer ${index + 1}',
    qty: '${(index % 3) + 1}',
    deliveryOn: '2025-10-${20 + (index % 10)}',
    shippingPrice: '${(index % 5) * 5 + 10}',
    status: ['Pending', 'In Transit', 'Delivered'][index % 3],
    notes: 'Note for parcel ${index + 1}',
    deliveryNotes: index.isEven ? 'Delivered successfully' : 'Still in transit',
    callRecordCount: index % 4,
    shareTrackingCodeLink: 'https://myapp.ly/track/${index + 1000}',
    toCity: ParcelCityModel(
      id: (index % 5) + 1,
      name: ['Tripoli', 'Benghazi', 'Misrata', 'Zliten', 'Sabha'][index % 5],
    ),
    originBranch: BranchModel(
      id: (index % 3) + 1,
      name: ['Main Branch', 'East Branch', 'West Branch'][index % 3],
    ),
    store: StoreModel(
      id: (index % 4) + 1,
      name: 'Store ${index + 1}',
      ownerName: 'Owner ${index + 1}',
      totalParcelsCount: 50 + index * 2,
      balance: '${500 + index * 100}',
    ),
    deliveryman: DeliverymanModel(
      id: index + 10,
      name: 'Driver ${index + 1}',
      phone: '0911${index + 12345}',
    ),
    createdAt: '2025-10-${19 + (index % 5)}T08:00:00Z',
    records: List.generate(2, (rIndex) {
      return ParcelsRecord(
        id: index * 10 + rIndex,
        details: rIndex == 0
            ? 'Picked up by courier'
            : 'Delivered to customer ${index + 1}',
        createdAt: '2025-10-${19 + (index % 5)}T0${rIndex + 9}:00:00Z',
        parcelId: '${index + 1}',
      );
    }),
  );
});
