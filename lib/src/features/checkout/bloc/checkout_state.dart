part of 'checkout_bloc.dart';

sealed class CheckoutState extends Equatable {
  const CheckoutState();
  
  @override
  List<Object> get props => [];
}

final class CheckoutInitial extends CheckoutState {}
//State change password  success
class SuccessCheckoutState extends CheckoutState {
  final bool onLoginState;

  const SuccessCheckoutState(this.onLoginState);
}

//State change password failed
class FailedCheckoutState extends CheckoutState {
  final String errorMessage;

  const FailedCheckoutState(this.errorMessage);
}
