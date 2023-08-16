import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import '../../../core/model/order_product_dto.dart';
import '../../../core/model/status_dto.dart';
import '../service/checkout_service.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc {
  final BehaviorSubject<CheckoutState> _checkOutStateSubject = BehaviorSubject<CheckoutState>();

  Stream<CheckoutState> get checkoutStateStream => _checkOutStateSubject.stream;

  Future<void> addEvent(CheckoutEvent event) async {
    if (event is CreateOrderPressedEvent) {
      try {
        final response = await CheckOutService.checkOutService(
            event.idUser,
            event.idPromotion,
            event.paymentMethodDTO,
            event.statusDTO,
            event.orderProductDTOList,
            event.idAddress,
            event.receiveDate);

        if (response.response.statusCode == 201) {
          _checkOutStateSubject.sink.add(const SuccessCheckoutState(true));
        } else {
          _checkOutStateSubject.sink.add(const FailedCheckoutState("error"));
        }
      } catch (e) {
        _checkOutStateSubject.sink.add(const FailedCheckoutState("error"));
      }
    }
  }
}
