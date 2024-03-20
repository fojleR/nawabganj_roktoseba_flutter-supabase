import 'package:flutter/material.dart';
import 'CustomBottomNav.dart';
import 'CustormDrawer.dart';
import 'Home.dart';
import 'Body.dart';
import 'profile/profile.dart';
import 'important_numbers/important.dart';

class BottomNav extends StatefulWidget {
  final String? phoneNumber;
  final Map<String, String> ? logedinUserInfo;
  const BottomNav({Key? key, this.phoneNumber, this.logedinUserInfo}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _currentIndex = 1;
  bool _isNotHomeRoute(Route<dynamic> route) {
    return route.settings.name != '/home';
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
      body: Body(loggedInUserInfo: widget.logedinUserInfo,),
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
