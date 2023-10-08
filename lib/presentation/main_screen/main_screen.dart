import 'package:quickbank_revised/presentation/homepage_done_page/homepage_done_page.dart';
import 'package:quickbank_revised/presentation/pilihan_transfer_screen/pilihan_transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/presentation/profile_done_screen/profileeditscreen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 1;
  final screens = [
    ProfilEditScreen(),
    HomepageDoneScreen(),
    PilihanTransferScreen()
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Theme(
          data: ThemeData(
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => setState(() => currentIndex = index),
            selectedItemColor: Color(0XFFF2FF53),
            unselectedItemColor: Colors.white70,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            backgroundColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_sharp),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money_rounded),
                label: 'Transfer',
              ),
            ],
          ),
        ),
      );
}
