import 'package:json_annotation/json_annotation.dart';
part 'summary_response_model.g.dart';

@JsonSerializable(checked: true)
class SummaryResponseModel {
  final SummaryDataModel data;

  SummaryResponseModel({required this.data});

  factory SummaryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryResponseModelFromJson(json);
}

@JsonSerializable(checked: true)
class SummaryDataModel {
  @JsonKey(name: 'chats_count')
  final num chatsCount;
  final String due;
  final List<SummaryStatusModel> statuses;

  SummaryDataModel({
    required this.chatsCount,
    required this.due,
    required this.statuses,
  });

  factory SummaryDataModel.fromJson(Map<String, dynamic> json) =>
      _$SummaryDataModelFromJson(json);
}

@JsonSerializable(checked: true)
class SummaryStatusModel {
  final String id;
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
}
