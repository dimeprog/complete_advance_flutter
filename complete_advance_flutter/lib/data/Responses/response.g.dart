// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) =>
    BaseResponse(json['status'], json['message'])
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

ContactResponse _$ContactResponseFromJson(Map<String, dynamic> json) =>
    ContactResponse(json['email'], json['phone'])
      ..email = json['email'] as String?
      ..phone = json['phone'] as String?;

Map<String, dynamic> _$ContactResponseToJson(ContactResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
    };

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) =>
    CustomerResponse(json['id'], json['name'], json['onOfNotification'])
      ..id = json['id'] as String?
      ..name = json['name'] as String?
      ..onOfNotification = json['noOfNotification'] as int?;

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'noOfNotification': instance.onOfNotification,
    };

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
    json['contactResponse'], json['customerResponse'])
  ..contactResponse = (json['contact'] == null
      ? null
      : ContactResponse.FromJson(json['contact'] as Map<String, dynamic>))
  ..customerResponse = (json['customer'] == null
      ? null
      : CustomerResponse.FromJson(json['customer'] as Map<String, dynamic>));

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'contact': instance.contactResponse,
      'customer': instance.customerResponse,
    };
