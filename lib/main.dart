import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nawabganj_roktoseba/CustormDrawer.dart';
import 'package:nawabganj_roktoseba/Home.dart';
import 'package:nawabganj_roktoseba/sing_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nawabganj_roktoseba/update.dart';
import 'important_numbers/important.dart';
import './splash_screen.dart';
import './profile/profile.dart';
import 'dependency_injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'bottomNav.dart';
import 'log_in.dart';
import 'Body.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://azrccfwuvoxlrjwghvip.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF6cmNjZnd1dm94bHJqd2dodmlwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTA4MjkyODcsImV4cCI6MjAyNjQwNTI4N30.Zn6wVMpfOQTLvSnyoLM9oz5UdyB-63MMCur1dlZhuxM",
  );
  runApp(const MyApp());
  DependencyInjection.init();
}
final supabase = Supabase.instance.client;
class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    Map<String, String> logedinUserInfo = {};
    String? phoneNumber;
    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/signup': (context) => SignUp(),
        '/home': (context) => HomeActivity(),
        '/body': (context) => Body(),
        '/bottomNav': (context) => BottomNav(),
        '/login': (context) => LogIn(),
        '/important': (context) => Important(),
        '/profile': (context) => Profile(),

      },
    );

  }
}
