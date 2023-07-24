import 'package:json_annotation/json_annotation.dart';

part 'active_otp_response.g.dart';

@JsonSerializable()
class ActiveOTPResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'path')
  final String? path;

  ActiveOTPResponse(this.message, this.path);

  factory ActiveOTPResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveOTPResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveOTPResponseToJson(this);
}
