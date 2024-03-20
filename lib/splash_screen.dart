import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './log_in.dart';
import './ReadyDonor/readyDonor.dart';
import './important_numbers/important.dart';
import 'sing_up.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LogIn()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  "lib/assets/photos/splash_design.png",
                  height: 200,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'ইন্টারনেট সংযোগ দিন',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
