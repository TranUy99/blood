import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/color/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_store/src/core/model/address.dart';
import 'package:mobile_store/src/features/address/view_model/address_view_model.dart';

class SelectedAddressCart extends StatefulWidget {
  final int? selectedAddressIndex;
  final Function(int?) onAddressSelected;

  const SelectedAddressCart({
    Key? key,
    required this.selectedAddressIndex,
    required this.onAddressSelected,
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
            // Build UI using the retrieved products
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
          child: Text(AppLocalizations.of(context)!.address.toUpperCase(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: addressList.length,
          itemBuilder: (context, index) {
            addressList[index].defaults;
            return RadioListTile(
              value: addressList[index].id!,
              groupValue: widget.selectedAddressIndex,
              onChanged: (int? value) {
                widget.onAddressSelected(value!);
              },
              activeColor: kGreenColor,
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: addressList[index].nameReceiver,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: ' | ${addressList[index].phoneReceiver}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              subtitle: Text(' ${addressList[index].location}'),
            );
          },
        ),
      ],
    );
  }
}
