import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class AddressBloc {
  final _selectedAddressIndexController = BehaviorSubject<int>();
  Stream<int> get selectedAddressIndexStream => _selectedAddressIndexController.stream;

  void updateSelectedAddressIndex(int index) {
    _selectedAddressIndexController.add(index);
  }

  @override
  void dispose() {
    super.dispose();
    _selectedAddressIndexController.close();
  }
}