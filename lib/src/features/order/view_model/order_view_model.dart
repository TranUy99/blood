import 'dart:async';

import 'package:mobile_store/src/core/remote/response/order_response/order_response.dart';

import '../bloc/order_bloc.dart';


class OrderViewModel {
  final OrderBloc _orderBloc = OrderBloc();

  Future<OrderResponse?> getOrder(int no, int limit) async {
    OrderResponse? orderResponse;
    final promotionEvent = GetOrderEvent(no, limit);

    Completer<OrderResponse> completer = Completer<OrderResponse>();

    await _orderBloc.getOrder(promotionEvent);

    StreamSubscription<OrderState>? subscription;
    subscription = _orderBloc.promotionListStream.listen((state) {
      if (state is SuccessGetListOrder) {
        orderResponse = state.order;
        completer.complete(orderResponse);
        subscription!.cancel();
      } else if (state is FailedGetListOrder) {
        completer.completeError('Error fetching order');
        subscription!.cancel();
      }
    });

    return completer.future;
  }
}
