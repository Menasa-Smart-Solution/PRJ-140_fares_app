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
  final List<SummaryStatusModel> statuses;

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
        SummaryStatusModel.dummy(id: 1, count: 25, nameAr: 'جميع الطلبات'),
        SummaryStatusModel.dummy(id: 2, count: 12, nameAr: 'قيد المراجعة'),
        SummaryStatusModel.dummy(id: 3, count: 8, nameAr: 'قيد التسليم'),
        SummaryStatusModel.dummy(id: 4, count: 5, nameAr: 'تم التسليم'),
        SummaryStatusModel.dummy(id: 5, count: 3, nameAr: 'تسليم جزئي'),
        SummaryStatusModel.dummy(id: 6, count: 2, nameAr: 'تعذر التسليم'),
        SummaryStatusModel.dummy(id: 7, count: 10, nameAr: 'المستحقات'),
        SummaryStatusModel.dummy(id: 8, count: 7, nameAr: 'المحادثات'),
      ],
    );
  }
}

@JsonSerializable(checked: true)
class SummaryStatusModel {
  final dynamic id;
  final num count;
  @JsonKey(name: 'name_ar')
  final String nameAr;

  SummaryStatusModel({
    required this.id,
    required this.count,
    required this.nameAr,
  });

  factory SummaryStatusModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryStatusModelFromJson(json);

  // Dummy data factory
  factory SummaryStatusModel.dummy({
    required dynamic id,
    required num count,
    required String nameAr,
  }) {
    return SummaryStatusModel(id: id, count: count, nameAr: nameAr);
  }
}
