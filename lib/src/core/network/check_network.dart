import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/core/network/network_manager.dart';
class CheckNetwork {
  final NetworkController _networkController = Get.put(NetworkController());
  late final BuildContext context;
  checkInternetConnection() {
    if (_networkController.connectionType.value ==  "No Internet Connection") {
   
      Get.defaultDialog(
          title: AppLocalizations.of(context)!.notification,
          content:
              Text('${AppLocalizations.of(context)?.pleaseCheckYourInternetConnectionAndTryAgain}'));
    }
  }
}

