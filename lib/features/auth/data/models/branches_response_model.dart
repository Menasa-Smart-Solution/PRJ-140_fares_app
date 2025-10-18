import 'package:json_annotation/json_annotation.dart';
part 'branches_response_model.g.dart';

@JsonSerializable(checked: true)
class BranchesResponseModel {
  @JsonKey(name: 'data')
  final List<BranchModel> branches;

  BranchesResponseModel({required this.branches});

  factory BranchesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BranchesResponseModelFromJson(json);
}

@JsonSerializable(checked: true)
class BranchModel {
  final int id;
  final String name;
  final String address;

  BranchModel({required this.id, required this.name, required this.address});

  factory BranchModel.fromJson(Map<String, dynamic> json) =>
      _$BranchModelFromJson(json);
}
