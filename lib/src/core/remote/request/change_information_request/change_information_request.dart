import 'package:json_annotation/json_annotation.dart';

part 'change_information_request.g.dart';

//Send email, password to api
@JsonSerializable()
class ChangeInformationRequest {

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'fullName')
  final String? fullName;

  @JsonKey(name: 'gender')
  final int? gender;

  @JsonKey(name: 'birthDay')
  final String? birthDay;

  ChangeInformationRequest(this.email, this.fullName, this.gender, this.birthDay);

  factory ChangeInformationRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeInformationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeInformationRequestToJson(this);
}