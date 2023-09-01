import 'dart:async';
import 'package:mobile_store/src/core/model/promotion.dart';
import 'package:mobile_store/src/core/remote/response/promotion_response/promotion_response.dart';
import '../bloc/promotion_bloc.dart';

class PromotionViewModel {
  final PromotionBloc _promotionBloc = PromotionBloc();

  Future<PromotionResponse?> getPromotion(int no, int limit) async {
    PromotionResponse? promotionResponse;
    final promotionEvent = GetPromotionEvent(no, limit);

    Completer<PromotionResponse> completer = Completer<PromotionResponse>();

    await _promotionBloc.getPromotion(promotionEvent);

    StreamSubscription<PromotionState>? subscription;
    subscription = _promotionBloc.promotionListStream.listen((state) {
      if (state is SuccessGetListPromotion) {
        promotionResponse = state.promotions;
        completer.complete(promotionResponse);
        subscription!.cancel();
      } else if (state is FailedGetListPromotion) {
        completer.completeError('Error fetching products');
        subscription!.cancel();
      }
    });

    return completer.future;
  }

  // add event and listen get id promotion state
  Future<PromotionDTO> getIdPromotion(int? idPromotion) async {
    final addressEvent = GetIdPromotionEvent(idPromotion);
    PromotionDTO promotion;

    Completer<PromotionDTO> completer = Completer<PromotionDTO>();

    await _promotionBloc.getIdPromotionEvent(addressEvent);

    StreamSubscription<PromotionState>? subscription;
    subscription = _promotionBloc.promotionListStream.listen((state) {
      if (state is SuccessGetIdPromotionState) {
        promotion = state.promotionDTO;

        completer.complete(promotion);
        subscription!.cancel();
      } else if (state is FailedGetIdPromotionState) {
        completer.completeError('Error fetching products');
        subscription!.cancel();
      }
    });

    return completer.future;
  }
}
