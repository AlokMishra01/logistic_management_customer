import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../widgets/old/Widgets/custom_iconBtn.dart';
import 'Profile.dart';
import 'delivery.dart';
import 'homeFragment.dart';
import 'message.dart';
import 'track.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  void help(int curr_index) {
    setState(() {
      index = curr_index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: getWidget(index),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomIconBtn(
                index: index,
                title: "Home",
                help: () {
                  help(0);
                },
                curr_index: 0,
                iconData: CommunityMaterialIcons.home,
              ),
              CustomIconBtn(
                index: index,
                title: "Delivery",
                help: () {
                  help(1);
                },
                curr_index: 1,
                iconData: CommunityMaterialIcons.truck_delivery_outline,
              ),
              SizedBox(
                width: 50,
              ),
              CustomIconBtn(
                index: index,
                title: "Message",
                help: () {
                  help(2);
                },
                curr_index: 2,
                iconData: CommunityMaterialIcons.message_outline,
              ),
              CustomIconBtn(
                index: index,
                title: "Profile",
                help: () {
                  help(3);
                },
                curr_index: 3,
                iconData: CommunityMaterialIcons.account_outline,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          CommunityMaterialIcons.package_variant_closed,
          size: 22,
        ),
        onPressed: () {
          setState(() {
            index = 4;
          });
        },
        backgroundColor: (index == 4) ? Constant.green : Constant.theme_col,
        mini: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
    );
  }

  Widget getWidget(int curr_index) {
    switch (curr_index) {
      case 0:
        return HomeFragment();
        break;
      case 1:
        return Delivery();
        break;
      case 2:
        return Message();
        break;
      case 3:
        return Profile();
        break;
      case 4:
        return Track();
        break;
      default:
        return Home();
        break;
    }
  }
}

class IconTile extends StatefulWidget {
  IconTile({this.index, this.curr_index, this.iconData, this.title});

  @override
  _IconTileState createState() => _IconTileState();

  int? index;
  int? curr_index;
  IconData? iconData;
  String? title;
}

class _IconTileState extends State<IconTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            icon: Icon(
              widget.iconData,
              color: (widget.index == widget.curr_index)
                  ? Constant.theme_col
                  : Colors.black,
            ),
            onPressed: () {
              setState(() {
                widget.index = widget.curr_index;
              });
            }),
        Text(
          "Home",
          style: TextStyle(
              color: (widget.index == widget.curr_index)
                  ? Constant.theme_col
                  : Colors.black,
              fontSize: 9),
        ),
      ],
    );
  }
}
