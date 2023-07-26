import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_store/src/core/model/district.dart';
import 'package:mobile_store/src/core/model/province.dart';
import 'package:mobile_store/src/core/model/ward.dart';
import 'package:mobile_store/src/features/address/view_model/address_view_model.dart';
import 'package:mobile_store/src/features/component/checkbox.dart';

import 'package:mobile_store/src/features/profile/view/profile_page.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  List<Province> provinceList = [];
  String? newProvince;
  Province? selectedProvince;
  String? provinceId = "";
  List<District> districtList = [];
  String? newDistrict;
  District? selectedDistrict;
  String? districtId = "";
  List<Ward> wardList = [];
  String? newWard;
  Ward? selectedWard;

  AddressViewModel addressViewModel = AddressViewModel();

  @override
  void initState() {
    super.initState();
    // Set default values
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Builder(builder: (BuildContext context) {
        final double maxHeight = MediaQuery.of(context).size.height * 0.6;
        final viewInsets = MediaQuery.of(context).viewInsets;
        final double availableHeight = MediaQuery.of(context).size.height - viewInsets.bottom;
        final double contentHeight = availableHeight < maxHeight ? availableHeight : maxHeight;
        return SizedBox(
          height: contentHeight,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.005),
                    child: const Text('DELIVERY ADDRESS',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icon/home_icon.png',
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text('HOME'),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icon/office_icon.png',
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text('OFFICE'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 5),

                  //get province
                  FutureBuilder<List<Province>>(
                    future: addressViewModel.getProvince(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final List<Province> provinces = snapshot.data!;
                        final List<String> provinceNames =
                            provinces.map((province) => province.province_name ?? "").toList();

                        // Remove duplicate entries using Set
                        final uniqueProvinceNames = provinceNames.toSet().toList();

                        return DropdownButton<String>(
                          menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                          hint: Text("Province"),
                          value: selectedProvince?.province_name,
                          onChanged: (name) {
                            setState(() {
                              selectedProvince = provinces
                                  .firstWhere((province) => province.province_name == name);
                              selectedDistrict = null;
                              selectedWard = null;
                            });

                            if (selectedProvince != null && selectedProvince is Province) {
                              setState(() {
                                newProvince = selectedProvince?.province_name ?? "";
                                provinceId = selectedProvince?.province_id;
                              });
                            }
                          },
                          items: uniqueProvinceNames
                              .map((name) => DropdownMenuItem(
                                    value: name,
                                    child: Text(name),
                                  ))
                              .toList(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Error: ${snapshot.error}"));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  const SizedBox(height: 16.0),

                  provinceId == ""
                      ? Text("Ban phai chon thanh pho")
                      : FutureBuilder<List<District>>(
                          future: addressViewModel.getDistrict("$provinceId"),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final List<District> districts = snapshot.data!;
                              final List<String> districtNames = districts
                                  .map((district) => district.district_name ?? "")
                                  .toList();
                              return DropdownButton<String>(
                                menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                                hint: Text("District"),
                                value: selectedDistrict?.district_name,
                                onChanged: (name) {
                                  setState(() {
                                    selectedDistrict = districts
                                        .firstWhere((district) => district.district_name == name);
                                    selectedWard = null;
                                  });

                                  if (selectedDistrict != null && selectedDistrict is District) {
                                    setState(() {
                                      newDistrict = selectedDistrict?.district_name ?? "";
                                      districtId = selectedDistrict?.district_id;
                                    });
                                  }
                                },
                                items: districtNames
                                    .map((name) => DropdownMenuItem(
                                          value: name,
                                          child: Text(name),
                                        ))
                                    .toList(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(child: Text("Error: ${snapshot.error}"));
                            } else {
                              return const Center(child: CircularProgressIndicator());
                            }
                          },
                        ),

                  const SizedBox(height: 16.0),

                  districtId == ""
                      ? Text("Ban phai chon quan")
                      : FutureBuilder<List<Ward>>(
                          future: addressViewModel.getWard("$districtId"),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final List<Ward> wards = snapshot.data!;
                              final List<String> wardNames =
                                  wards.map((ward) => ward.ward_name ?? "").toList();

                              // Store the selected district name instead of province name
                              String? selectedWardName = selectedWard?.ward_name ?? wardNames.first;

                              return DropdownButton<String>(
                                menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                                hint: Text("District"),
                                value: selectedWardName,
                                onChanged: (name) {
                                  setState(() {
                                    selectedWard =
                                        wards.firstWhere((ward) => ward.ward_name == name);
                                  });

                                  if (selectedDistrict != null && selectedDistrict is District) {
                                    setState(() {
                                      newDistrict = selectedDistrict?.district_name ?? "";
                                      districtId = selectedDistrict?.district_id;
                                    });
                                  }
                                },
                                items: wardNames
                                    .map((name) => DropdownMenuItem(
                                          value: name,
                                          child: Text(name),
                                        ))
                                    .toList(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(child: Text("Error: ${snapshot.error}"));
                            } else {
                              return const Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                  const SizedBox(height: 16.0),
                  TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Address Details',
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckBox(text: 'Set default address'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Save'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      ),
                    ),
                    SizedBox(width: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ),
                        );
                      },
                      child: Text('Close'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
