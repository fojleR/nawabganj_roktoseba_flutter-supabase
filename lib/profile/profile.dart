import 'package:flutter/material.dart';
import 'package:nawabganj_roktoseba/profile/profileBody.dart';
import '../CardBody.dart';
import '../CustomBottomNav.dart';
import '../CustormDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Home.dart';
import '../important_numbers/important.dart';

import '../bottomNav.dart';
import 'profile.dart';

class Profile extends StatefulWidget {
  final String? phoneNumber;
  final Map<String, String> ? logedinUserInfo;
  const Profile({Key? key, this.phoneNumber, this.logedinUserInfo}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _currentIndex = 3;
  Map<String, String> userInfo = {}; // Initialize userInfo list
  bool _isNotHomeRoute(Route<dynamic> route) {
    return route.settings.name != '/home';
  }
  void initState() {
    super.initState();
    print(widget.logedinUserInfo);
    Navigator.of(context).overlay?.context?.visitAncestorElements((element) {
      if (element.widget is PageRoute) {
        print((element.widget as PageRoute).settings.name);
      }
      return true; // continue visiting ancestors
    });
    // fetchData();
  }

  void fetchData() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('mobile', isEqualTo: widget.phoneNumber)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final userData = snapshot.docs.first.data() as Map<String, dynamic>;
        print('User Data: $userData');
        // Store user data into userInfo list
        userInfo = {
          'name': userData['name'],
          'blood': userData['blood'],
          'phone': userData['mobile'],
          'address': userData['presentVillage'],
        };
        print(userInfo);
        setState(() {}); // Update the state to rebuild the UI with fetched data
      } else {
        print('User not found!');
      }
    } catch (error) {
      print('Error fetching user data: $error');
    }
  }

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ProfileBody(
          logedinUserInfo: widget.logedinUserInfo,
          // name: userInfo['name'],
          // blood: userInfo['name']
      ),
      drawer: CustomDrawer(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTabTapped: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            _scaffoldKey.currentState!.openDrawer();
          } else if (index == 1) {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.pushNamed(
              context,
              '/home',
              arguments: {
                'phoneNumber': widget.phoneNumber,
                'loggedInUserInfo': widget.logedinUserInfo,
              },
            );
          } else if (index == 2) {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Important(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo)),
            );
          } else {
            Navigator.popUntil(context, ModalRoute.withName('/home'));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo)),
            );
          }
        },
      ),
    );
  }
}
