import 'dart:async';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/provider.dart';

import '../constants/enums.dart' as enums;
import '../constants/values.dart' as values;
import '../models/consumer_mode.dart';
import '../providers/authentication.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_button_outline.dart';
import '../widgets/custom_input.dart';
import '../widgets/dialogs/bottom_dialog.dart';
import '../widgets/header_text.dart';
import 'old/Pages/home.dart';

class OTPVerification extends StatefulWidget {
  final int id;
  final String phone;

  const OTPVerification({
    Key? key,
    required this.id,
    required this.phone,
  }) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  TextEditingController _phone = TextEditingController();
  TextEditingController _otp = TextEditingController();
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _phone.text = widget.phone;
  }

  @override
  void dispose() {
    _phone.dispose();
    _otp.dispose();
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
                  child: HeaderText(text: 'Verification'),
                ),
                SizedBox(height: size.height * 0.05),
                CustomInput(
                  hint: "Mobile Number",
                  controller: _phone,
                  enabled: false,
                  formatters: [PhoneInputFormatter(allowEndlessPhone: false)],
                ),
                SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Please Enter Verification Code",
                  controller: _otp,
                  type: TextInputType.number,
                  enabled: true,
                  validator: (value) {
                    if ((value as String).isEmpty) {
                      return 'Please enter verification code (OTP)';
                    }
                  },
                ),
                SizedBox(height: values.BASE_PADDING * 1.5),
                CustomButtonOutline(
                  title: "RE-SEND CODE",
                  onTab: () {},
                ),
                SizedBox(height: values.BASE_PADDING),
                _loading
                    ? Center(child: CircularProgressIndicator())
                    : CustomButton(title: "NEXT", onTab: _verifyOTP),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _verifyOTP() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_otp.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: enums.DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter verification code (OTP)',
      );
      return;
    }

    _loading = true;
    setState(() {});

    var loginResult = await context.read<AuthenticationProvider>().verifyOTP(
          id: widget.id,
          otp: _otp.text,
        );

    if (loginResult is ConsumerModel) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => Home()),
        (route) => false,
      );
    } else if (loginResult is String) {
      showBottomDialog(
        context: context,
        dialogType: enums.DialogType.ERROR,
        title: 'Verify OTP Error',
        message: loginResult,
      );
    } else {
      showBottomDialog(
        context: context,
        dialogType: enums.DialogType.ERROR,
        title: 'Verify OTP Error',
        message: 'Oops! Something went wrong. Please try again.',
      );
    }

    _loading = false;
    setState(() {});
  }
}
