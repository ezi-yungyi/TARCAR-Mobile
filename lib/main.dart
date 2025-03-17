import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'Timetable.dart';
import 'TARCAR.dart';
import 'Profile.dart';
import 'WebServer/WebSocket.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  debugShowCheckedModeBanner: false;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Google Sign-In',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: SignInScreen(),
  //   );
  // }
}


class _MyAppState extends State<MyApp> {
  int _currentIndex = 1;
  final List<Widget> _pages = [
    TimetablePage(),
    TARCARPage(),
    ProfilePage(),

  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TARCAR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Timetable',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.car_rental),
              label: 'TARCAR',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),

          ],
        ),
      ),
    );
  }
}