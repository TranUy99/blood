import 'dart:developer';

import 'package:mobile_store/main.dart';
import 'package:flutter/material.dart';
import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/features/address/view/add_address.dart';
import 'package:mobile_store/src/features/profile/view_model/profile_view_model.dart';
import 'package:mobile_store/src/features/profile/widget/edit_information_form.dart';
import '../../../constant/color/color.dart';
import '../../change_password/view/change_password.dart';

class YourInformation extends StatefulWidget {
  const YourInformation({Key? key}) : super(key: key);

  @override
  State<YourInformation> createState() => _YourInformationState();
}

class _YourInformationState extends State<YourInformation> {


  final ProfileViewModel _profileViewModel = ProfileViewModel();
  String? _selectedDate;
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
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.015),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('INFORMATION', style: TextStyle(fontSize: 18)),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return EditInfomationForm(getUser.userDTO.fullName,
                                      getUser.userDTO.email, getUser.userDTO.gender, _selectedDate);
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
                                  height: MediaQuery.of(context).size.height * 0.03,
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
                                  height: MediaQuery.of(context).size.height * 0.025,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('${getUser.userDTO.birthday ?? "Chưa có"}')
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
                                  'assets/icon/male_icon.png',
                                  height: MediaQuery.of(context).size.height * 0.028,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text('Male'),
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
                          child: Text('Change password')),
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
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.015),
                      width: MediaQuery.of(context).size.width * 1,
                      child: const Text('ADDRESS', style: TextStyle(fontSize: 18))),
                  addressInformation(),
                  Row(
                    children: [
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const EditAddressScreen();
                              },
                            );
                          },
                          child: Text('Add'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          ),
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
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Text('$title:'),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(information),
        ),
      ],
    );
  }

  Widget addressInformation() {
    return FutureBuilder<List<Address>>(
        future: _profileViewModel.getAddress(),
        builder: (context, snapshot) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Column(
                      children: [
                        Container(
                          child: Text('Tran Ky Anh | 0583841958'),
                          width: MediaQuery.of(context).size.width * 1,
                        ),
                        Container(
                          child: Text('1164 Phạm Văn Đồng'),
                          width: MediaQuery.of(context).size.width * 1,
                        ),
                        Container(
                          child: Text('Linh Trung ward, Thu Duc distric, Ho Chi Minh City'),
                          width: MediaQuery.of(context).size.width * 1,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                side: const BorderSide(width: 1, color: Colors.green),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 0.1,
                                  horizontal: 14,
                                ),
                              ),
                              child: Text(
                                'Default',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                side: BorderSide(width: 1, color: Colors.orange),
                                padding: EdgeInsets.symmetric(
                                  vertical: 0.1,
                                  horizontal: 12,
                                ),
                              ),
                              child: Text(
                                'Home',
                                style: TextStyle(
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: Wrap(
                      spacing: MediaQuery.of(context).size.width * 0.05,
                      children: [
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return EditAddressScreen();
                              },
                            );
                          },
                          child: Image.asset(
                            'assets/icon/edit_icon.png',
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            'assets/icon/delete_icon.png',
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    thickness: MediaQuery.of(context).size.height * 0.004,
                  ),
                ],
              );
            },
          );
        });
  }
}
