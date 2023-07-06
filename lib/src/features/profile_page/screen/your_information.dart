import 'package:flutter/material.dart';
import 'package:mobile_store/src/features/profile_page/widget/edit_address.dart';
import 'package:mobile_store/src/features/profile_page/widget/edit_information_form.dart';
import '../../../constant/theme/theme.dart';
import '../../change_password/view/change_password.dart';

class YourInformation extends StatefulWidget {
  const YourInformation({Key? key}) : super(key: key);

  @override
  State<YourInformation> createState() => _YourInformationState();
}

class _YourInformationState extends State<YourInformation> {
  var home;
  // final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _dateOfbirthController = TextEditingController();
  // late DateTime _selectedDate;
  final TextEditingController _selectedGenderController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  // late String _selectedGender;
  // String? _selectedGender;
  String? _selectedDate;

  var _phoneNumber;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return EditInfomationForm(
                                    _phoneNumber,
                                    _nameController,
                                    _emailController,
                                    _selectedGenderController,
                                    _selectedDate);
                              },
                            );
                          },
                          child: Image.asset(
                            'images/edit.png',
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
                                'images/phone.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                  'Phone number ${_phoneNumberController.text}'),
                            ],
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Image.asset(
                                'images/account_icon.jpg',
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text('Full name ${_nameController.text}'),
                            ],
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Image.asset(
                                'images/calendar.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('01/01/2001 '),
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
                                'images/male.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.028,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text('Male'),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Image.asset(
                                'images/gmail_icon.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              SizedBox(width: 5),
                              Text('Email ${_emailController.text}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ChangePasswordScreen();
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
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    width: MediaQuery.of(context).size.width * 1,
                    child:
                        const Text('ADDRESS', style: TextStyle(fontSize: 18))),
                addressInformation(),
                Row(
                  children: [
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return EditAddressScreen();
                            },
                          );
                        },
                        child: Text('Add'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
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
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
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
                    child: Text(
                        'Linh Trung ward, Thu Duc distric, Ho Chi Minh City'),
                    width: MediaQuery.of(context).size.width * 1,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          side: BorderSide(width: 1, color: Colors.green),
                          padding: EdgeInsets.symmetric(
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
                      'images/edit.png',
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'images/delete.png',
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
      itemCount: 2,
    );
  }

  // @override
  // void _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //   );
  //   if (picked != null) {
  //     setState(() {
  //       _selectedDate = picked.toString();
  //       // _dateOfbirthController.text = picked.toString();
  //     });
  //   }
  // }

  // @override
  // void dispose() {
  //   _dateOfbirthController.dispose();
  //   super.dispose();
  // }
}
