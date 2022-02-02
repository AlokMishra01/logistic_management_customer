import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

import '../constants/colors.dart' as colors;
import '../constants/enums.dart';
import '../constants/values.dart' as values;
import '../controllers/authentication_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/dialogs/bottom_dialog.dart';
import '../widgets/dialogs/loading_dialog.dart';
import '../widgets/header_text.dart';
import 'main_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _phone.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colors.TEXT_WHITE,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: values.BASE_PADDING,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.1),
                Image.asset(
                  'images/icon.png',
                  fit: BoxFit.cover,
                  width: size.width / 2,
                  height: size.width / 4,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HeaderText(text: 'Register'),
                  ),
                ),
                const SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "First Name",
                  type: TextInputType.name,
                  controller: _firstName,
                  validator: (value) {
                    if ((value as String).isEmpty) {
                      return 'Please enter first name';
                    }
                  },
                ),
                const SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Last Name",
                  controller: _lastName,
                  validator: (value) {
                    if ((value as String).isEmpty) {
                      return 'Please enter last name';
                    }
                  },
                ),
                const SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Mobile Number",
                  controller: _phone,
                  type: TextInputType.phone,
                  // formatters: [
                  //   PhoneInputFormatter(allowEndlessPhone: false),
                  // ],
                  validator: (value) {
                    // if (!isPhoneValid(value as String))
                    //   return 'Please enter valid mobile number';
                    if ((value as String).isEmpty) {
                      return 'Please enter mobile number';
                    }
                  },
                ),
                const SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Email",
                  controller: _email,
                  type: TextInputType.emailAddress,
                  validator: (value) {
                    if (!isEmail(value as String)) {
                      return 'Please enter valid email';
                    }
                  },
                ),
                const SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Password",
                  controller: _password,
                  obscureText: !_showPassword,
                  validator: (v) {
                    if ((v as String).isEmpty) {
                      return 'Please enter password';
                    }
                  },
                  icon: _showPassword
                      ? CupertinoIcons.eye_slash_fill
                      : CupertinoIcons.eye_fill,
                  onSuffixTab: () {
                    _showPassword = !_showPassword;
                    setState(() {});
                  },
                ),
                const SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Confirm Password",
                  controller: _confirmPassword,
                  obscureText: !_showConfirmPassword,
                  validator: (value) {
                    if (_password.text != (value as String)) {
                      return 'Password do not match';
                    }
                  },
                  icon: _showConfirmPassword
                      ? CupertinoIcons.eye_slash_fill
                      : CupertinoIcons.eye_fill,
                  onSuffixTab: () {
                    _showConfirmPassword = !_showConfirmPassword;
                    setState(() {});
                  },
                ),
                const SizedBox(height: values.BASE_PADDING * 1.5),
                CustomButton(title: "CONFIRM", onTab: _register),
                const SizedBox(height: values.BASE_PADDING),
                RichText(
                  text: TextSpan(
                    text: 'Already have an account?',
                    children: [
                      TextSpan(
                        text: ' Login ',
                        style: GoogleFonts.comfortaa(
                          fontWeight: FontWeight.bold,
                          fontSize: values.TITLE_TEXT,
                          color: colors.TEXT_BLUE,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.pop(context),
                      ),
                    ],
                    style: GoogleFonts.comfortaa(
                      fontWeight: FontWeight.bold,
                      fontSize: values.TITLE_TEXT,
                      color: colors.TEXT_BLACK,
                    ),
                  ),
                ),
                // CustomButton(
                //   title: "LOGIN",
                //   onTab: () => Navigator.pop(context),
                // ),
                const SizedBox(height: 120.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _register() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_firstName.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter first name',
      );
      return;
    }
    if (_lastName.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter last name',
      );
      return;
    }
    if (_phone.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter mobile number',
      );
      return;
    }
    if (!isEmail(_email.text)) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter valid email',
      );
      return;
    }
    if (_password.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter password',
      );
      return;
    }
    if (_password.text != _password.text) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Password do not match',
      );
      return;
    }

    var progressDialog = getProgressDialog(context: context);
    progressDialog.show(useSafeArea: false);

    var result = await context.read<AuthenticationController>().register(
          name: '${_firstName.text} ${_lastName.text}',
          email: _email.text,
          phone: _phone.text.replaceAll(' ', ''),
          password: _password.text,
        );

    progressDialog.dismiss();

    if (result.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.SUCCESS,
        title: 'Register Success',
        message: 'You are successfully registered.',
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => const MainPage(),
        ),
        (route) => false,
      );
    } else {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Register Error',
        message: result,
      );
    }
  }
}
