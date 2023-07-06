// ignore_for_file: dead_code
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditInfomationForm extends StatefulWidget {
  EditInfomationForm(
      TextEditingController phoneNumberController,
      TextEditingController nameController,
      TextEditingController emailController,
      TextEditingController selectedGenderController,
      String? selectedDate);

  @override
  _EditInfomationFormState createState() => _EditInfomationFormState();
}

class _EditInfomationFormState extends State<EditInfomationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateOfbirthController = TextEditingController();
  late DateTime _selectedDate;
  final TextEditingController _selectedGenderController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  // late String _selectedGender;
  String? _selectedGender;

  var child;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dateOfbirthController.dispose();
    _selectedGenderController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.005),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.005),
              child: Text('Edit information',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Number phone',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter number phone';
                      }
                      return null;
                    },
                  ),
                )),
              ],
            ),
            SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Full name',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter full name';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter email';
                        }
                        if (!value.contains('@gmail.com')) {
                          return 'Email address is not valid';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: TextFormField(
                      controller: TextEditingController(
                          // ignore: unnecessary_null_comparison
                          ),
                      decoration: InputDecoration(
                        labelText: 'Date of birth',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        await _selectedDate;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select date of birth';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: DropdownButtonFormField<String>(
                      value: _selectedGender,
                      onChanged: (value) =>
                          setState(() => _selectedGender = value),
                      decoration: InputDecoration(
                        hintText: 'Gender',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        DropdownMenuItem(
                          value: 'Male',
                          child: Text('Male'),
                        ),
                        DropdownMenuItem(
                          value: 'Female',
                          child: Text('Female'),
                        ),
                        DropdownMenuItem(
                          value: 'Other',
                          child: Text('Other'),
                        ),
                      ],
                      validator: (value) {
                        if (value == null) {
                          return 'Please select gender';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ]),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
            child: Text('Save'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final name = _nameController.text;
                final email = _emailController.text;
                final dateOfBirth = _dateOfbirthController.text;
                // '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
                final gender = _selectedGenderController.text;
                final phoneNumber = _phoneNumberController.text;
                print('Name: $name');
                print('Email: $email');
                print('Date: $dateOfBirth');
                print('Gender: $gender');
                print('Phone number: $phoneNumber');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please fill in all required fields')),
                );
              }
              Navigator.of(context).pop();
            }),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
        ),
      ],
    );
    @override
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null) {
        setState(() {
          _selectedDate = picked;
          _dateOfbirthController.text =
              '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
        });
      }
    }
  }
}
