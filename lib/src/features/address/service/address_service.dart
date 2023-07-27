import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:mobile_store/main.dart';
import 'package:mobile_store/src/api/api_service.dart';
import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/core/model/district.dart';
import 'package:mobile_store/src/core/model/province.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_store/src/core/model/ward.dart';
import 'package:mobile_store/src/core/remote/request/address_request/create_address_request.dart';

import '../../../core/remote/response/address_response/create_address_response.dart';

class AddressService {
  //api get province
  static Future<List<Province>> getProvinces() async {
    const String url = 'https://vapi.vnappmob.com/api/province';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);
    try {
      final List<dynamic> results = json['results'];
      final List<Province> provinces =
          results.map<Province>((province) => Province.fromJson(province)).toList();

      return provinces;
    } catch (e) {
      return []; // Return an empty list or handle the error accordingly
    }
  }

  // api get district
  static Future<List<District>> getDistrict(String? provinceId) async {
    String url = 'https://vapi.vnappmob.com/api/province/district/$provinceId';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    try {
      final List<dynamic> results = json['results'];
      final List<District> districts =
          results.map<District>((district) => District.fromJson(district)).toList();

      return districts;
    } catch (e) {
      rethrow;
    }
  }

  // api get ward
  static Future<List<Ward>> getWard(String? districtId) async {
    String url = 'https://vapi.vnappmob.com/api/province/ward/$districtId';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    try {
      final List<dynamic> results = json['results'];
      final List<Ward> wards = results.map<Ward>((ward) => Ward.fromJson(ward)).toList();

      return wards;
    } catch (e) {
      rethrow;
    }
  }

  // call api create address
  static Future<CreateAddressResponse> createAddress(
      String? location, String? type, String? phoneReceiver, String? nameReceiver) async {
    CreateAddressResponse response = await ApiService(dio.Dio()).createAddress(
        auth: "Bearer ${getUser.token!}",
        createAddress: CreateAddressRequest(
            location: location,
            type: type,
            phoneReceiver: phoneReceiver,
            nameReceiver: nameReceiver));
 
    return response;
  }

// call api get address
    static Future<List<Address>> getAddressService() async {
    List<Address> address = await ApiService(dio.Dio()).getAddress(auth: 'Bearer ${getUser.token}');
    address.forEach((response) {});
  
    return address;
  }
}
