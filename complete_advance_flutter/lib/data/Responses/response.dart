import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/builder.dart';
import 'package:json_serializable/json_serializable.dart';
part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
  BaseResponse(this.message, this.status);
  factory BaseResponse.FromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
  Map<String, dynamic> fromJson(Map<String, dynamic> json) =>
      _$BaseResponseToJson(this);
}

@JsonSerializable()
class ContactResponse {
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  ContactResponse(this.email, this.phone);
  factory ContactResponse.FromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);
  Map<String, dynamic> fromJson(Map<String, dynamic> json) =>
      _$ContactResponseToJson(this);
}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "noOfNotification")
  int? onOfNotification;
  CustomerResponse(this.id, this.name, this.onOfNotification);
  factory CustomerResponse.FromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);
  Map<String, dynamic> fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseToJson(this);
}

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: "contact")
  ContactResponse? contactResponse;
  @JsonKey(name: "customer")
  CustomerResponse? customerResponse;

  AuthResponse(this.contactResponse, this.customerResponse);
  // fromJson

  factory AuthResponse.FromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  // to Json
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
