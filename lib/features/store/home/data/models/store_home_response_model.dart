import 'package:fares/core/helpers/helper_func.dart';
import 'package:fares/features/driver/home/data/models/summary_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'store_home_response_model.g.dart';

@JsonSerializable(checked: true)
class StoreHomeResponseModel {
  final StoreHomeModel data;

  StoreHomeResponseModel({required this.data});

  factory StoreHomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoreHomeResponseModelFromJson(json);
}

@JsonSerializable(checked: true)
class StoreHomeModel {
  @NullableStringConverter()
  final String? balance;
  @JsonKey(name: 'chats_count')
  final int? chatCounts;
  final List<StatusModel> statuses;

  StoreHomeModel({this.balance, this.chatCounts, required this.statuses});

  factory StoreHomeModel.fromJson(Map<String, dynamic> json) =>
      _$StoreHomeModelFromJson(json);
}

@JsonSerializable(checked: true)
class HomeStoreStatuses {
  final String id;
  final int count;
  @JsonKey(name: 'name_ar')
  final String nameAr;

  HomeStoreStatuses({
    required this.id,
    required this.count,
    required this.nameAr,
  });

  factory HomeStoreStatuses.fromJson(Map<String, dynamic> json) =>
      _$HomeStoreStatusesFromJson(json);
}

final StoreHomeModel dummyStoreHome = StoreHomeModel(
  balance: '1520',
  chatCounts: 3,
  statuses: [
    StatusModel.dummy(id: 1, count: 25, nameAr: 'جميع الطلبات'),
    StatusModel.dummy(id: 2, count: 12, nameAr: 'قيد المراجعة'),
    StatusModel.dummy(id: 3, count: 8, nameAr: 'قيد التسليم'),
    StatusModel.dummy(id: 4, count: 5, nameAr: 'تم التسليم'),
    StatusModel.dummy(id: 5, count: 3, nameAr: 'تسليم جزئي'),
    StatusModel.dummy(id: 6, count: 2, nameAr: 'تعذر التسليم'),
    StatusModel.dummy(id: 7, count: 10, nameAr: 'المستحقات'),
    StatusModel.dummy(id: 8, count: 7, nameAr: 'المحادثات'),
  ],
);
