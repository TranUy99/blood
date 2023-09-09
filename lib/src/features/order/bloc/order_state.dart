

import 'package:equatable/equatable.dart';
import 'package:mobile_store/src/core/model/order_detail.dart';

import '../../../core/remote/response/order_response/order_response.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

class SuccessGetListOrder extends OrderState {
  final OrderResponse order;
  const SuccessGetListOrder(this.order);
}

class FailedGetListOrder extends OrderState {
  final String errorMessage;
  const FailedGetListOrder(this.errorMessage);
}

class SuccessGetOrderDetail extends OrderState {
  final OrderDetailDTO orderDetail;
  const SuccessGetOrderDetail(this.orderDetail);
}

class FailedGetOrderDetail extends OrderState {
  final String errorMessage;
  const FailedGetOrderDetail(this.errorMessage);
}

abstract class CancelOrderState{}

class SuccessCancelOrderState extends CancelOrderState{
}

class ErrorCancelOrderState extends CancelOrderState{
  String? error;
  ErrorCancelOrderState(this.error);
}