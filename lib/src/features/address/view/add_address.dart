import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/district.dart';
import 'package:mobile_store/src/core/model/province.dart';
import 'package:mobile_store/src/core/model/ward.dart';
import 'package:mobile_store/src/features/address/view_model/address_view_model.dart';
import 'package:mobile_store/src/features/home_page/view/navigation_home_page.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../constant/utils/validate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widget/address_form.dart';
import '../widget/address_name_form.dart';
import '../widget/addresss_phone.dart';

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
  String locationType = 'home';

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
          width: MediaQuery.of(context).size.width * 0.8,
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
                            if(locationType != 'home'){
                              locationType = 'home';
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
                            if(locationType != 'office'){
                              locationType = 'office';
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
                          hint: Text("${AppLocalizations.of(context)?.province}"),
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
                      ? Text("${AppLocalizations.of(context)?.youMustChooseACity}")
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
                                hint: Text("${AppLocalizations.of(context)?.district}"),
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
                                      newWard = selectedWard?.ward_name ?? "";
                                    });
                                  }
                                },
                                items: wardNames
                                    .map((name) => DropdownMenuItem(value: name, child: Text(name)))
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
                        String address = ('$addressHome,$newWard ,$newDistrict ,$newProvince');
                        String phone = textPhoneController.text;
                        String name = textNameController.text;
                        if (addressHome.isNotEmpty &&
                            newProvince!.isNotEmpty &&
                            newWard!.isNotEmpty &&
                            newDistrict!.isNotEmpty &&
                            phone.isNotEmpty &&
                            name.isNotEmpty &&
                            errorAddress == false &&
                            errorName == false &&
                            errorPhone == false &&
                            locationType != null) {
                          final createAddress = await _addressViewModel.createAddress(
                              address, locationType!, phone, name);

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
                                message: '${AppLocalizations.of(context)?.addFailedAddress}',
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
                                  '${AppLocalizations.of(context)?.pleaseEnterFullInformation}',
                              backgroundColor: kRedColor,
                            ),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(kGreenColor),
                      ),
                      child: Text('${AppLocalizations.of(context)?.save}'),
                    ),
                    const SizedBox(width: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(kRedColor),
                      ),
                      child: Text('${AppLocalizations.of(context)?.close}'),
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
