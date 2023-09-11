import 'package:equatable/equatable.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class GetOrderEvent extends OrderEvent {
  final int no;
  final int limit;

  const GetOrderEvent(
    this.no,
    this.limit,
  );
}

class GetOrderDetailEvent extends OrderEvent {
  final int id;

  const GetOrderDetailEvent(
    this.id,
  );
}

class CancelOrderEvent {
  int orderID;
  CancelOrderEvent(this.orderID);
}
