import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../widgets/old/Widgets/customButton.dart';
import '../../../widgets/old/Widgets/single_personaldetail.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(left: 21, right: 21, top: 33),
        width: MediaQuery.of(context).size.width * 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Profile",
              style: TextStyle(color: Constant.theme_col, fontSize: 24),
            ),
            Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Constant.grey2,
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: IconButton(
                    icon: Icon(
                      Icons.edit_outlined,
                      color: Constant.theme_col,
                    ),
                    onPressed: () {}))
          ],
        ),
      ),
      Center(
        child: CircleAvatar(
          backgroundImage: AssetImage(
            "images/user.png",
          ),
          radius: 100,
          backgroundColor: Colors.white,
        ),
      ),
      Center(
        child: Text(
          "Ramesh Regmi",
          style: TextStyle(
              color: Constant.theme_col,
              fontSize: 24,
              fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
          margin: EdgeInsets.only(top: 8),
          width: MediaQuery.of(context).size.width,
          child: Text(
            "9878978978",
            style: TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          )),
      Divider(
        thickness: 2,
        color: Constant.grey1,
      ),
      Heading("Basic Information"),
      DetailUserSingle(
        title: "Name",
        value: "Rajendra Prajapati",
      ),
      DetailUserSingle(
        title: "Address",
        value: "Bhaktapur",
      ),
      DetailUserSingle(
        title: "Mobile Number",
        value: "9879879875",
      ),
      DetailUserSingle(
        title: "Email",
        value: "Rajendra@gmail.com",
      ),
      Heading("Membership Information"),
      DetailUserSingle(
        title: "Membership",
        value: "N/A",
      ),
      DetailUserSingle(
        title: "Expiry Date",
        value: "N/A",
      ),
      CustomButton(
        pressed: () {},
        title: "Be Our PrimeMinister",
      )
    ]);
  }
}
