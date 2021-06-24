import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistic_management_customer/providers/authentication.dart';
import 'package:logistic_management_customer/views/login.dart';
import 'package:logistic_management_customer/widgets/custom_button.dart';
import 'package:logistic_management_customer/widgets/custom_button_outline.dart';
import 'package:logistic_management_customer/widgets/header.dart';
import 'package:logistic_management_customer/widgets/profile_info_heading.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/old/Widgets/single_personaldetail.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = context.watch<AuthenticationProvider>();
    return Column(
      children: [
        Header(
          title: 'Profile',
          trailing: Padding(
            padding: const EdgeInsets.all(values.BASE_PADDING),
            child: CircleAvatar(
              backgroundColor: colors.FIELD_BACKGROUND,
              child: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.pen),
                color: colors.TEXT_BLUE,
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      "images/user.png",
                    ),
                    radius: size.width * 0.2,
                    backgroundColor: colors.TEXT_BLUE.withOpacity(0.2),
                  ),
                ),
                SizedBox(height: values.BASE_PADDING / 2),
                Text(
                  '${auth.consumer!.firstname} ${auth.consumer!.lastname}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.TEXT_BLUE,
                    fontSize: values.SUB_HEADER_TEXT,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: values.BASE_PADDING / 2),
                Text(
                  '${auth.consumer!.mobile}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.TEXT_SECONDARY,
                    fontSize: values.TITLE_TEXT,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: values.BASE_PADDING / 2),
                Divider(
                  thickness: 2,
                  color: colors.FIELD_BACKGROUND,
                ),
                SizedBox(height: values.BASE_PADDING),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: values.BASE_PADDING),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileInfoHeading(title: 'Basic Information'),
                      ProfileDetailRow(
                        title: 'Name',
                        value:
                            '${auth.consumer!.firstname} ${auth.consumer!.lastname}',
                      ),
                      ProfileDetailRow(
                        title: 'Address',
                        value: 'N/a',
                      ),
                      ProfileDetailRow(
                        title: 'Mobile No.',
                        value: '${auth.consumer!.mobile}',
                      ),
                      ProfileDetailRow(
                        title: 'Email',
                        value: '${auth.consumer!.email}',
                      ),
                      SizedBox(height: values.BASE_PADDING),
                      ProfileInfoHeading(title: 'Membership Information'),
                      ProfileDetailRow(
                        title: 'Membership',
                        value: 'N/a',
                      ),
                      ProfileDetailRow(
                        title: 'Expiry Date',
                        value: 'N/a',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton(
                    title: 'Be Our PrimeMinister',
                    onTab: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomButtonOutline(
                    title: 'Logout',
                    color: colors.RED,
                    onTab: () {
                      context.read<AuthenticationProvider>().logOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => Login()),
                        (route) => false,
                      );
                    },
                  ),
                ),
                SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
