part of 'promotion_bloc.dart';

abstract class PromotionEvent extends Equatable {
  const PromotionEvent();

  @override
  List<Object> get props => [];
}
class GetPromotionEvent extends PromotionEvent {
  final int no;
  final int limit;

  const GetPromotionEvent( this.no,this.limit,);
}


class GetIdPromotionEvent extends PromotionEvent {
  final int? idPromotion;

  const GetIdPromotionEvent(
    this.idPromotion,
  );
}
