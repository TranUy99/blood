import 'package:flutter/material.dart';
import 'package:mobile_store/src/core/model/district.dart';

import '../view_model/address_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DistrictForm extends StatefulWidget {
  String? provinceId;
  District? selectedDistrict;

  Function(District?) onDistrictChanged;

  DistrictForm({
    required this.provinceId,
    required this.selectedDistrict,
    required this.onDistrictChanged,
  });

  @override
  _DistrictDropdownState createState() => _DistrictDropdownState();
}

class _DistrictDropdownState extends State<DistrictForm> {
  final AddressViewModel _addressViewModel = AddressViewModel();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<District>>(
      future: _addressViewModel.getDistrict(widget.provinceId!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<District> districts = snapshot.data!;
          final List<String> districtNames =
              districts.map((district) => district.district_name ?? "").toList();
          return DropdownButton<String>(
            menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
            hint: Text('${AppLocalizations.of(context)?.district}'),
            value: widget.selectedDistrict?.district_name,
            onChanged: (name) {
              setState(() {
                widget.selectedDistrict =
                    districts.firstWhere((district) => district.district_name == name);
              });

              if (widget.selectedDistrict != null && widget.selectedDistrict is District) {
                setState(() {
                  widget.onDistrictChanged(widget.selectedDistrict);
                });
              }
            },
            items: districtNames
                .map((name) => DropdownMenuItem(
                      value: name,
                      child: Text(name),
                    ))
                .toList(),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
