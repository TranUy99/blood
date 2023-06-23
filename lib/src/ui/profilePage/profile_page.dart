import 'package:flutter/material.dart';
import 'package:mobile_store/src/ui/homePage/screen/bottom_navigation.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
      ], title: const Text('Profile ')),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 165, 181, 184),
              height: MediaQuery.of(context).size.height * 0.2,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: const BottomNavigation(),
      ),
    );
  }
}