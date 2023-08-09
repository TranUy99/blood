
import 'package:equatable/equatable.dart';
import 'package:mobile_store/src/core/remote/response/order_response/order_response.dart';
import 'package:rxdart/rxdart.dart';

import '../service/order_service.dart';

part 'order_event.dart';
part 'order_state.dart';


class OrderBloc {
  final BehaviorSubject<OrderState> _promotionStateSubject = BehaviorSubject<OrderState>();

  Stream<OrderState> get promotionListStream => _promotionStateSubject.stream;

  //Get order and add state
  Future<void> getOrder(OrderEvent event) async {
    if (event is GetOrderEvent) {
      final promotion = await OrderService.getOrderService(event.no,event.limit);

      if (promotion.contents!.isNotEmpty) {
        _promotionStateSubject.sink.add(SuccessGetListOrder(promotion));
      } else {
        _promotionStateSubject.sink.add(const FailedGetListOrder("No promotion available"));
      }
    }

    void dispose() {}
  }
}
