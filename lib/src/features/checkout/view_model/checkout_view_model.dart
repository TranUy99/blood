import '../../../core/model/order_product_dto.dart';
import '../../../core/model/status_dto.dart';
import '../bloc/checkout_bloc.dart';

class CheckoutViewModel {
  final CheckoutBloc _checkoutBloc = CheckoutBloc();

  //Add event change password and listen state
  Future<bool> checkout(
      {required int? idUser,
      required int? idPromotion,
      required String? paymentMethodDTO,
      required StatusDTO? statusDTO,
      required List<OrderProductDTO?> orderProductDTOList,
      required int? idAddress,
      required String? receiveDate}) async {
    final createOrderPressedEvent = CreateOrderPressedEvent(
      idUser: idUser,
      idPromotion: idPromotion,
      paymentMethodDTO: paymentMethodDTO,
      statusDTO: statusDTO,
      orderProductDTOList: orderProductDTOList,
      idAddress: idAddress,
      receiveDate: receiveDate,
    );
    await _checkoutBloc.addEvent(createOrderPressedEvent);

    bool isCreateOrder = false;

    await _checkoutBloc.checkoutStateStream.listen(
      (state) {
        if (state is SuccessCheckoutState) {
          isCreateOrder = true;
        } else if (state is FailedCheckoutState) {
          isCreateOrder = false;
        }
      },
    );

    return isCreateOrder;
  }
}
