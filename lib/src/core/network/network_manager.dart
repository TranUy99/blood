import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var connectionType = "".obs;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectionInfor();
    streamSubscription =
        connectivity.onConnectivityChanged.listen(_updateState);
  }

  getConnectionInfor() async {
    await getConnectionType();
  }

  Future<void> getConnectionType() async {
    // ignore: prefer_typing_uninitialized_variables
    var connectivityResult;
    try {
      connectivityResult = await connectivity.checkConnectivity();
      _updateState(connectivityResult);
      // print(connectivityResult);
    } on PlatformException catch (e) {
      print(e);
      Get.snackbar("exception", "Error when checking connection");
    }
  }

  _updateState(result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = "Wifi";
        // update();
        break;
      case ConnectivityResult.mobile:
        connectionType.value = "Mobile";
        // update();
        break;
      case ConnectivityResult.none:
        connectionType.value = "No Internet Connection";
        // update();
        break;
      default:
        Get.snackbar("Network error", "Failed to get Network Status");
        break;
    }
  }
}

