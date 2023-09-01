import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_store/main.dart';
import 'package:mobile_store/src/constant/utils/validate.dart';
import 'package:mobile_store/src/core/model/user.dart';
import 'package:mobile_store/src/features/home_page/view/navigation_home_page.dart';
import 'package:mobile_store/src/features/profile/view_model/change_information_view_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
// ignore: must_be_immutable
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
  final ChangeInformationViewModel changeInformationViewModel =
      ChangeInformationViewModel();

  DateTime? dateOfBirth;
  int? _selectedGender;
  Validate? validate;
  bool errorFullName = false;
  String? errorTextFullName = '';
  bool? errorEmail = false;
  String? errorTextEmail = '';

  _showBirthdayPicker(BuildContext context) async {
    dateOfBirth = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = widget.fullName!;
    _emailController.text = widget.email!;
    _selectedGender = widget.selectedGender;
    try {
      dateOfBirth = DateFormat("dd-MM-yyyy").parse(widget.selectedDate!);
    } catch (e) {
      dateOfBirth = DateTime.now();
    }
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
          dayOfBirthPicker(),
          dropdownGender(),
        ]),
      ),
      actions: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            onPressed: () async {
              String fullNameText = _nameController.text;
              String birthdayFormat =
                  '${dateOfBirth?.day}-${dateOfBirth?.month}-${dateOfBirth?.year}';

              if (fullNameText.isEmpty) {
                showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.error(
                    message: 'Please enter full name',
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              if (fullNameText != '' &&
                  dateOfBirth != null &&
                  _selectedGender != null) {
                UserDTO userInformation =
                    await changeInformationViewModel.changeInformationViewModel(
                  fullNameText,
                  _selectedGender!,
                  birthdayFormat,
                );

                setState(() {
                  getUser.userDTO = userInformation;
                  indexScreen = 2;
                });
                showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.success(
                    message: 'Change information successfully',
                  ),
                );
                Get.offAll(const NavigationHomePage());
              } else {
                showTopSnackBar(
                  Overlay.of(context),
                  const CustomSnackBar.error(
                    message: 'Please enter all field ',
                  ),
                );
              }
            },
            child: const Text('Save')),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
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
          if (Validate.validName(value)) {
            errorFullName = true;
            errorTextFullName = value.isEmpty
                ? 'Tên không được để trống'
                : value.startsWith(' ')
                    ? 'Không có dấu cách ở đầu'
                    : value.endsWith(' ')
                        ? 'Không có dấu cách cuối'
                        : 'Không được nhập số hoặc ký tự đặc biệt';
            setState(() {});
          } else {
            setState(() {
              errorFullName = false;
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
              SizedBox(
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
