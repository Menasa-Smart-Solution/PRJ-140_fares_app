import 'package:json_annotation/json_annotation.dart';
part 'summary_response_model.g.dart';

@JsonSerializable(checked: true)
class SummaryResponseModel {
  final SummaryDataModel data;

  SummaryResponseModel({required this.data});

  factory SummaryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryResponseModelFromJson(json);

  // Dummy data factory
  factory SummaryResponseModel.dummy() {
    return SummaryResponseModel(data: SummaryDataModel.dummy());
  }
}

@JsonSerializable(checked: true)
class SummaryDataModel {
  @JsonKey(name: 'chats_count')
  final num chatsCount;
  @JsonKey(fromJson: _dueFromJson)
  final String due;
  final List<int> flights;
  final List<StatusModel> statuses;

  SummaryDataModel({
    required this.chatsCount,
    required this.due,
    required this.flights,
    required this.statuses,
  });

  static String _dueFromJson(dynamic value) {
    if (value is num) {
      return value.toStringAsFixed(2);
    } else if (value is String) {
      return value;
    } else {
      return '0.00';
    }
  }

  factory SummaryDataModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryDataModelFromJson(json);

  // Dummy data factory
  factory SummaryDataModel.dummy() {
    return SummaryDataModel(
      chatsCount: 15,
      due: '2500.50 د.ل',
      flights: [],
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
  }
}

@JsonSerializable(checked: true)
class StatusModel {
  final dynamic id;
  final num count;
  @JsonKey(name: 'name_ar')
  final String nameAr;

  StatusModel({required this.id, required this.count, required this.nameAr});

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);

  // Dummy data factory
  factory StatusModel.dummy({
    required dynamic id,
    required num count,
    required String nameAr,
  }) {
    return StatusModel(id: id, count: count, nameAr: nameAr);
  }
}
