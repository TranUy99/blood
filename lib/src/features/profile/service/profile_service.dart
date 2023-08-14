import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/main.dart';
import 'package:mobile_store/src/core/model/address.dart';
import '../../../api/api_service.dart';

class ProfileService {
  static Future<List<Address>> getAddressService() async {
    List<Address> address = await ApiService(dio.Dio()).getAddress(auth: 'Bearer ${getUser.token}');
    address.forEach((response) {});

    return address;
  }
}
