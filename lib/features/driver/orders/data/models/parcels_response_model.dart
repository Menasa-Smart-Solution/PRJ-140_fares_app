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
  @JsonKey(name: 'parcels_price')
  final int? parcelsPrice;
  final ParcelsDataModel? parcels;

  ParcelsDateDataModel({this.parcels, this.parcelsCount, this.parcelsPrice});
  factory ParcelsDateDataModel.fromJson(Map<String, dynamic> json) =>
      _$ParcelsDateDataModelFromJson(json);
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
  @JsonKey(name: 'last_page_url')
  final String? lastPageUrl;
  final List<PaginationLinkModel>? links;
  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;
  final String? path;
  @JsonKey(name: 'per_page')
  final int? perPage;
  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;
  final int? to;
  final int? total;

  ParcelsDataModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
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
      lastPageUrl: 'https://api.fares.com.ly/api/parcels?page=5',
      links: [],
      nextPageUrl: 'https://api.fares.com.ly/api/parcels?page=2',
      path: 'https://api.fares.com.ly/api/parcels',
      perPage: 10,
      prevPageUrl: null,
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
  final String? branchId;
  @JsonKey(name: 'ref_id')
  final String? refId;
  @JsonKey(name: 'store_id')
  final String? storeId;
  @JsonKey(name: 'from_city_id')
  final String? fromCityId;
  @JsonKey(name: 'to_city_id')
  final String? toCityId;
  @JsonKey(name: 'sub_city_id')
  final String? subCityId;
  @JsonKey(name: 'delivery_man_id')
  final String? deliveryManId;
  @JsonKey(name: 'branch_settlement_id')
  final String? branchSettlementId;
  @JsonKey(name: 'warehouse_flight_id')
  final String? warehouseFlightId;
  @JsonKey(name: 'issue_id')
  final String? issueId;
  @JsonKey(name: 'issue_user_id')
  final String? issueUserId;
  @JsonKey(name: 'assign_flight_at')
  final String? assignFlightAt;
  final String? city;
  final String? desc;
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @JsonKey(name: 'origin_qty')
  final String? originQty;
  @JsonKey(name: 'origin_product_price')
  final String? originProductPrice;
  final String? qty;
  @JsonKey(name: 'return_qty')
  final String? returnQty;
  @JsonKey(name: 'product_price')
  final String? productPrice;
  @JsonKey(name: 'recipient_number')
  final String? recipientNumber;
  @JsonKey(name: 'delivery_on')
  final String? deliveryOn;
  @JsonKey(name: 'transfer_on')
  final String? transferOn;
  @JsonKey(name: 'recipient_number_2')
  final String? recipientNumber2;
  @JsonKey(name: 'shipping_price')
  final String? shippingPrice;
  @JsonKey(name: 'branch_commission')
  final String? branchCommission;
  @JsonKey(name: 'delivery_man_price')
  final String? deliveryManPrice;
  @JsonKey(name: 'paid_shipping_price')
  final String? paidShippingPrice;
  @JsonKey(name: 'paid_product_price')
  final String? paidProductPrice;
  @JsonKey(name: 'transaction_amount')
  final String? transactionAmount;
  final String? status;
  @JsonKey(name: 'status_change_at')
  final String? statusChangeAt;
  final String? notes;
  @JsonKey(name: 'delivery_notes')
  final String? deliveryNotes;
  @JsonKey(name: 'have_flight')
  final String? haveFlight;
  final String? delivered;
  final String? closed;
  final String? returned;
  @JsonKey(name: 'measuring_allowed')
  final String? measuringAllowed;
  final String? breakable;
  final String? replacing;
  final String? unopenable;
  final String? unmeasurable;
  final String? measurable;
  final String? unreturnable;
  final String? prepaid;
  @JsonKey(name: 'branch_prepaid')
  final String? branchPrepaid;
  @JsonKey(name: 'pre_branch_prepaid')
  final String? preBranchPrepaid;
  final String? urgent;
  @JsonKey(name: 'image_path')
  final String? imagePath;
  @JsonKey(name: 'prepiad_user_id')
  final String? prepiadUserId;
  @JsonKey(name: 'prepaid_at')
  final String? prepaidAt;
  @JsonKey(name: 'delivery_closed')
  final String? deliveryClosed;
  @JsonKey(name: 'unable_delivery_type_id')
  final String? unableDeliveryTypeId;
  @JsonKey(name: 'unable_delivery_type_user_id')
  final String? unableDeliveryTypeUserId;
  @JsonKey(name: 'unable_delivery_type_at')
  final String? unableDeliveryTypeAt;
  @JsonKey(name: 'whatsapp_message')
  final String? whatsappMessage;
  @JsonKey(name: 'whatsapp_message_at')
  final String? whatsappMessageAt;
  final String? shelf;
  @JsonKey(name: 'closed_at')
  final String? closedAt;
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;
  @JsonKey(name: 'deleted_user_id')
  final String? deletedUserId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'system_payment')
  final String? systemPayment;
  final String? warehouse;
  @JsonKey(name: 'delay_date')
  final String? delayDate;
  @JsonKey(name: 'receive_delivery_only')
  final String? receiveDeliveryOnly;
  @JsonKey(name: 'with_treasury')
  final String? withTreasury;
  @JsonKey(name: 'rating_attempts_store')
  final String? ratingAttemptsStore;
  @JsonKey(name: 'rating_attempts_customer')
  final String? ratingAttemptsCustomer;
  @JsonKey(name: 'old_id')
  final String? oldId;
  @JsonKey(name: 'is_deducted')
  final String? isDeducted;
  @JsonKey(name: 'is_payment_down')
  final String? isPaymentDown;
  @JsonKey(name: 'underchecking_notes_delivery_man')
  final String? undercheckingNotesDeliveryMan;
  @JsonKey(name: 'underchecking_notes_store')
  final String? undercheckingNotesStore;
  @JsonKey(name: 'issue_to_user_id')
  final String? issueToUserId;
  @JsonKey(name: 'flight_id')
  final String? flightId;
  @JsonKey(name: 'call_record_count')
  final int? callRecordCount;
  @JsonKey(name: 'tracking_code')
  final String? trackingCode;
  @JsonKey(name: 'share_tracking_code_link')
  final String? shareTrackingCodeLink;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'suggested_shelf')
  final String? suggestedShelf;
  final ParcelStoreModel? store;
  final ParcelCityModel? tocity;
  @JsonKey(name: 'origin_branch')
  final BranchModel? originBranch;
  final BranchModel? branch;

  ParcelModel({
    this.id,
    this.branchId,
    this.refId,
    this.storeId,
    this.fromCityId,
    this.toCityId,
    this.subCityId,
    this.deliveryManId,
    this.branchSettlementId,
    this.warehouseFlightId,
    this.issueId,
    this.issueUserId,
    this.assignFlightAt,
    this.city,
    this.desc,
    this.customerName,
    this.originQty,
    this.originProductPrice,
    this.qty,
    this.returnQty,
    this.productPrice,
    this.recipientNumber,
    this.deliveryOn,
    this.transferOn,
    this.recipientNumber2,
    this.shippingPrice,
    this.branchCommission,
    this.deliveryManPrice,
    this.paidShippingPrice,
    this.paidProductPrice,
    this.transactionAmount,
    this.status,
    this.statusChangeAt,
    this.notes,
    this.deliveryNotes,
    this.haveFlight,
    this.delivered,
    this.closed,
    this.returned,
    this.measuringAllowed,
    this.breakable,
    this.replacing,
    this.unopenable,
    this.unmeasurable,
    this.measurable,
    this.unreturnable,
    this.prepaid,
    this.branchPrepaid,
    this.preBranchPrepaid,
    this.urgent,
    this.imagePath,
    this.prepiadUserId,
    this.prepaidAt,
    this.deliveryClosed,
    this.unableDeliveryTypeId,
    this.unableDeliveryTypeUserId,
    this.unableDeliveryTypeAt,
    this.whatsappMessage,
    this.whatsappMessageAt,
    this.shelf,
    this.closedAt,
    this.deletedAt,
    this.deletedUserId,
    this.createdAt,
    this.originBranch,
    this.branch,
    this.updatedAt,
    this.systemPayment,
    this.warehouse,
    this.delayDate,
    this.receiveDeliveryOnly,
    this.withTreasury,
    this.ratingAttemptsStore,
    this.ratingAttemptsCustomer,
    this.oldId,
    this.isDeducted,
    this.isPaymentDown,
    this.undercheckingNotesDeliveryMan,
    this.undercheckingNotesStore,
    this.issueToUserId,
    this.flightId,
    this.callRecordCount,
    this.trackingCode,
    this.shareTrackingCodeLink,
    this.imageUrl,
    this.suggestedShelf,
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
      branchId: '1',
      refId: null,
      storeId: '2333',
      deliveryManId: '782',
      flightId: '22400',
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
      deliveryManPrice: '7',
      paidShippingPrice: '0',
      paidProductPrice: '0',
      transactionAmount: '0',
      status: 'FinancialSettlementPending',
      statusChangeAt: '2025-09-27 14:41:45',
      notes: null,
      deliveryNotes: null,
      callRecordCount: 0,
      trackingCode: '2333.1.$parcelId',
      shareTrackingCodeLink:
          'https://faris.com.ly/tracking?code=2333.1.$parcelId',
      imageUrl: null,
      createdAt: '2025-09-27T12:02:05.000000Z',
      updatedAt: '2025-09-27T12:41:45.000000Z',
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

  ParcelCityModel({this.id, this.name});

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

  BranchModel({this.id, this.name, this.phone});

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
}
