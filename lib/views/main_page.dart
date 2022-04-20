import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../controllers/package_controller.dart';
import '../controllers/profile_controller.dart';
import '../widgets/dialogs/custom_dialog.dart';
import 'home.dart';
import 'message.dart';
import 'new_order.dart';
import 'profile.dart';
import 'track.dart';

class MainPage extends StatefulWidget {
  final int index;
  final Widget? dialog;

  const MainPage({
    Key? key,
    this.index = 0,
    this.dialog,
  }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
    _registerDevice();
    if (widget.dialog != null) {
      Future.delayed(
        Duration.zero,
        () => showDialog(
          context: context,
          builder: (_) {
            return widget.dialog ?? Container();
          },
        ),
      );
    }
    context.read<PackageController>();
  }

  _registerDevice() async {
    String token = await FirebaseMessaging.instance.getToken() ?? '';
    context.read<ProfileController>().registerDevice(token: token);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        CustomDialogs.dialogs.showCustomDialog(
          context: context,
          type: DialogType.appClose,
        );
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _setCurrentIndex(2);
          },
          elevation: 0,
          backgroundColor:
              _currentIndex == 2 ? colors.BUTTON_GREEN : colors.BUTTON_BLUE,
          child: const Icon(
            CupertinoIcons.cube_box,
            color: colors.TEXT_WHITE,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _setCurrentIndex,
          selectedLabelStyle: GoogleFonts.comfortaa(
            color: colors.TEXT_BLUE,
            fontWeight: FontWeight.bold,
            fontSize: values.DETAILS_TEXT,
          ),
          unselectedLabelStyle: GoogleFonts.comfortaa(
            color: colors.TEXT_SECONDARY,
            fontSize: values.DETAILS_TEXT,
          ),
          selectedItemColor: colors.BUTTON_BLUE,
          unselectedItemColor: colors.TEXT_SECONDARY,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(CupertinoIcons.house),
            ),
            BottomNavigationBarItem(
              label: 'New Order',
              icon: Icon(
                CupertinoIcons.cart_badge_plus,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Track',
              icon: Icon(
                CupertinoIcons.add,
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
      ),
    );
  }

  _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return Home(
          changeIndex: _setCurrentIndex,
        );
      case 1:
        return const NewOrder();
      // return const Delivery();
      case 2:
        return const Track();
      case 3:
        return const Message();
      case 4:
        return const Profile();
      default:
        return Container();
    }
  }

  _setCurrentIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }
}
