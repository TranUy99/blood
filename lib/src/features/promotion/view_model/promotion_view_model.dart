import 'dart:async';
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
}
