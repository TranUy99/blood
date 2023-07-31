import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/features/address/view/add_address.dart';
import 'package:mobile_store/src/features/address/view_model/address_view_model.dart';

class GetAddressScreen extends StatefulWidget {
  const GetAddressScreen({super.key});

  @override
  State<GetAddressScreen> createState() => _GetAddressScreenState();
}

class _GetAddressScreenState extends State<GetAddressScreen> {
  final AddressViewModel _addressViewModel = AddressViewModel();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Address>>( 
        stream: _addressViewModel.getAddress(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 1,
                            child: Text(
                                '${snapshot.data![index].nameReceiver} | ${snapshot.data![index].phoneReceiver}'),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 1,
                            child: Text('${snapshot.data![index].location}'),
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
                                child: const Text(
                                  'Default',
                                  style: TextStyle(
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  side: const BorderSide(width: 1, color: kOrange),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 0.1,
                                    horizontal: 12,
                                  ),
                                ),
                                child: const Text(
                                  'Home',
                                  style: TextStyle(
                                    color: kOrange,
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
                                  return const AddAddressScreen();
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
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
