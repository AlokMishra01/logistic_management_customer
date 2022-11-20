import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/colors.dart' as colors;
import '../constants/colors.dart';
import '../constants/enums.dart';
import '../constants/values.dart' as values;
import '../constants/values.dart';
import '../controllers/authentication_controller.dart';
import '../controllers/package_controller.dart';
import '../controllers/profile_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/dialogs/bottom_dialog.dart';
import '../widgets/dialogs/custom_dialog.dart' as customDialog;
import '../widgets/dialogs/loading_dialog.dart';
import '../widgets/header.dart';
import '../widgets/join_us_today_widget.dart';
import '../widgets/profile_info_heading.dart';
import '../widgets/single_personal_detail.dart';
import 'address_update.dart';
import 'change_password.dart';
import 'login.dart';
import 'my_request.dart';
import 'profile_update.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final profile = context.watch<ProfileController>();
    return Column(
      children: [
        Header(
            title: 'Profile',
            trailing: IconButton(
              onPressed: () {
                customDialog.CustomDialogs.dialogs.showCustomDialog(
                  context: context,
                  type: customDialog.DialogType.logout,
                );
                // context.read<AuthenticationController>().logOut();
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (_) => const Login()),
                //   (route) => false,
                // );
              },
              icon: const Icon(
                Icons.exit_to_app_rounded,
                color: colors.RED,
              ),
              tooltip: 'Logout',
            )
            // trailing: Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: values.BASE_PADDING,
            //   ),
            //   child: TextButton(
            //     onPressed: () {
            //       context.read<AuthenticationController>().logOut();
            //       Navigator.pushAndRemoveUntil(
            //         context,
            //         MaterialPageRoute(builder: (_) => const Login()),
            //         (route) => false,
            //       );
            //     },
            //     child: Text(
            //       'Logout',
            //       style: GoogleFonts.comfortaa(
            //         color: colors.TEXT_WHITE,
            //         fontSize: values.DETAILS_TEXT,
            //         fontWeight: FontWeight.w400,
            //         height: 1.25,
            //       ),
            //     ),
            //     style: TextButton.styleFrom(
            //       backgroundColor: colors.RED,
            //       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(values.RADIUS),
            //       ),
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 16.0,
            //         vertical: 0.0,
            //       ),
            //     ),
            //   ),
            // ),
            ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => profile.getProfile(),
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
                          backgroundImage: NetworkImage(
                            profile.user?.image ?? '',
                          ),
                          radius: size.width * 0.2,
                          backgroundColor: colors.TEXT_BLUE.withOpacity(0.2),
                        ),
                        Positioned(
                          bottom: 4.0,
                          right: 4.0,
                          child: CircleAvatar(
                            radius: 18.0,
                            backgroundColor: colors.TEXT_WHITE,
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
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ChangePassword(),
                        ),
                      );
                    },
                    child: const Text(
                      'Change Password',
                      style: TextStyle(
                        color: RED,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(RADIUS),
                        // side: BorderSide(
                        //   color: RED,
                        // ),
                      ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const AddressUpdate(),
                            ),
                          );
                        },
                      ),
                      ProfileDetailRow(
                        title: 'City',
                        value: profile.user?.city ?? '',
                      ),
                      ProfileDetailRow(
                        title: 'Street',
                        value: profile.user?.street ?? '',
                      ),
                      ProfileDetailRow(
                        title: 'Province',
                        value: profile.user?.province ?? '',
                      ),
                      ProfileDetailRow(
                        title: 'District',
                        value: profile.user?.district ?? '',
                      ),
                      ProfileDetailRow(
                        title: 'Country',
                        value: profile.user?.country ?? '',
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
                      title: 'History',
                      onTab: () {
                        context.read<PackageController>().getPackageList();
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: values.BASE_PADDING,
                      vertical: values.BASE_PADDING,
                    ),
                    child: CustomButton(
                      title: 'Remove Account',
                      color: colors.RED,
                      onTab: _remove,
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
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
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressFormat: ImageCompressFormat.jpg,
      maxHeight: 200,
      maxWidth: 200,
      aspectRatioPresets: [CropAspectRatioPreset.square],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Profile Image',
          toolbarColor: colors.BUTTON_BLUE,
          toolbarWidgetColor: colors.TEXT_WHITE,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          hideBottomControls: true,
          activeControlsWidgetColor: colors.BUTTON_BLUE,
        ),
        IOSUiSettings(
          title: 'Crop Profile Image',
        )
      ],
    );

    if (croppedImage != null) {
      var progressDialog = getProgressDialog(context: context);
      progressDialog.show(useSafeArea: false);

      var result = await context
          .read<ProfileController>()
          .updateImage(path: croppedImage.path);

      progressDialog.dismiss();

      if (result) {
        showBottomDialog(
          context: context,
          dialogType: DialogType.SUCCESS,
          title: 'Update Successfully',
          message: 'Your address is updated successfully.',
        );
      } else {
        showBottomDialog(
          context: context,
          dialogType: DialogType.ERROR,
          title: 'Update Error',
        );
      }
    } else {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Update Error',
      );
    }
  }

  _remove() async {
    FocusScope.of(context).requestFocus(FocusNode());

    var progressDialog = getProgressDialog(context: context);
    progressDialog.show(useSafeArea: false);

    bool b = await context.read<AuthenticationController>().removeAccount();

    SharedPreferences s = await SharedPreferences.getInstance();
    await s.clear();
    progressDialog.dismiss();

    showBottomDialog(
      context: context,
      dialogType: DialogType.SUCCESS,
      title: 'Success',
      message: 'Your account is successfully removed.',
    );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const Login()),
      (route) => false,
    );
  }
}
