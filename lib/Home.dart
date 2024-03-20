import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DropdownAndLeble.dart';
import 'bottomNav.dart';
import 'dart:ui';

class HomeActivity extends StatelessWidget {
  final String? phoneNumber;
  final Map<String, String>? logedinUserInfo;

  const HomeActivity({Key? key, this.phoneNumber, this.logedinUserInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Extract phoneNumber and logedinUserInfo from arguments
    final String? phoneNumber = args?['phoneNumber'];
    final Map<String, String>? logedinUserInfo = args?['loggedInUserInfo'];
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.red[800],
      foregroundColor: Colors.white,
      fixedSize: Size(200, 50),
    );

    print("HomeActivity: phoneNumber: $phoneNumber, logedinUserInfo: $logedinUserInfo");


    return WillPopScope(
      onWillPop: () async {
        // Show the exit dialog
        bool exit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Exit"),
              content: Text("আপনি কি নিশ্চিত যে আপ্লিকেশন থেকে বের হতে চান?"),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Return false
                  },
                  child: Text("না"),
                ),
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();// Return true
                  },
                  child: Text("হ্যাঁ"),
                ),
              ],
            );
          },
        );
        return exit ?? false;
      },
      child: BottomNav(
        phoneNumber: phoneNumber,
        logedinUserInfo: logedinUserInfo,
      ),
    );
  }
}
