import 'package:flutter/material.dart';

import '../../constant/colors/theme.dart';

class YourInformation extends StatefulWidget {
  const YourInformation({Key? key}) : super(key: key);

  @override
  State<YourInformation> createState() => _YourInformationState();
}

class _YourInformationState extends State<YourInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.015,
            horizontal: MediaQuery.of(context).size.width * 0.02,
          ),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(
                      bottom:
                      MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('INFORMATION', style: TextStyle(fontSize: 18)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.edit))
                    ],
                  )),
              personalInformation('Full name', 'Tran Ky Anh'),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01),
              personalInformation('Gender', 'LGBT'),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01),
              personalInformation('Date of birth', '01/01/2001'),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01),
              personalInformation('Email', 'trankyanh2510@gmail.com'),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01),
            ],
          ),
        ),
        const Divider(color: kWhiteGrey, thickness: 10),
        Container(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.015,
              horizontal: MediaQuery.of(context).size.width * 0.02),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(
                      bottom:
                      MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 1,
                  child: const Text('ADDRESS',
                      style: TextStyle(fontSize: 18))),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                color: Colors.cyanAccent,
                child: addressInformation(),
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
          color: Colors.cyanAccent,
          width: MediaQuery.of(context).size.width * 0.25,
          child: Text('$title:'),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        Container(
          color: Colors.cyanAccent,
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(information),
        ),
      ],
    );
  }

  Widget addressInformation() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
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
                child:
                Text('Linh Trung ward, Thu Duc distric, Ho Chi Minh City'),
                width: MediaQuery.of(context).size.width * 1,
              )
            ],
          ),
          trailing: Wrap(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete))
            ],
          ),
        );
      },
      itemCount: 5,
    );
  }
}
