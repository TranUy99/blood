import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/constant/utils/validate.dart';
import 'package:mobile_store/src/core/model/district.dart';
import 'package:mobile_store/src/core/model/province.dart';
import 'package:mobile_store/src/core/model/ward.dart';
import 'package:mobile_store/src/features/address/view_model/address_view_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddAddressScreenState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  TextEditingController textAddressController = TextEditingController();
  TextEditingController textPhoneController = TextEditingController();
  TextEditingController textNameController = TextEditingController();
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
  bool errorAddress = false;
  String errorAddressText = '';
  bool errorPhone = false;
  String errorPhoneText = '';
  bool errorName = false;
  String errorNameText = '';

  final AddressViewModel _addressViewModel = AddressViewModel();

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
        final double maxHeight = MediaQuery.of(context).size.height * 0.7;
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
                          const SizedBox(
                            width: 6,
                          ),
                          const Text('OFFICE'),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 5),

                  //get province
                  FutureBuilder<List<Province>>(
                    future: _addressViewModel.getProvince(),
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

                  //get district
                  provinceId == ""
                      ? Text("Ban phai chon thanh pho")
                      : FutureBuilder<List<District>>(
                          future: _addressViewModel.getDistrict("$provinceId"),
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

                  //get ward
                  districtId == ""
                      ? Text("Ban phai chon quan")
                      : FutureBuilder<List<Ward>>(
                          future: _addressViewModel.getWard("$districtId"),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final List<Ward> wards = snapshot.data!;
                              final List<String> wardNames =
                                  wards.map((ward) => ward.ward_name ?? "").toList();

                              return DropdownButton<String>(
                                menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                                hint: Text("Ward"),
                                value: selectedWard?.ward_name,
                                onChanged: (name) {
                                  setState(() {
                                    selectedWard =
                                        wards.firstWhere((ward) => ward.ward_name == name);
                                  });

                                  if (selectedWard != null && selectedWard is Ward) {
                                    setState(() {
                                      newWard = selectedWard?.ward_name ?? "";
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

                  TextFormField(
                    controller: textAddressController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorText: errorAddress ? errorAddressText : null,
                      hintText: "Nhan dia chi cua ban",
                      hintStyle: const TextStyle(color: kTextFieldColor),
                      focusedBorder:
                          const UnderlineInputBorder(borderSide: BorderSide(color: kGreenColor)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          errorAddress = true;
                          errorAddressText = 'Địa chỉ không được để trống';
                        } else if (value.startsWith(' ')) {
                          errorAddress = true;
                          errorAddressText = 'Không có dấu cách ở đầu';
                        } else if (value.endsWith(' ')) {
                          errorAddress = true;
                          errorAddressText = 'Không có dấu cách cuối';
                        } else {
                          errorAddress = false;
                          errorAddressText = '';
                        }
                      });
                    },
                  ),
                  TextFormField(
                    controller: textNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorText: errorName ? errorNameText : null,
                      hintText: "Nhan tên người nhận",
                      hintStyle: const TextStyle(color: kTextFieldColor),
                      focusedBorder:
                          const UnderlineInputBorder(borderSide: BorderSide(color: kGreenColor)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty || Validate.validName(value)) {
                          errorName = true;
                          errorNameText = value.isEmpty
                              ? 'Tên không được để trống'
                              : value.startsWith(' ')
                                  ? 'Không có dấu cách ở đầu'
                                  : value.endsWith(' ')
                                      ? 'Không có dấu cách cuối'
                                      : 'Không được nhập số hoặc ký tự đặc biệt';
                        } else {
                          errorName = false;
                          errorNameText = '';
                        }
                      });
                    },
                  ),
                  TextFormField(
                    controller: textPhoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      errorText: errorPhone ? errorPhoneText : null,
                      hintText: "Nhan so dien thoai cua ban",
                      hintStyle: const TextStyle(color: kTextFieldColor),
                      focusedBorder:
                          const UnderlineInputBorder(borderSide: BorderSide(color: kGreenColor)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty || Validate.invalidateMobile(value)) {
                          errorPhone = true;
                          errorPhoneText = value.isEmpty
                              ? 'Số điện thoại không được để trống'
                              : value.startsWith(' ')
                                  ? 'Không có dấu cách ở đầu'
                                  : value.endsWith(' ')
                                      ? 'Không có dấu cách cuối'
                                      : 'Số điện thoại phải 10 số';
                        } else {
                          errorPhone = false;
                          errorPhoneText = '';
                        }
                      });
                    },
                  ),

                  const SizedBox(height: 16.0),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                      onPressed: () async {
                        String addressHome = textAddressController.text;
                        String address = ('$addressHome,$newWard ,$newDistrict ,$newProvince');
                        String phone = textPhoneController.text;
                        String name = textNameController.text;
                        log("$address");

                        if (
                          addressHome.isNotEmpty &&
                            newProvince!.isNotEmpty &&
                            newWard!.isNotEmpty &&
                            newDistrict!.isNotEmpty &&
                            phone.isNotEmpty &&
                            name.isNotEmpty) {
                          final createAddress =
                              await _addressViewModel.createAddress(address, "type", phone, name);
                          if (createAddress == true) {
                            Navigator.pop(context);
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.error(
                                  message: 'Thêm địa chỉ thành công ', backgroundColor: kGreenColor),
                            );
                            // Navigator.pop(context);
                            // ignore: use_build_context_synchronously
                          } else {
                            showTopSnackBar(
                              Overlay.of(context),
                              const CustomSnackBar.error(
                                message: 'Thêm địa chỉ thất bại',
                                backgroundColor: kRedColor,
                              ),
                            );
                            // Navigator.pop(context);
                          }
                        } else {
                          showTopSnackBar(
                            Overlay.of(context),
                            const CustomSnackBar.error(
                              message: 'Vui long nhap dau tu thong tin',
                              backgroundColor: kRedColor,
                            ),
                          );
                        }
                      },
                      child: const Text('Save'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(kGreenColor),
                      ),
                    ),
                    const SizedBox(width: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(kRedColor),
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
