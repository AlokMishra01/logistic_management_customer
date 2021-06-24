import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart' as colors;
import '../views/old/Pages/Profile.dart';
import '../views/old/Pages/delivery.dart';
import '../views/old/Pages/track.dart';
import 'home.dart';
import 'message.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _setCurrentIndex(2);
        },
        elevation: 0,
        backgroundColor:
            _currentIndex == 2 ? colors.BUTTON_GREEN : colors.BUTTON_BLUE,
        child: Icon(
          CupertinoIcons.cube_box,
          color: colors.TEXT_WHITE,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _setCurrentIndex,
        selectedLabelStyle: TextStyle(
          color: colors.TEXT_BLUE,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
        selectedItemColor: colors.BUTTON_BLUE,
        unselectedItemColor: colors.TEXT_SECONDARY,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(CupertinoIcons.house),
          ),
          BottomNavigationBarItem(
            label: 'Delivery',
            icon: Icon(CupertinoIcons.car_detailed),
          ),
          BottomNavigationBarItem(
            label: 'Track',
            icon: Icon(
              CupertinoIcons.car_detailed,
              color: Colors.transparent,
              size: 16,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Message',
            icon: Icon(CupertinoIcons.captions_bubble),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
      body: SafeArea(child: _getCurrentPage()),
    );
  }

  _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return Home();
      case 1:
        return Delivery();
      case 2:
        return Track();
      case 3:
        return Message();
      case 4:
        return Profile();
      default:
        return Container();
    }
  }

  _setCurrentIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }
}
