import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistic_management_customer/views/profile_update.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../controllers/authentication_controller.dart';
import '../controllers/profile_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_button_outline.dart';
import '../widgets/header.dart';
import '../widgets/profile_info_heading.dart';
import '../widgets/single_personal_detail.dart';
import 'login.dart';
import 'my_request.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final profile = context.watch<ProfileController>();
    return Column(
      children: [
        Header(
          title: 'Profile',
          trailing: Padding(
            padding: const EdgeInsets.all(values.BASE_PADDING),
            child: CircleAvatar(
              backgroundColor: colors.FIELD_BACKGROUND,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileUpdate(),
                    ),
                  );
                },
                icon: const Icon(CupertinoIcons.pen),
                color: colors.TEXT_BLUE,
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: const NetworkImage(
                      'https://media.carphonewarehouse.com/is/image/cpw2/essentials-bundle-for-google-pixel-4aNA?\$accessories\$',
                    ),
                    radius: size.width * 0.2,
                    backgroundColor: colors.TEXT_BLUE.withOpacity(0.2),
                  ),
                ),
                const SizedBox(height: values.BASE_PADDING / 2),
                Text(
                  profile.user?.name ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: colors.TEXT_BLUE,
                    fontSize: values.SUB_HEADER_TEXT,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: values.BASE_PADDING / 2),
                Text(
                  profile.user?.phone ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: colors.TEXT_SECONDARY,
                    fontSize: values.TITLE_TEXT,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: values.BASE_PADDING / 2),
                const Divider(
                  thickness: 2,
                  color: colors.FIELD_BACKGROUND,
                ),
                const SizedBox(height: values.BASE_PADDING),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: values.BASE_PADDING),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ProfileInfoHeading(title: 'Basic Information'),
                      ProfileDetailRow(
                        title: 'Name',
                        value: profile.user?.name ?? '',
                      ),
                      const ProfileDetailRow(
                        title: 'Address',
                        value: 'N/a',
                      ),
                      ProfileDetailRow(
                        title: 'Mobile No.',
                        value: profile.user?.phone ?? '',
                      ),
                      ProfileDetailRow(
                        title: 'Email',
                        value: profile.user?.email ?? '',
                      ),
                      const SizedBox(height: values.BASE_PADDING),
                      const ProfileInfoHeading(title: 'Membership Information'),
                      const ProfileDetailRow(
                        title: 'Membership',
                        value: 'N/a',
                      ),
                      const ProfileDetailRow(
                        title: 'Expiry Date',
                        value: 'N/a',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: values.BASE_PADDING,
                  ),
                  child: CustomButton(
                    title: 'My Requests',
                    onTab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MyRequest(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(values.BASE_PADDING),
                  child: CustomButton(
                    title: 'Be Our PrimeMinister',
                    onTab: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: values.BASE_PADDING),
                  child: CustomButtonOutline(
                    title: 'Logout',
                    color: colors.RED,
                    onTab: () {
                      context.read<AuthenticationController>().logOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const Login()),
                        (route) => false,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
