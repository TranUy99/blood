import 'package:json_annotation/json_annotation.dart';

part 'active_otp_response.g.dart';

//Receive message from api
@JsonSerializable()
class ActiveOTPResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'errors')
  final String? errors;

  @JsonKey(name: 'path')
  final String? path;

  ActiveOTPResponse(this.message, this.path, this.errors);

  factory ActiveOTPResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveOTPResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveOTPResponseToJson(this);
}
