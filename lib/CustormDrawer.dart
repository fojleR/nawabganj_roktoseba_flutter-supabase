import 'package:flutter/material.dart';
import 'bottomNav.dart';
import 'profile/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../important_numbers/important.dart';
import 'log_in.dart';
import 'sing_up.dart';
import 'ReadyDonor/readyDonor.dart';
import '../about/about.dart';
import '../bloodDonate/bloodDonate.dart';
import '../contact/contact.dart';
import '../bloodDonate/bloodDonate.dart';


class CustomDrawer extends StatefulWidget {
  final String? phoneNumber;
  final Map<String, String> ? logedinUserInfo;
  const CustomDrawer({Key? key, this.phoneNumber, this.logedinUserInfo}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int _selectedTileIndex = -1; // Initialize with an invalid index

  @override
  void handleTap() {
    print("tapped");
    print(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.red[800]),
              accountName: Text(widget.logedinUserInfo!['name']! , style: TextStyle(color: Colors.black)),
              accountEmail: Text(widget.logedinUserInfo!['phone']!),
              currentAccountPicture: Image.asset("lib/assets/photos/drawerLogo.jpg"),
            ),
          ),
          buildListTile("রক্তদাতা অনুসন্ধান", Icons.search, 0, () {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BottomNav(logedinUserInfo: widget.logedinUserInfo, phoneNumber: widget.phoneNumber),
            ));
          }),
          buildListTile("রেডি রক্তদাতা", Icons.check, 1, () {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => ReadyDonor(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo))
            );
          }),
          buildListTile("জরুরী নাম্বারসমূহ", Icons.numbers , 2, () {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Important(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo)
            ));
          }),

          buildListTile("প্রোফাইল", Icons.person, 3, () {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Profile(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo),
            ));
            // Navigate to ProfilePage
          }),
          buildListTile("এবাউট", Icons.person_3, 4, () {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => About(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo))
            );
            // Navigate to PhonePage
          }),
          buildListTile("যোগাযোগ", Icons.connect_without_contact, 5, () {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Contact(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo))
            );
          }),
          buildListTile("রক্তদান", Icons.bloodtype, 6, () {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => BloodDonate(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo),
            ));
          }),

          buildListTile("রেজিস্ট্রেশন", Icons.app_registration, 7, () {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SignUp()
            ));// Navigate to PhonePage
          }),
          buildListTile("লগ আউট", Icons.logout, 8, () {
            Navigator.of(context).pop(); // Close the drawer
            Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn())
            );// Navigate to PhonePage
          }),
          // Other ListTiles...
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, int index, VoidCallback onTap) {
    return ListTile(
      title: Text(title),
      leading: index == 1 ? ReadyDonorIcon() : Icon(icon, color: Colors.red), // Set icon color to red
      tileColor: _selectedTileIndex == index ? Colors.red : null,
      onTap: () {
        onTap();
        handleTap();
        // Set the selected state for the tapped tile and reset others
        setState(() {
          _selectedTileIndex = index;
        });
      },
    );
  }
}

class ReadyDonorIcon extends StatelessWidget {
  final double size;
  final Color color;

  const ReadyDonorIcon({
    Key? key,
    this.size = 24.0,
    this.color = Colors.red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.5),
      ),
      child: Center(
        child: Icon(
          Icons.check,
          size: size * 0.6,
          color: Colors.white,
        ),
      ),
    );
  }
}
