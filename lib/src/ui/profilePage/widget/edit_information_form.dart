import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/primary_button.dart';
import 'package:mobile_store/src/ui/profilePage/screen/profile_page.dart';

class EditInfomationForm extends StatefulWidget {
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
    Padding padding2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your information'),
        backgroundColor: Color.fromARGB(122, 31, 254, 86),
      ),
      body: padding2 = Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.03),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.015),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      labelText: 'Number phone',
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Full name',
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
                const SizedBox(width: 1),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DropdownButtonFormField<String>(
                      value: _selectedGender,
                      onChanged: (value) =>
                          setState(() => _selectedGender = value),
                      decoration: InputDecoration(
                        hintText: 'Gender',
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
            SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: _dateOfbirthController,
                      decoration: InputDecoration(
                        labelText: 'Date of birth',
                        suffixIcon: GestureDetector(onTap: () async {
                          DateTime? selectedDate = await _selectedDate;
                          if (selectedDate != null) {
                            setState(() {
                              _dateOfbirthController.text =
                                  DateFormat('dd/MM/yyyy').format(selectedDate);
                            });
                          }
                        }),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please select date of birth';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(width: 1),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Submit the form
                      // Handle the form data here
                      final phone = _phoneNumberController.text;
                      final name = _nameController.text;
                      final email = _emailController.text;
                      final dateOfBirth = _dateOfbirthController.text;
                      // '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
                      final gender = _selectedGenderController.text;
                      print('Number phone: $phone');
                      print('Name: $name');
                      print('Email: $email');
                      print('Date of birth: $dateOfBirth');
                      print('Gender: $gender');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please fill in all required fields')),
                      );
                    }
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ProfilePage()),
                    // );
                  },
                  child: Text('Save'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: Text('Cancel'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //         // GestureDetector(
  //         //   onTap: () => _selectDate(context),
  //         //   child: AbsorbPointer(
  //         //     child: TextFormField(
  //         //       decoration: InputDecoration(
  //         //         labelText: 'Date of birth',
  //         //       ),
  //         //       controller: TextEditingController(
  // text: _selectedDate == null
  //     // ? ''
  //     : '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
  //         //       ),
  //         //       validator: (value) {
  //         //         if (_selectedDate == null) {
  //         //           return 'Please select date of birth';
  //         //         }
  //         //         return null;
  //         //       },
  //         //     ),
  //         //   ),
  //         // ),
  //         SizedBox(height: 16.0),
  //         TextFormField(
  //           controller: _selectedGenderController,
  //           decoration: InputDecoration(
  //             labelText: 'Gender',
  //           ),
  //           validator: (value) {
  //             if (value!.isEmpty) {
  //               return 'Please enter gender';
  //             }
  //             return null;
  //           },
  //         ),
  //       DropdownButtonFormField<String>(
  //         value: _selectedGender,
  //         onChanged: (value) => setState(() => _selectedGender = value!),
  //         decoration: InputDecoration(
  //           labelText: 'Gender',
  //         ),
  //         items: [
  //           DropdownMenuItem(
  //             value: 'Male',
  //             child: Text('Male'),
  //           ),
  //           DropdownMenuItem(
  //             value: 'Female',
  //             child: Text('Female'),
  //           ),
  //           DropdownMenuItem(
  //             value: 'Other',
  //             child: Text('Other'),
  //           ),
  //         ],
  //         validator: (value) {
  //           if (value == null) {
  //             return 'Please select gender';
  //           }
  //           return null;
  //         },
  //       ),
  //         SizedBox(height: 16.0),
  //         TextFormField(
  //           controller: _emailController,
  //           decoration: InputDecoration(
  //             labelText: 'Email',
  //           ),
  //           validator: (value) {
  //             if (value!.isEmpty) {
  //               return 'Please enter email';
  //             }
  //             if (!value.contains('@gmail.com')) {
  //               return 'Email address is not valid';
  //             }
  //             return null;
  //           },
  //         ),
  // SizedBox(height: 16.0),
  // PrimaryButton(
  //   onPressed: () {
  //     if (_formKey.currentState!.validate()) {
  //       // Submit the form
  //       // Handle the form data here
  //       late final name = _nameController.text;
  //       late final email = _emailController.text;
  //       late final dateOfBirth = _dateOfbirthController.text;
  //       // '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';
  //       late final gender = _selectedGenderController.text;
  //       print('Name: $name');
  //       print('Email: $email');
  //       print('Date of birth: $dateOfBirth');
  //       print('Gender: $gender');
  //     }
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => PersonalInfomationForm()),
  //     );
  //   },
  //   buttonText: 'Save',
  // ),

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          _selectedDate ?? DateTime.now().subtract(Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().subtract(Duration(days: 365 * 18)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
