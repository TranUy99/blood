import 'package:json_annotation/json_annotation.dart';

part 'send_email_active_user_response.g.dart';

//Receive message, errors from api
@JsonSerializable()
class SendEmailActiveUserResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'errors')
  final String? errors;

  @JsonKey(name: 'path')
  final String? path;

  @JsonKey(name: 'httpCode')
  final int? httpCode;

  SendEmailActiveUserResponse(this.message, this.errors, this.path, this.httpCode);

  factory SendEmailActiveUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEmailActiveUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailActiveUserResponseToJson(this);
}
