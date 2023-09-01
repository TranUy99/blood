import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/features/address/view_model/address_view_model.dart';
import 'package:mobile_store/src/features/cart_page/bloc/cart_bloc.dart';

class SelectedAddressCart extends StatefulWidget {
  const SelectedAddressCart({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectedAddressCart> createState() => _SelectedAddressCartState();
}

class _SelectedAddressCartState extends State<SelectedAddressCart> {
  List<Address> addressList = [];

  final AddressViewModel _addressViewModel = AddressViewModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Address>>(
      future: _addressViewModel.getAddress(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        } else {
          if (snapshot.hasData) {
            addressList = snapshot.data!;
            // final defaultAddress = addressList.firstWhere(
            //   (address) => address.defaults == true,
            // );
            return Column(children: [
              buildUI(context),
            ]);
          } else {
            return const Text('No address ');
          }
        }
      },
    );
  }

  Widget buildUI(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            AppLocalizations.of(context)!.address.toUpperCase(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        BlocBuilder<SelectedAddressCubit, int>(
          builder: (context, selectedAddressId) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: addressList.length,
              itemBuilder: (context, index) {
                final address = addressList[index];
                return RadioListTile(
                  value: address.id!,
                  groupValue: selectedAddressId,
                  onChanged: (value) {
                    setState(() {
                      selectedAddressId = value!;
                    });
                    context.read<SelectedAddressCubit>().setSelectedAddressIndex(address.id);
                  },
                  activeColor: kGreenColor,
                  title: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: address.nameReceiver,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        TextSpan(
                          text: ' | ${address.phoneReceiver}',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Text(' ${address.location}'),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
