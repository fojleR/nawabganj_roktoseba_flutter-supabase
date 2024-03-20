import 'package:flutter/material.dart';

class CustomBottomNav extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabTapped;
  final Map<String, String> ? logedinUserInfo;

  const CustomBottomNav({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
    this.logedinUserInfo
  }) : super(key: key);

  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      backgroundColor: Colors.red[800],
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: "মেনু"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "অনুসন্ধান"),
        BottomNavigationBarItem(icon: Icon(Icons.label_important), label: "জরুরী"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "প্রোফাইল"),
      ],
      onTap: widget.onTabTapped,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      // showSelectedLabels: true,
      // showUnselectedLabels: true,
    );
  }
}