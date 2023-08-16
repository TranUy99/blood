part of 'checkout_bloc.dart';

sealed class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class CreateOrderPressedEvent extends CheckoutEvent {
  final int? idUser;
  final int? idPromotion;
  final String? paymentMethodDTO;
  final StatusDTO? statusDTO;
  final List<OrderProductDTO?> orderProductDTOList;
  final int? idAddress;
  final String? receiveDate;

  const CreateOrderPressedEvent({
    required this.idUser,
    required this.idPromotion,
    required this.paymentMethodDTO,
    required this.statusDTO,
    required this.orderProductDTOList,
    required this.idAddress,
    required this.receiveDate,
  });
}
