import 'package:mobile_store/src/core/model/order_detail.dart';
import 'package:mobile_store/src/features/order/bloc/order_event.dart';
import 'package:rxdart/rxdart.dart';

import '../service/order_service.dart';
import 'order_state.dart';

class OrderBloc {
  final BehaviorSubject<OrderState> _orderStateSubject = BehaviorSubject<OrderState>();

  Stream<OrderState> get orderListStream => _orderStateSubject.stream;

  //Get order and add state
  Future<void> getOrder(OrderEvent event) async {
    if (event is GetOrderEvent) {
      final order = await OrderService.getOrderService(event.no, event.limit);

      if (order.contents!.isNotEmpty) {
        _orderStateSubject.sink.add(SuccessGetListOrder(order));
      } else {
        _orderStateSubject.sink.add(const FailedGetListOrder("No order detail available"));
      }
    }
  }

  //Get order tail and add state
  Future<void> getOrderDetail(OrderEvent event) async {
    if (event is GetOrderDetailEvent) {
      final OrderDetailDTO order = await OrderService.getOrderDetailService(event.id);
  
      if (order != null ) {
        _orderStateSubject.sink.add(SuccessGetOrderDetail(order));
      } else {
        _orderStateSubject.sink.add(const FailedGetOrderDetail("No order detail available"));
      }
    }
  }

  void dispose() {}
}

class CancelOrderBloc{
  final _stateController = BehaviorSubject<CancelOrderState>();
  Stream<CancelOrderState> get state => _stateController.stream;

  Future<void> cancelOrderBloc(int orderID)async {
    String? cancelOrderResult = await OrderService.cancelOrder(orderID);

    if(cancelOrderResult != null && cancelOrderResult == 'true'){
      print('bloc $cancelOrderResult');
      _stateController.add(SuccessCancelOrderState());
    }else{
      _stateController.add(ErrorCancelOrderState('Failed to cancel order'));
    }
  }
}
