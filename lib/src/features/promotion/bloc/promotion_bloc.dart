
import 'package:equatable/equatable.dart';
import 'package:mobile_store/src/core/model/promotion.dart';
import 'package:mobile_store/src/core/remote/response/promotion_response/promotion_response.dart';
import 'package:mobile_store/src/features/promotion/service/promotion_service.dart';
import 'package:rxdart/rxdart.dart';

part 'promotion_event.dart';
part 'promotion_state.dart';

class PromotionBloc {
  final BehaviorSubject<PromotionState> _promotionStateSubject = BehaviorSubject<PromotionState>();

  Stream<PromotionState> get promotionListStream => _promotionStateSubject.stream;

  //Get product and add state
  Future<void> getPromotion(PromotionEvent event) async {
    if (event is GetPromotionEvent) {
      final promotion = await PromotionService.getPromotionService(event.no,event.limit);

      if (promotion.contents!.isNotEmpty) {
        _promotionStateSubject.sink.add(SuccessGetListPromotion(promotion));
      } else {
        _promotionStateSubject.sink.add(const FailedGetListPromotion("No promotion available"));
      }
    }
  }

  //get id promotion
  Future<void> getIdPromotionEvent(PromotionEvent event) async {
    if (event is GetIdPromotionEvent) {
      final PromotionDTO promotion =
          await PromotionService.getIdPromotionService(event.idPromotion);

      if (promotion != null) {
        _promotionStateSubject.sink.add(SuccessGetIdPromotionState(promotion));
      } else {
        _promotionStateSubject.sink.add(const FailedGetIdPromotionState("No promotion available"));
      }
    }
  }
}
