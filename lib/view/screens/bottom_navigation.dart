import 'package:flutter/material.dart';
import 'package:flutter_113/view/screens/hassan_screen.dart';
import 'package:flutter_113/view/screens/store/store_screen.dart';
import 'package:flutter_113/view/screens/auth/login_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    StoreScreen(),
    HassanScreen(),
    LoginScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Column(
              children: [
                Icon(Icons.home),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 5,
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center_outlined),
            label: 'Business',
            activeIcon: Column(
              children: [
                Icon(Icons.business_center),
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 5,
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'Bookmark',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person_outline_rounded),
          //   label: 'Account',
          // ),
        ],
      ),
    );
  }
}
