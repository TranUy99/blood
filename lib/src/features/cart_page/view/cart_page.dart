import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/constant/color/color.dart';

import 'package:mobile_store/src/features/cart_page/bloc/cart_state.dart';
import 'package:mobile_store/src/features/cart_page/view_model/cart_view_model.dart';

import 'package:mobile_store/src/features/component/custom_app_bar.dart';
import 'package:mobile_store/src/features/home_page/view/navigation_home_page.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/model/order_product_dto.dart';

import '../bloc/cart_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
