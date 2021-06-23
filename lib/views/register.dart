import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';
import 'package:validators/validators.dart';

import '../constants/enums.dart' as enums;
import '../constants/values.dart' as values;
import '../models/consumer_mode.dart';
import '../providers/authentication.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/dialogs/bottom_dialog.dart';
import '../widgets/header_text.dart';
import 'otp_verification.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  bool _showPassword = false;

  bool _loading = false;

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: values.BASE_PADDING,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HeaderText(text: 'Register'),
                ),
                SizedBox(height: size.height * 0.05),
                CustomInput(
                  hint: "First Name",
                  type: TextInputType.name,
                  controller: _firstName,
                  validator: (value) {
                    if ((value as String).isEmpty)
                      return 'Please enter first name';
                  },
                ),
                SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Last Name",
                  controller: _lastName,
                  validator: (value) {
                    if ((value as String).isEmpty)
                      return 'Please enter last name';
                  },
                ),
                SizedBox(height: values.BASE_PADDING),
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
                SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Email",
                  controller: _email,
                  type: TextInputType.emailAddress,
                  validator: (value) {
                    if (!isEmail(value as String))
                      return 'Please enter valid email';
                  },
                ),
                SizedBox(height: values.BASE_PADDING),
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
                SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Confirm Password",
                  controller: _confirmPassword,
                  obscureText: true,
                  validator: (value) {
                    if (_password.text != (value as String)) {
                      return 'Password do not match';
                    }
                  },
                ),
                SizedBox(height: values.BASE_PADDING * 1.5),
                _loading
                    ? Center(child: CircularProgressIndicator())
                    : CustomButton(title: "CONFIRM", onTab: _register),
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
        dialogType: enums.DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter first name',
      );
      return;
    }
    if (_lastName.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: enums.DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter last name',
      );
      return;
    }
    // if (!isPhoneValid(_phone.text)) {
    //   showBottomDialog(
    //     context: context,
    //     dialogType: enums.DialogType.ERROR,
    //     title: 'ERROR!',
    //     message: 'Please enter valid mobile number',
    //   );
    //   return;
    // }
    if (_phone.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: enums.DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter mobile number',
      );
      return;
    }
    if (!isEmail(_email.text)) {
      showBottomDialog(
        context: context,
        dialogType: enums.DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter valid email',
      );
      return;
    }
    if (_password.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: enums.DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter password',
      );
      return;
    }
    if (_password.text != _password.text) {
      showBottomDialog(
        context: context,
        dialogType: enums.DialogType.ERROR,
        title: 'ERROR!',
        message: 'Password do not match',
      );
      return;
    }

    _loading = true;
    setState(() {});

    var result = await context.read<AuthenticationProvider>().register(
          firstName: _firstName.text,
          lastName: _lastName.text,
          email: _email.text,
          phone: _phone.text.replaceAll(' ', ''),
          password: _password.text,
        );

    if (result is ConsumerModel) {
      if (result.id != null && result.token != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => OTPVerification(
              id: result.id!,
              phone: _phone.text,
            ),
          ),
        );
      } else {
        showBottomDialog(
          context: context,
          dialogType: enums.DialogType.ERROR,
          title: 'Register Error',
          message: 'Oops! Something went wrong. Please try again.',
        );
      }
    } else if (result is String) {
      showBottomDialog(
        context: context,
        dialogType: enums.DialogType.ERROR,
        title: 'Register Error',
        message: result,
      );
    } else {
      showBottomDialog(
        context: context,
        dialogType: enums.DialogType.ERROR,
        title: 'Register Error',
        message: 'Oops! Something went wrong. Please try again.',
      );
    }
    _loading = false;
    setState(() {});
  }
}
