import 'package:flutter/material.dart';
import 'package:nawabganj_roktoseba/profile/profileBody.dart';
import '../CardBody.dart';
import '../CustomBottomNav.dart';
import '../CustormDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../bottomNav.dart';
import 'bloodDonateBody.dart';
import '../Home.dart';
import '../profile/profile.dart';
import '../important_numbers/important.dart';


class BloodDonate extends StatefulWidget {
  final String? phoneNumber;
  final Map<String, String> ? logedinUserInfo;
  const BloodDonate({Key? key, this.phoneNumber, this.logedinUserInfo}) : super(key: key);

  @override
  _BloodDonateState createState() => _BloodDonateState();
}

class _BloodDonateState extends State<BloodDonate> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _currentIndex = 0;
  Map<String, String> userInfo = {}; // Initialize userInfo list

  void initState() {
    super.initState();
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
      body: BloodDonateBody(phoneNumber: widget.phoneNumber, logedinUserInfo: widget.logedinUserInfo),
      drawer: CustomDrawer(logedinUserInfo: widget.logedinUserInfo, phoneNumber: widget.phoneNumber ),
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
