import 'dart:async';

import '../../../../main.dart';
import '../../../core/model/product_detail_cart.dart';
import 'app_bar_event.dart';
import 'app_bar_state.dart';

class AppBarBloc {
  var state = AppBarState(getUser.cartBox!.length);
  final eventController = StreamController<AppBarEvent>();
  final stateController = StreamController<AppBarState>.broadcast();

  AppBarBloc() {
    eventController.stream.listen((AppBarEvent event) {
      if (event is AddItemToCartEvent) {
        state = AppBarState(event.addToCartList);
      }
      stateController.sink.add(state);
    });
  }
}
