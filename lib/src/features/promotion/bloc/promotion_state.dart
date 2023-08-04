part of 'promotion_bloc.dart';

abstract class PromotionState extends Equatable {
  const PromotionState();
  
  @override
  List<Object> get props => [];
}

class PromotionInitial extends PromotionState {}


class SuccessGetListPromotion extends PromotionState {
    final PromotionResponse promotions;
  const SuccessGetListPromotion(this.promotions);
}

class FailedGetListPromotion extends PromotionState {
   final String errorMessage;
  const FailedGetListPromotion(this.errorMessage);
}
