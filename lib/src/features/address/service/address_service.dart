import 'dart:convert';
import 'dart:developer';

import 'package:mobile_store/src/core/model/district.dart';
import 'package:mobile_store/src/core/model/province.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_store/src/core/model/ward.dart';

class AddressService {
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

  static Future<List<District>> getDistrict(String provinceId) async {
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

  static Future<List<Ward>> getWard(String districtId) async {
    String url = 'https://vapi.vnappmob.com/api/province/ward/$districtId';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    try {
      final List<dynamic> results = json['results'];
      final List<Ward> districts = results.map<Ward>((ward) => Ward.fromJson(ward)).toList();
      return districts;
    } catch (e) {
      rethrow;
    }
  }
}
