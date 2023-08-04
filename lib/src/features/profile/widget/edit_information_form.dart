import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/src/constant/utils/validate.dart';


class EditInformationForm extends StatefulWidget {
  String? fullName;
  String? email;
  int? selectedGender;
  String? selectedDate;

  EditInformationForm(
      {super.key,
      required this.fullName,
      required this.email,
      required this.selectedDate,
      required this.selectedGender});

  @override
  _EditInformationFormState createState() => _EditInformationFormState();
}

class _EditInformationFormState extends State<EditInformationForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dateOfbirthController = TextEditingController();

  DateTime? dateOfBirth;
  int? _selectedGender;
  Validate? validate;
  bool errorFullName = false;
  String errorTextFullName = '';
  bool errorEmail = false;
  String errorTextEmail = '';

  _showBirthdayPicker(BuildContext context) async {
    dateOfBirth = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2025));
    setState(() {});
    print(dateOfBirth);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = widget.fullName!;
    _emailController.text = widget.email!;
    // dateOfBirth = DateFormat("dd-MM-yyyy").parse(widget.selectedDate!);
    _selectedGender = widget.selectedGender;

  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dateOfbirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02),
            child: const Text('Edit information',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
          ),
          textInputFieldFullName(),
          textInputFieldEmail(),
          dayOfBirthPicker(),
          dropdownGender(),
        ]),
      ),
      actions: <Widget>[
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            onPressed: () {},
            child: const Text('Save')),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
          ),
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  Widget textInputFieldFullName() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        controller: _nameController,
        onChanged: (value) {
          if (Validate.validName(value.trim())) {
            errorFullName = false;
            setState(() {});
          } else {
            setState(() {
              errorFullName = true;
              errorTextFullName =
                  (value == '') ? 'Please enter your name' : 'Incorrect name';
            });
          }
        },
        decoration: InputDecoration(
          labelText: 'Full name',
          border: const OutlineInputBorder(),
          errorText: errorFullName ? errorTextFullName : null,
        ),
      ),
    );
  }

  Widget textInputFieldEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      child: TextField(
        controller: _emailController,
        onChanged: (value) {
          if (Validate.invalidateEmail(value.trim())) {
            setState(() {
              errorEmail = true;
              errorTextEmail =
                  (value == '') ? 'Please enter your email' : 'Incorrect email';
            });
          } else {
            errorEmail = false;
            setState(() {});
          }

          print(errorTextEmail);
        },
        decoration: InputDecoration(
          labelText: 'Full name',
          border: const OutlineInputBorder(),
          errorText: errorEmail ? errorTextEmail : null,
        ),
      ),
    );
  }

  Widget dayOfBirthPicker() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02),
      child: InkWell(
        onTap: () {
          _showBirthdayPicker(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02),
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  (dateOfBirth != null)
                      ? '${dateOfBirth?.day}-${dateOfBirth?.month}-${dateOfBirth?.year}'
                      : 'Date of birth',
                  textAlign: TextAlign.center),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
                child: Image.asset(
                  'assets/icon/calendar_icon.png',
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dropdownGender() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02),
      child: DropdownButtonFormField<int>(
        value: _selectedGender,
        onChanged: (value) => setState(() => _selectedGender = value),
        decoration: const InputDecoration(
          hintText: 'Gender',
          contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 10),
          border: OutlineInputBorder(),
        ),
        items: const [
          DropdownMenuItem(
            value: 0,
            child: Text('Male'),
          ),
          DropdownMenuItem(
            value: 1,
            child: Text('Female'),
          ),
          DropdownMenuItem(
            value: 2,
            child: Text('Other'),
          ),
        ],
      ),
    );
  }
}
