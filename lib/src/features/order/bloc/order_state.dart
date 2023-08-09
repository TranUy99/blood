part of 'order_bloc.dart';

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
