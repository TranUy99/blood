import 'package:json_annotation/json_annotation.dart';
part 'promotion.g.dart';

@JsonSerializable()
class PromotionDTO {
  @JsonKey(name: 'id')
  final int? id; 
  @JsonKey(name: 'discountCodeDTO')
  final String? discountCodeDTO;
  @JsonKey(name: 'totalPurchaseDTO')
  final double? totalPurchaseDTO;
  @JsonKey(name: 'discountDTO')
  final int? discountDTO;
  @JsonKey(name: 'maxGetDTO')
  final double? maxGetDTO;
  @JsonKey(name: 'expireDateDTO')
  final String? expireDateDTO;
  @JsonKey(name: 'campagnDTO')
  final bool? campagnDTO;
  @JsonKey(name: 'statusDTO')
  final bool? statusDTO;
  
  
  PromotionDTO({this.id,  this.campagnDTO,this.discountCodeDTO,this.discountDTO,this.expireDateDTO,this.maxGetDTO,this.statusDTO,this.totalPurchaseDTO});
  factory PromotionDTO.fromJson(Map<String, dynamic> json) => _$PromotionDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PromotionDTOToJson(this);
}

