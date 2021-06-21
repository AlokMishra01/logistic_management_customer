import 'package:flutter/material.dart';

import '../constants/values.dart' as values;
import '../widgets/custom_button.dart';
import '../widgets/custom_button_outline.dart';
import '../widgets/custom_input.dart';
import '../widgets/header_text.dart';
import 'old/Pages/home.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  TextEditingController _phone = TextEditingController();
  TextEditingController _otp = TextEditingController();

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
                CustomInput(hint: "Mobile Number", controller: _phone),
                SizedBox(height: values.BASE_PADDING),
                CustomInput(
                    hint: "Please Enter Verification Code", controller: _otp),
                SizedBox(height: values.BASE_PADDING * 1.5),
                CustomButtonOutline(
                  title: "RE-SEND CODE",
                  onTab: () {},
                ),
                SizedBox(height: values.BASE_PADDING),
                CustomButton(
                  title: "NEXT",
                  onTab: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (cxt) => Home()),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
