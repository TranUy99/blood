import 'package:get/get.dart';

import 'package:mobile_store/src/core/network/network_manager.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut<NetworkController>(() => NetworkController());
  }
}
