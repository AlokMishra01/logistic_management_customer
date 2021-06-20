import 'package:flutter/material.dart';
import 'package:logistic_management_customer/views/register.dart';
import 'package:logistic_management_customer/widgets/header_text.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: values.BASE_PADDING),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HeaderText(text: 'Login'),
                ),
                SizedBox(height: size.height * 0.05),
                CustomInput(hint: "Mobile Number", controller: _phone),
                SizedBox(height: values.BASE_PADDING),
                CustomInput(
                  hint: "Password",
                  obscureText: true,
                  controller: _password,
                ),
                SizedBox(height: values.BASE_PADDING / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: colors.TEXT_BLUE,
                          fontSize: values.BUTTON_TEXT,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: values.BASE_PADDING / 2),
                CustomButton(
                  title: 'Login',
                  onTab: () {},
                ),
                SizedBox(height: values.BASE_PADDING),
                CustomButton(
                  title: "Register",
                  onTab: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (cxt) => Register()),
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
