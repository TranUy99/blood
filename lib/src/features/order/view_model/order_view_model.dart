import 'dart:async';
import 'dart:developer';

import 'package:mobile_store/src/core/model/order_detail.dart';
import 'package:mobile_store/src/core/remote/response/order_response/order_response.dart';

import '../bloc/order_bloc.dart';
import '../bloc/order_event.dart';
import '../bloc/order_state.dart';

class OrderViewModel {
  final OrderBloc _orderBloc = OrderBloc();

  Future<OrderResponse?> getOrder(int no, int limit) async {
  
    OrderResponse? orderResponse;
    final orderEvent = GetOrderEvent(no, limit);

    Completer<OrderResponse> completer = Completer<OrderResponse>();

    await _orderBloc.getOrder(orderEvent);

    StreamSubscription<OrderState>? subscription;
    subscription = _orderBloc.orderListStream.listen((state) {
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

  Future<OrderDetailDTO?> getOrderDetail(int id) async {
    OrderDetailDTO? orderDetailDTO;
    final orderEvent = GetOrderDetailEvent(id);

    Completer<OrderDetailDTO> completer = Completer<OrderDetailDTO>();

    await _orderBloc.getOrderDetail(orderEvent);

    StreamSubscription<OrderState>? subscription;
    subscription = _orderBloc.orderListStream.listen((state) {
      if (state is SuccessGetOrderDetail) {
        orderDetailDTO = state.orderDetail;
        completer.complete(orderDetailDTO);
        subscription!.cancel();
      } else if (state is FailedGetOrderDetail) {
        completer.completeError('Error fetching order');
        subscription!.cancel();
      }
    });
    return completer.future;
  }
}
