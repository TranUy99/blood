import 'package:flutter/material.dart';
import 'package:mobile_store/src/constant/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressInfo extends StatelessWidget {
  final int selectedAddressIndex;
  final List<String> addresses;
  final Function(int) onAddressSelected;

  const AddressInfo({
    Key? key,
    required this.selectedAddressIndex,
    required this.addresses,
    required this.onAddressSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
              AppLocalizations.of(context)!.address.toUpperCase(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: addresses.length,
          itemBuilder: (context, index) {
            return RadioListTile(
              value: index,
              groupValue: selectedAddressIndex,
              onChanged: (int? value) {
                onAddressSelected(value!);
              },
              activeColor: kGreenColor,
              title: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: addresses[index].split('|')[0].trim(),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: ' | ${addresses[index].split('|')[1].trim()}',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextButton(
            onPressed: () {
              // Xử lý sự kiện khi người dùng nhấn vào nút "Thêm địa chỉ khác"
            },
            child: Text(
              //'Add another address',
              AppLocalizations.of(context)!.anotheraddress,
              style: const TextStyle(
                fontSize: 14,
                color: kGreenColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
