import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../constant/color/color.dart';
import '../../home_page/view/navigation_home_page.dart';
import '../view_model/address_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DeleteAddress extends StatefulWidget {
  final int? id;
  const DeleteAddress({required this.id, super.key});

  @override
  State<DeleteAddress> createState() => _DeleteAddressState();
}

class _DeleteAddressState extends State<DeleteAddress> {
  final AddressViewModel _addressViewModel = AddressViewModel();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('${AppLocalizations.of(context)?.doYouWantToDeleteTheAddress.toUpperCase()}'),
        content: Builder(builder: (BuildContext context) {
          return Row(
            children: [
              TextButton(
                onPressed: () async {
                  final deleteAddress = await _addressViewModel.deleteAddress(widget.id);

                  if (deleteAddress == true) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NavigationHomePage(),
                      ),
                    );
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(
                        message: '${AppLocalizations.of(context)?.successfullyDeletedAddress}',
                        backgroundColor: kGreenColor,
                      ),
                    );
                  } else {
                    showTopSnackBar(
                      Overlay.of(context),
                      CustomSnackBar.error(
                        message: '${AppLocalizations.of(context)?.addressDeletionFailed}',
                        backgroundColor: kRedColor,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kGreenColor),
                ),
                child: Text('${AppLocalizations.of(context)?.yes}'),
              ),
              const SizedBox(width: 40),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kRedColor),
                ),
                child:Text('${AppLocalizations.of(context)?.no}'),
              ),
            ],
          );
        }));
  }
}
