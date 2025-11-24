import 'package:fares/core/helpers/helper_func.dart';
import 'package:json_annotation/json_annotation.dart';
part 'parcels_response_model.g.dart';

@JsonSerializable(checked: true)
class ParcelsResponseModel {
  final ParcelsDateDataModel? data;
  @JsonKey(name: 'status_code')
  final int? statusCode;

  ParcelsResponseModel({this.data, this.statusCode});

  factory ParcelsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ParcelsResponseModelFromJson(json);
}
//(v) => v is String ? int.parse(v) : (v as num?)?.toInt(),

@JsonSerializable(checked: true)
class ParcelsDateDataModel {
  @JsonKey(name: 'parcels_count')
  final int? parcelsCount;
  @JsonKey(name: 'parcels_price', fromJson: _priceFromJson)
  final int? parcelsPrice;
  final ParcelsDataModel? parcels;

  ParcelsDateDataModel({this.parcels, this.parcelsCount, this.parcelsPrice});
  factory ParcelsDateDataModel.fromJson(Map<String, dynamic> json) =>
      _$ParcelsDateDataModelFromJson(json);

  static int? _priceFromJson(dynamic v) => v == null
      ? null
      : v is String
      ? int.tryParse(v)
      : (v as num?)?.toInt();
}

@JsonSerializable(checked: true)
class ParcelsDataModel {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  final List<ParcelModel>? data;
  @JsonKey(name: 'first_page_url')
  final String? firstPageUrl;
  final int? from;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  final int? total;

  ParcelsDataModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.total,
  });

  factory ParcelsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ParcelsDataModelFromJson(json);

  // Dummy data factory
  factory ParcelsDataModel.dummy() {
    return ParcelsDataModel(
      currentPage: 1,
      data: List.generate(10, (index) => ParcelModel.dummy(id: 155473 + index)),
      firstPageUrl: 'https://api.fares.com.ly/api/parcels?page=1',
      from: 1,
      lastPage: 5,
    );
  }
}

@JsonSerializable(checked: true)
class PaginationLinkModel {
  final String? url;
  final String? label;
  final bool? active;

  PaginationLinkModel({this.url, this.label, this.active});

  factory PaginationLinkModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkModelFromJson(json);
}

@JsonSerializable(checked: true)
class ParcelModel {
  final int? id;
  @JsonKey(name: 'branch_id')
  @NullableStringConverter()
  final String? refId;
  final String? city;
  final String? desc;
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @JsonKey(name: 'origin_qty')
  @NullableStringConverter()
  final String? originQty;
  @JsonKey(name: 'origin_product_price')
  @NullableStringConverter()
  final String? originProductPrice;
  @NullableStringConverter()
  final String? qty;
  @JsonKey(name: 'return_qty')
  @NullableStringConverter()
  final String? returnQty;
  @JsonKey(name: 'product_price')
  @NullableStringConverter()
  final String? productPrice;
  @JsonKey(name: 'recipient_number')
  final String? recipientNumber;
  @JsonKey(name: 'recipient_number_2')
  final String? recipientNumber2;
  @JsonKey(name: 'shipping_price')
  @NullableStringConverter()
  final String? shippingPrice;
  @NullableStringConverter()
  final String? status;
  final ParcelStoreModel? store;
  final ParcelCityModel? tocity;
  @JsonKey(name: 'origin_branch')
  final BranchModel? originBranch;
  final BranchModel? branch;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  ParcelModel({
    this.id,
    this.refId,
    this.createdAt,
    this.city,
    this.desc,
    this.customerName,
    this.originQty,
    this.originProductPrice,
    this.qty,
    this.returnQty,
    this.productPrice,
    this.recipientNumber,
    this.recipientNumber2,
    this.shippingPrice,
    this.status,
    this.originBranch,
    this.branch,

    this.store,
    this.tocity,
  });

  factory ParcelModel.fromJson(Map<String, dynamic> json) =>
      _$ParcelModelFromJson(json);

  // Dummy data factory
  factory ParcelModel.dummy({int? id}) {
    final parcelId = id ?? 155473;
    return ParcelModel(
      id: parcelId,
      refId: null,
      city: 'النوفليين',
      desc: '/ - ',
      customerName: '/',
      originQty: '1',
      originProductPrice: '500',
      qty: '1',
      returnQty: '0',
      productPrice: '500',
      recipientNumber: '4455555555',
      recipientNumber2: null,
      shippingPrice: '15',
      status: 'FinancialSettlementPending',
      store: ParcelStoreModel.dummy(),
      tocity: ParcelCityModel.dummy(),
    );
  }
}

@JsonSerializable(checked: true)
class ParcelStoreModel {
  final int? id;
  final String? name;
  final String? phone;
  @JsonKey(name: 'total_parcels_count')
  final int? totalParcelsCount;
  @NullableStringConverter()
  final String? balance;
  @JsonKey(name: 'suggested_shelf')
  final String? suggestedShelf;

  ParcelStoreModel({
    this.id,
    this.name,
    this.phone,
    this.totalParcelsCount,
    this.balance,
    this.suggestedShelf,
  });

  factory ParcelStoreModel.fromJson(Map<String, dynamic> json) =>
      _$ParcelStoreModelFromJson(json);

  // Dummy data factory
  factory ParcelStoreModel.dummy() {
    return ParcelStoreModel(
      id: 2333,
      name: 'متجر تجريبي',
      phone: '0000000000',
      totalParcelsCount: 10,
      balance: '700',
      suggestedShelf: null,
    );
  }
}

@JsonSerializable(checked: true)
class ParcelCityModel {
  final int? id;
  final String? name;
  @NullableStringConverter()
  final String? price;

  ParcelCityModel({this.id, this.name, this.price});

  factory ParcelCityModel.fromJson(Map<String, dynamic> json) =>
      _$ParcelCityModelFromJson(json);

  // Dummy data factory
  factory ParcelCityModel.dummy() {
    return ParcelCityModel(id: 1, name: 'طرابلس المركز');
  }
}

@JsonSerializable(checked: true)
class BranchModel {
  final int? id;
  final String? name;
  final String? phone;
  @JsonKey(name: 'phone_2')
  final String? phone2;

  BranchModel({this.id, this.name, this.phone, this.phone2});

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
}
