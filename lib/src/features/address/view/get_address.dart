import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/features/address/view/change_address.dart';
import 'package:mobile_store/src/features/address/view/delete_address.dart';
import 'package:mobile_store/src/features/address/view_model/address_view_model.dart';

class GetAddressScreen extends StatefulWidget {
  const GetAddressScreen({super.key});

  @override
  State<GetAddressScreen> createState() => _GetAddressScreenState();
}

class _GetAddressScreenState extends State<GetAddressScreen> {
  List<Address> addressList = [];
  final AddressViewModel _addressViewModel = AddressViewModel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Address>>(
      future: _addressViewModel.getAddress(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Container();
        } else {
          if (snapshot.hasData) {
            addressList = snapshot.data!;
            // Build UI using the retrieved products
            return buildUI(context);
          } else {
            return  Container();
          }
        }
      },
    );
  }

  Widget buildUI(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: addressList.length,
      itemBuilder: (context, index) {
        Address address = addressList[index];
        return Column(
          children: [
            ListTile(
              title: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Text('${address.nameReceiver} | ${address.phoneReceiver}'),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Text('${address.location}'),
                  ),
                  const SizedBox(height: 4),
                  
                    Row(
                      children: [
                        if (address.defaults == true)
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: kDarkGreyColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              side: const BorderSide(width: 1, color: Colors.green),
                              padding: const EdgeInsets.symmetric(
                                vertical: 0.1,
                                horizontal: 14,
                              ),
                            ),
                            child: const Text(
                              'Default',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                        if(address.locationType != '')
                        Container(
                          width: 70,
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: kOrange),
                            color: kDarkGreyColor
                          ),
                          child: Center(
                              child: Text(
                            '${address.locationType?.toUpperCase()}',
                            style: TextStyle(color: kOrange, fontWeight: FontWeight.bold),
                          )),
                        )
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
                          return ChangeAddressScreen(
                              name: address.nameReceiver,
                              phone: address.phoneReceiver,
                              address: address.location,
                              id: address.id, locationType: address.locationType,);
                        },
                      );
                    },
                    child: Image.asset(
                      'assets/icon/edit_icon.png',
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DeleteAddress(id: address.id);
                        },
                      );
                    },
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
  }
}
