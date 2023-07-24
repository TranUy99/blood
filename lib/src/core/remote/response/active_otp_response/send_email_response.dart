import 'package:json_annotation/json_annotation.dart';

part 'send_email_response.g.dart';

//Receive message, errors from api
@JsonSerializable()
class SendEmailResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'errors')
  final String? errors;

  @JsonKey(name: 'path')
  final String? path;

  @JsonKey(name: 'httpCode')
  final int? httpCode;

  SendEmailResponse(this.message, this.errors, this.path, this.httpCode);

  factory SendEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailResponseToJson(this);
}
