part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}
class GetOrderEvent extends OrderEvent {
  final int no;
  final int limit;

  const GetOrderEvent( this.no,this.limit,);
}
