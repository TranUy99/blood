import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/district.dart';
import 'package:mobile_store/src/core/model/province.dart';
import 'package:mobile_store/src/core/model/ward.dart';
import 'package:mobile_store/src/features/address/view_model/address_view_model.dart';
import 'package:mobile_store/src/features/home_page/view/navigation_home_page.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../widget/address_district.dart';
import '../widget/address_form.dart';
import '../widget/address_name_form.dart';
import '../widget/address_province.dart';
import '../widget/addresss_phone.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class ChangeAddressScreen extends StatefulWidget {
  String? name;
  String? phone;
  String? address;
  int? id;
  String? locationType;
  ChangeAddressScreen(
      {super.key,
      required this.name,
      required this.phone,
      required this.address,
      required this.id,
      required this.locationType});

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  TextEditingController textAddressController = TextEditingController();
  TextEditingController textPhoneController = TextEditingController();
  TextEditingController textNameController = TextEditingController();
  List<Province> provinceList = [];

  Province? selectedProvince;
  String? provinceId = "";
  List<District> districtList = [];

  District? selectedDistrict;
  String? districtId = "";
  List<Ward> wardList = [];
  String? wardId = "";
  Ward? selectedWard;
  bool errorAddress = false;
  String errorAddressText = '';
  bool errorPhone = false;
  String errorPhoneText = '';
  bool errorName = false;
  String errorNameText = '';
  bool isDefault = true;
  final AddressViewModel _addressViewModel = AddressViewModel();
  String provinceName = "";
  String districtName = "";
  String? wardName;
  String? locationType;

  @override
  void initState() {
    super.initState();
    textNameController.text = '${widget.name}';
    textPhoneController.text = '${widget.phone}';
    locationType = widget.locationType;
    String location = widget.address ?? "";
    List<String> locationParts = location.split(", ");
    String address = locationParts[0];
    int start = 0;
    int end = address.indexOf(",");
    String extractedAddress = address.substring(start, end).trim();

    textAddressController.text = extractedAddress;

    List<String> addressParts = address.split(",");
    provinceName = addressParts.last.trim();
    districtName = addressParts[2].trim();
    wardName = addressParts[1].trim();
    _getProvinces();
  }

  // Hàm để lấy danh sách tỉnh/thành phố

  Future<void> _getProvinces() async {
    try {
      List<Province> provinces = await _addressViewModel.getProvince();
      setState(() {
        provinceList = provinces;
        selectedProvince = provinceList.firstWhere(
          (province) => province.province_name == provinceName,
        );
        if (selectedProvince != null) {
          provinceId = selectedProvince?.province_id;
          _getDistricts(provinceId!);
        }
      });
    } catch (error) {
      print("Error fetching provinces: $error");
    }
  }

  Future<void> _getDistricts(String provinceId) async {
    try {
      if (provinceId != "" && provinceId.isNotEmpty) {
        List<District> districts = await _addressViewModel.getDistrict(provinceId);
        setState(() {
          districtList = districts;
          selectedDistrict = districtList.firstWhere(
            (district) => district.district_name == districtName,
          );
          if (selectedDistrict != null) {
            districtId = selectedDistrict?.district_id;
            _getWards(districtId!);
          }
        });
      }
    } catch (error) {
      print("Error fetching districts: $error");
    }
  }

  Future<void> _getWards(String districtId) async {
    try {
      if (districtId != "" && districtId.isNotEmpty) {
        List<Ward> wards = await _addressViewModel.getWard(districtId);
        setState(() {
          wardList = wards;
          selectedWard = wardList.firstWhere(
            (ward) => ward.ward_name == wardName,
          );
          if (selectedWard != null) {
            wardId = selectedWard?.ward_id;
          }
        });
      }
    } catch (error) {
      print("Error fetching districts: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Builder(builder: (BuildContext context) {
        final double maxHeight = MediaQuery.of(context).size.height * 0.72;
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
                    child: Text('${AppLocalizations.of(context)?.deliveryAddress.toUpperCase()}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (locationType == null) {
                              locationType = 'home';
                            } else if (locationType != 'home') {
                              locationType = 'home';
                            } else {
                              locationType = null;
                            }
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      (locationType == 'home') ? kGreenColor : Colors.transparent),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icon/home_icon.png',
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text('${AppLocalizations.of(context)?.home}'.toUpperCase()),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (locationType == null) {
                              locationType = 'office';
                            } else if (locationType != 'office') {
                              locationType = 'office';
                            } else {
                              locationType = null;
                            }
                          });
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: (locationType == 'office')
                                      ? kGreenColor
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icon/office_icon.png',
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text('${AppLocalizations.of(context)?.office}'.toUpperCase()),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),

                  //get province
                  provinceList.isNotEmpty
                      ? ProvinceForm(
                          provinceList: provinceList,
                          selectedProvince: selectedProvince,
                          selectedDistrict: selectedDistrict,
                          selectedWard: selectedWard,
                          onProvinceChanged: (province) {
                            setState(() {
                              selectedProvince = province;
                              provinceName = province!.province_name!;
                              provinceId = province.province_id!;
                            });
                          },
                        )
                      : const Center(child: CircularProgressIndicator()),

                  const SizedBox(height: 16.0),

                  //get district
                  provinceId == ""
                      ? Text("${AppLocalizations.of(context)?.youMustChooseACity}")
                      : DistrictForm(
                          provinceId: provinceId,
                          selectedDistrict: selectedDistrict,
                          onDistrictChanged: (district) {
                            // Xử lý khi người dùng thay đổi quận/huyện
                            selectedDistrict = district;
                          },
                        ),

                  const SizedBox(height: 16.0),

                  //get ward
                  districtId == ""
                      ? Text("${AppLocalizations.of(context)?.youMustChooseADistrict}")
                      : FutureBuilder<List<Ward>>(
                          future: _addressViewModel.getWard("$districtId"),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final List<Ward> wards = snapshot.data!;
                              final List<String> wardNames =
                                  wards.map((ward) => ward.ward_name ?? "").toList();

                              return DropdownButton<String>(
                                menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
                                hint: Text("${AppLocalizations.of(context)?.ward}"),
                                value: selectedWard?.ward_name,
                                onChanged: (name) {
                                  setState(() {
                                    selectedWard =
                                        wards.firstWhere((ward) => ward.ward_name == name);
                                  });

                                  if (selectedWard != null && selectedWard is Ward) {
                                    setState(() {
                                      wardName = selectedWard?.ward_name ?? "";
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
                  ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 20.0,
                    activeBgColors: [
                      [Colors.green[800]!],
                      [Colors.red[800]!]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: isDefault ? 0 : 1,
                    totalSwitches: 2,
                    labels: ['Default', 'No dault'],
                    radiusStyle: true,
                    onToggle: (index) {
                      setState(() {
                        isDefault = index == 0;
                      });
                    },
                  ),
                  BuildAddressForm(
                    textAddressController: textAddressController,
                    onAddressChanged: (bool) {
                      setState(() {
                        errorAddress = bool;
                      });
                    },
                  ),
                  BuildNameAddressForm(
                    textNameController: textNameController,
                    onNameChanged: (bool) {
                      setState(() {
                        errorName = bool;
                      });
                    },
                  ),
                  BuildAddressPhoneForm(
                    textPhoneController: textPhoneController,
                    onPhoneChanged: (bool) {
                      setState(() {
                        errorName = bool;
                      });
                    },
                  ),

                  const SizedBox(height: 16.0),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                      onPressed: () async {
                        String addressHome = textAddressController.text;
                        String address = ('$addressHome,$wardName ,$districtName ,$provinceName');
                        String phone = textPhoneController.text;
                        String name = textNameController.text;

                        log('$errorName');

                        if (addressHome.isNotEmpty &&
                            wardName!.isNotEmpty &&
                            districtName.isNotEmpty &&
                            provinceName.isNotEmpty &&
                            phone.isNotEmpty &&
                            name.isNotEmpty &&
                            errorAddress == false &&
                            errorName == false &&
                            errorPhone == false &&
                            locationType!.isNotEmpty) {
                          final createAddress = await _addressViewModel.changeAddress(
                              address, locationType!, phone, name, widget.id, isDefault);

                          if (createAddress == true) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NavigationHomePage(),
                              ),
                            );
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.error(
                                  message: '${AppLocalizations.of(context)?.addSuccessfulAddress} ',
                                  backgroundColor: kGreenColor),
                            );
                          } else {
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.error(
                                message: '${AppLocalizations.of(context)?.addFailedAddress} ',
                                backgroundColor: kRedColor,
                              ),
                            );
                            // Navigator.pop(context);
                          }
                        } else {
                          showTopSnackBar(
                            Overlay.of(context),
                            CustomSnackBar.error(
                              message:
                                  '${AppLocalizations.of(context)?.pleaseEnterFullInformation} ',
                              backgroundColor: kRedColor,
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(kGreenColor),
                      ),
                      child: Text("${AppLocalizations.of(context)?.save}"),
                    ),
                    const SizedBox(width: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(kRedColor),
                      ),
                      child: Text("${AppLocalizations.of(context)?.close}"),
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
