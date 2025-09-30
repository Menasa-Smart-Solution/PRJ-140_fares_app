// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AuthResponseModel', json, ($checkedConvert) {
      final val = AuthResponseModel(
        data: $checkedConvert(
          'data',
          (v) => AuthModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{'data': instance.data};

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AuthModel', json, ($checkedConvert) {
      final val = AuthModel(
        token: $checkedConvert('token', (v) => v as String),
        user: $checkedConvert(
          'user',
          (v) => UserModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AuthModelToJson(AuthModel instance) => <String, dynamic>{
  'token': instance.token,
  'user': instance.user,
};
