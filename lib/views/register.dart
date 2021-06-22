import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:validators/validators.dart';

import '../constants/values.dart' as values;
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/header_text.dart';
import 'otp_verification.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  bool _showPassword = false;

  @override
  void dispose() {
    _name.dispose();
    _address.dispose();
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
                  hint: "Name",
                  type: TextInputType.name,
                  controller: _name,
                  validator: (value) {
                    if ((value as String).length < 3)
                      return 'Name must contain atleast 3 characters';
                  },
                ),
                SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Address",
                  controller: _address,
                  validator: (value) {
                    if ((value as String).length < 3)
                      return 'Name must contain atleast 3 characters';
                  },
                ),
                SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Mobile Number",
                  controller: _phone,
                  type: TextInputType.phone,
                  formatters: [
                    PhoneInputFormatter(allowEndlessPhone: false),
                  ],
                  validator: (value) {
                    if (!isPhoneValid(value as String))
                      return 'Please enter valid mobile number';
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
                    if ((v as String).length < 6) {
                      return 'Password must contail atleast 6 characters';
                    }
                  },
                  icon: !_showPassword
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
                CustomButton(
                  title: "CONFIRM",
                  onTab: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (cxt) =>
                          OTPVerification(phone: '+9779869050723'),
                    ),
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
