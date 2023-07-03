import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/login_outPage/widget/checkbox.dart';
import 'package:mobile_store/src/ui/profilePage/screen/profile_page.dart';

class EditAddressScreen extends StatefulWidget {
  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  late String _selectedProvince;
  late String _selectedDistrict;
  late String _selectedWard;
  late String _addressDetails;

  final List<String> _provinces = ['Ho Chi Minh', 'Can Tho', 'Ha Noi'];
  final Map<String, List<String>> _districtsByProvince = {
    'Ho Chi Minh': [
      'District 1',
      'District 3',
      'District 4',
      'District 5',
      'District 7',
      'Thu Duc District'
    ],
    'Can Tho': [
      'Ninh Kieu District ',
      'Cai Rang District ',
      'Phong Dien District ',
      'Binh Thuy District '
    ],
    'Ha Noi': [
      'Thanh Xuan District ',
      'Hai Ba Trung District ',
      'Long Bien District'
    ],
  };
  final Map<String, List<String>> _wardsByDistrict = {
    'District 1': ['Ben Nghe Ward ', 'Tu Duc Ward ', 'Hoa Binh Ward '],
    'District 3': ['Ward 1', 'Ward 2', 'Ward 3', 'Ward 5', 'Ward 9', 'Ward 10'],
    'District 4': ['Ward 1', 'Ward 2', 'Ward 3', 'Ward 4', 'Ward 6', 'Ward 8'],
    'District 5': ['Ward 1', 'Ward 2', 'Ward 3', 'Ward 5', 'Ward 7', 'Ward 10'],
    'District 7': [
      'Phu My Ward ',
      'Tan Hung Ward',
      'Tan Thuan Dong Ward',
      'Tan Thuan Tay Ward'
    ],
    'Thu Duc District': [
      'Binh Chieu Ward',
      'Binh Tho Ward',
      'Hiep Binh Chanh Ward',
      'Linh Dong Ward',
      'Linh Tay Ward'
    ],
    'Ninh Kieu District ': [
      'An Phu Ward',
      'Xuan Khanh Ward',
      'Hung Loi Ward ',
      'An Binh Ward',
      'Cai Khe Ward'
    ],
    'Cai Rang District ': ['Le Binh Ward', 'Ba Lang Ward', 'Hung Phu Ward '],
    'Phong Dien District': [
      'Giai Xuan Ward',
      'My Khanh Ward',
      'Nhon Nghia Ward'
    ],
    'Binh Thuy District': ['Binh Thuy Ward', 'Tra Noc Ward', 'An Thoi Ward'],
    'Thanh Xuan District': [
      'Thanh Xuan Bac Ward',
      'Thanh Xuan Trung Ward',
      'Thanh Xuan Nam Ward'
    ],
    'Hai Ba Trung District': [
      'Vinh Tuy Ward',
      'Bach Dang Ward',
      'Nguyen Du Ward'
    ],
    'Long Bien District': ['Bo De Ward', 'Duc Giang Ward', 'Long Bien Ward'],
  };

  @override
  void initState() {
    super.initState();
    // Set default values
    _selectedProvince = _provinces[0];
    _selectedDistrict = _districtsByProvince[_selectedProvince]![0];
    _selectedWard = _wardsByDistrict[_selectedDistrict]![0];
    _addressDetails = '';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.005),
                child: Text('DELIVERY ADDRESS',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(height: 13),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'images/home_icon.png',
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('HOME'),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Image.asset(
                        'images/office.png',
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('OFFICE'),
                    ],
                  )
                ],
              ),
              SizedBox(height: 5),
              DropdownButton<String>(
                value: _selectedProvince,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedProvince = newValue!;
                    _selectedDistrict =
                        _districtsByProvince[_selectedProvince]![0];
                    _selectedWard = _wardsByDistrict[_selectedDistrict]![0];
                  });
                },
                items: _provinces.map((String province) {
                  return DropdownMenuItem<String>(
                    value: province,
                    child: Text(province),
                  );
                }).toList(),
                isExpanded: true,
                hint: Text('Select Province'),
              ),
              SizedBox(height: 16.0),
              DropdownButton<String>(
                value: _selectedDistrict,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDistrict = newValue!;
                    _selectedWard = _wardsByDistrict[_selectedDistrict]![0];
                  });
                },
                items: _districtsByProvince[_selectedProvince]!
                    .map((String district) {
                  return DropdownMenuItem<String>(
                    value: district,
                    child: Text(district),
                  );
                }).toList(),
                isExpanded: true,
                hint: Text('Select District'),
              ),
              SizedBox(height: 16.0),
              DropdownButton<String>(
                value: _selectedWard,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedWard = newValue!;
                  });
                },
                items: _wardsByDistrict[_selectedDistrict]!.map((String ward) {
                  return DropdownMenuItem<String>(
                    value: ward,
                    child: Text(ward),
                  );
                }).toList(),
                isExpanded: true,
                hint: Text('Select Ward'),
              ),
              SizedBox(height: 16.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _addressDetails = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter Address Details',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CheckBox(text: 'Set default address'),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Save'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
                SizedBox(width: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfilePage(),
                      ),
                    );
                  },
                  child: Text('Close'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
