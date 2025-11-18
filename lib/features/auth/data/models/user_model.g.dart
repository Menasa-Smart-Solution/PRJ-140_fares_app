// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UserModel', json, ($checkedConvert) {
      final val = UserModel(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String?),
        email: $checkedConvert('email', (v) => v as String?),
        phone: $checkedConvert('phone', (v) => v as String?),
        address: $checkedConvert('address', (v) => v as String?),
        type: $checkedConvert('type', (v) => v as String?),
        ownerName: $checkedConvert('owner_name', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'ownerName': 'owner_name'});

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'owner_name': instance.ownerName,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'address': instance.address,
  'type': instance.type,
};
