import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/login_outPage/screen/change_password.dart';

import '../../../constant/colors/theme.dart';

class YourInformation extends StatefulWidget {
  const YourInformation({Key? key}) : super(key: key);

  @override
  State<YourInformation> createState() => _YourInformationState();
}

class _YourInformationState extends State<YourInformation> {
  var home;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      const Text('INFORMATION', style: TextStyle(fontSize: 18)),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'images/edit.png',
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                      )
                    ],
                  )),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      children: [
                        Text(''),
                        Text('Tran Ky Anh'),
                        Text('01/01/2001'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      children: [
                        Text('0583841958'),
                        Text('Tran Ky Anh'),
                        Text('01/01/2001'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangePasswordScreen(),
                          ),
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
                  child: const Text('ADDRESS', style: TextStyle(fontSize: 18))),
              addressInformation(),
              Row(
                children: [
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Add'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
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
                  )
                ],
              ),
              trailing: Wrap(
                spacing: MediaQuery.of(context).size.width * 0.05,
                children: [
                  InkWell(
                    onTap: () {},
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
}
