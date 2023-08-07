import 'package:flutter/material.dart';
import 'package:mobile_store/main.dart';
import 'package:mobile_store/src/features/address/view/add_address.dart';
import 'package:mobile_store/src/features/address/view/get_address.dart';

import '../../../constant/color/color.dart';
import '../../change_password/view/change_password_screen.dart';
import '../widget/edit_information_form.dart';

class YourInformation extends StatefulWidget {
  const YourInformation({Key? key}) : super(key: key);

  @override
  State<YourInformation> createState() => _YourInformationState();
}

class _YourInformationState extends State<YourInformation> {
  String genderText() {
    String gender;
    if (getUser.userDTO.gender == 0) {
      gender = 'Male';
    } else if (getUser.userDTO.gender == 1) {
      gender = 'Female';
    } else {
      gender = 'Other';
    }
    return gender;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.015,
                horizontal: MediaQuery.of(context).size.width * 0.03,
              ),
              width: MediaQuery.of(context).size.width * 1,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.015),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('INFORMATION',
                              style: TextStyle(fontSize: 18)),
                          InkWell(
                            onTap: () async {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return EditInformationForm(
                                      fullName: getUser.userDTO.fullName,
                                      email: getUser.userDTO.email,
                                      selectedDate: getUser.userDTO.birthday,
                                      selectedGender: getUser.userDTO.gender);
                                },
                              );
                            },
                            child: Image.asset(
                              'assets/icon/edit_icon.png',
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                          )
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icon/account_icon.jpg',
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Flexible(
                                    child: Text(
                                  '${getUser.userDTO.fullName}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ))
                              ],
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icon/calendar_icon.png',
                                  height: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(getUser.userDTO.birthday ?? "Chưa có")
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/icon/gender_icon.png',
                                  height: MediaQuery.of(context).size.height *
                                      0.028,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(genderText()),
                              ],
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: MediaQuery.of(context).size.height * 0.4,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/icon/gmail_icon.png',
                                    height: MediaQuery.of(context).size.height * 0.02,
                                  ),
                                  const SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      '${getUser.userDTO.email}',
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const ChangePasswordScreen();
                              },
                            );
                          },
                          child: const Text('Change password')),
                    ],
                  )
                ],
              ),
            ),
            const Divider(color: kWhiteGrey, thickness: 10),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.015,
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.015),
                      width: MediaQuery.of(context).size.width * 1,
                      child: const Text('ADDRESS',
                          style: TextStyle(fontSize: 18))),
                  const GetAddressScreen(),
                  Row(
                    children: [
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AddAddressScreen();
                              },
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: const Text('Add'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget personalInformation(String title, String information) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Text('$title:'),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(information),
        ),
      ],
    );
  }
}
