import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropping/image_cropping.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logistic_management_customer/widgets/custom_button.dart';
import 'package:logistic_management_customer/widgets/join_us_today_widget.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../controllers/authentication_controller.dart';
import '../controllers/profile_controller.dart';
import '../widgets/header.dart';
import '../widgets/profile_info_heading.dart';
import '../widgets/single_personal_detail.dart';
import 'login.dart';
import 'my_request.dart';
import 'profile_update.dart';

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
            padding: const EdgeInsets.symmetric(
              horizontal: values.BASE_PADDING,
            ),
            child: TextButton(
              onPressed: () {
                context.read<AuthenticationController>().logOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const Login()),
                  (route) => false,
                );
              },
              child: Text(
                'Logout',
                style: GoogleFonts.comfortaa(
                  color: colors.TEXT_WHITE,
                  fontSize: values.DETAILS_TEXT,
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: colors.RED,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(values.RADIUS),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 0.0,
                ),
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
                const SizedBox(height: values.BASE_PADDING),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: const NetworkImage(
                          'https://media.carphonewarehouse.com/is/image/cpw2/essentials-bundle-for-google-pixel-4aNA?\$accessories\$',
                        ),
                        radius: size.width * 0.2,
                        backgroundColor: colors.TEXT_BLUE.withOpacity(0.2),
                      ),
                      Positioned(
                        bottom: 6.0,
                        right: 6.0,
                        child: CircleAvatar(
                          backgroundColor: colors.BUTTON_BLUE,
                          radius: 16.0,
                          child: IconButton(
                            onPressed: () => _uploadImage(context),
                            icon: const Icon(
                              Icons.camera_alt_rounded,
                              color: colors.TEXT_WHITE,
                              size: 16.0,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: values.BASE_PADDING),
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
                const SizedBox(height: values.BASE_PADDING),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileInfoHeading(
                      title: 'Basic Information',
                      onTab: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfileUpdate(),
                          ),
                        );
                      },
                    ),
                    ProfileDetailRow(
                      title: 'Name',
                      value: profile.user?.name ?? '',
                    ),
                    ProfileDetailRow(
                      title: 'Mobile No.',
                      value: profile.user?.phone ?? '',
                    ),
                    ProfileDetailRow(
                      title: 'Email',
                      value: profile.user?.email ?? '',
                    ),
                  ],
                ),
                const SizedBox(height: values.BASE_PADDING),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileInfoHeading(
                      title: 'Address',
                      onTab: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => const ProfileUpdate(),
                        //   ),
                        // );
                      },
                    ),
                    const ProfileDetailRow(
                      title: 'City',
                      value: 'N/a',
                    ),
                    const ProfileDetailRow(
                      title: 'Street',
                      value: 'N/a',
                    ),
                    const ProfileDetailRow(
                      title: 'Province',
                      value: 'N/a',
                    ),
                    const ProfileDetailRow(
                      title: 'District',
                      value: 'N/a',
                    ),
                    const ProfileDetailRow(
                      title: 'Country',
                      value: 'N/a',
                    ),
                  ],
                ),
                const SizedBox(height: values.BASE_PADDING),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ProfileInfoHeading(
                      title: 'Membership Information',
                    ),
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
                const SizedBox(height: values.BASE_PADDING),
                const Divider(
                  thickness: 2,
                  color: colors.FIELD_BACKGROUND,
                ),

                /// Join us Today button
                const JoinUsTodayWidget(),
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
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //       horizontal: values.BASE_PADDING),
                //   child: CustomButtonOutline(
                //     title: 'Logout',
                //     color: colors.RED,
                //     onTab: () {
                //       context.read<AuthenticationController>().logOut();
                //       Navigator.pushAndRemoveUntil(
                //         context,
                //         MaterialPageRoute(builder: (_) => const Login()),
                //         (route) => false,
                //       );
                //     },
                //   ),
                // ),
                const SizedBox(height: 120),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _uploadImage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(values.RADIUS),
        ),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: values.BASE_PADDING),
              ListTile(
                leading: const Icon(
                  Icons.photo_library_rounded,
                  color: colors.TEXT_BLUE,
                ),
                title: const Text(
                  'Select photo from gallery',
                  style: TextStyle(
                    color: colors.TEXT_BLUE,
                    fontWeight: FontWeight.bold,
                    fontSize: values.TITLE_TEXT,
                  ),
                ),
                horizontalTitleGap: 0.0,
                onTap: () async {
                  Navigator.pop(context);
                  XFile? image = await _fromGallery();

                  if (image != null) {
                    _saveImage(context, image);
                  }
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.camera_alt_rounded,
                  color: colors.TEXT_BLUE,
                ),
                title: const Text(
                  'Take photo from camera',
                  style: TextStyle(
                    color: colors.TEXT_BLUE,
                    fontWeight: FontWeight.bold,
                    fontSize: values.TITLE_TEXT,
                  ),
                ),
                horizontalTitleGap: 0.0,
                onTap: () async {
                  Navigator.pop(context);
                  XFile? image = await _fromCamera();

                  if (image != null) {
                    _saveImage(context, image);
                  }
                },
              ),
              const SizedBox(height: values.BASE_PADDING),
            ],
          ),
        );
      },
    );
  }

  Future<XFile?> _fromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return image;
  }

  Future<XFile?> _fromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  _saveImage(BuildContext context, XFile image) async {
    final imageBytes = await image.readAsBytes();
    ImageCropping.cropImage(
      context: context,
      imageBytes: imageBytes,
      onImageDoneListener: (data) {
        if (data is Uint8List) {
          log(data.toString());
        }
      },
      selectedImageRatio: ImageRatio.RATIO_1_1,
      colorForWhiteSpace: colors.TEXT_BLACK,
      visibleOtherAspectRatios: false,
      squareCircleColor: colors.BUTTON_GREEN,
    );
  }
}
