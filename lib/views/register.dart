import 'package:flutter/material.dart';

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
                CustomInput(hint: "Name", controller: _name),
                SizedBox(height: values.BASE_PADDING),
                CustomInput(hint: "Address", controller: _address),
                SizedBox(height: values.BASE_PADDING),
                CustomInput(hint: "Mobile Number", controller: _phone),
                SizedBox(height: values.BASE_PADDING),
                CustomInput(hint: "Email", controller: _email),
                SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Password",
                  controller: _email,
                  obscureText: true,
                ),
                SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Confirm Password",
                  controller: _email,
                  obscureText: true,
                ),
                SizedBox(height: values.BASE_PADDING * 1.5),
                CustomButton(
                  title: "CONFIRM",
                  onTab: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (cxt) => OTPVerification()),
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
