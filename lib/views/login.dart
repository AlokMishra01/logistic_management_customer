import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/header_text.dart';
import 'register.dart';

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
            padding: const EdgeInsets.symmetric(
              horizontal: values.BASE_PADDING,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HeaderText(text: 'Login'),
                ),
                SizedBox(height: size.height * 0.05),
                CustomInput(
                  hint: "Mobile Number",
                  controller: _phone,
                  type: TextInputType.phone,
                  formatters: [
                    PhoneInputFormatter(allowEndlessPhone: false),
                  ],
                  validator: ,
                ),
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
                  title: 'LOGIN',
                  onTab: () {},
                ),
                SizedBox(height: values.BASE_PADDING),
                CustomButton(
                  title: "REGISTER",
                  onTab: () => Navigator.push(
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
