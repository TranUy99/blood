import 'package:flutter/material.dart';

import '../../../core/model/district.dart';
import '../../../core/model/province.dart';
import '../../../core/model/ward.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ProvinceForm extends StatefulWidget {
  List<Province> provinceList;
  Province? selectedProvince;
  District? selectedDistrict;
  Ward? selectedWard;
  Function(Province?) onProvinceChanged;
  ProvinceForm(
      {Key? key,
      required this.provinceList,
      required this.selectedProvince,
      required this.onProvinceChanged,
      required this.selectedDistrict,
      required this.selectedWard})
      : super(key: key);

  @override
  State<ProvinceForm> createState() => _ProvinceState();
}

class _ProvinceState extends State<ProvinceForm> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      menuMaxHeight: MediaQuery.of(context).size.height * 0.5,
      hint:  Text('${AppLocalizations.of(context)?.province}'),
      value: widget.selectedProvince?.province_name,
      onChanged: (name) {
        setState(() {
          widget.selectedProvince =
              widget.provinceList.firstWhere((province) => province.province_name == name);
          widget.selectedDistrict = null;
          widget.selectedWard = null;
        });

        if (widget.selectedProvince != null && widget.selectedProvince is Province) {
          setState(() {
            widget.onProvinceChanged(widget.selectedProvince);
          });
        }
      },
      items: widget.provinceList
          .map((province) => DropdownMenuItem(
                value: province.province_name,
                child: Text(province.province_name!),
              ))
          .toList(),
    );
  }
}
