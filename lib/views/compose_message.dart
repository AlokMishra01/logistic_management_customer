import 'package:flutter/material.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/header.dart';

class ComposeMessage extends StatefulWidget {
  @override
  _ComposeMessageState createState() => _ComposeMessageState();
}

class _ComposeMessageState extends State<ComposeMessage> {
  TextEditingController _from = TextEditingController();
  TextEditingController _subject = TextEditingController();
  TextEditingController _message = TextEditingController();

  @override
  void dispose() {
    _from.dispose();
    _subject.dispose();
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(title: 'Compose Message', backButton: true),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: values.BASE_PADDING,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'From',
                          style: TextStyle(
                            color: colors.TEXT_BLUE,
                            fontSize: values.DETAILS_TEXT,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      CustomInput(controller: _from, hint: 'Alok Mishra'),
                      SizedBox(height: values.BASE_PADDING),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Subject',
                          style: TextStyle(
                            color: colors.TEXT_BLUE,
                            fontSize: values.DETAILS_TEXT,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      CustomInput(controller: _subject, hint: ''),
                      SizedBox(height: values.BASE_PADDING),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Message',
                          style: TextStyle(
                            color: colors.TEXT_BLUE,
                            fontSize: values.DETAILS_TEXT,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      CustomInput(
                        controller: _message,
                        hint: '',
                        type: TextInputType.multiline,
                        minLines: 10,
                        maxLines: 10,
                      ),
                      SizedBox(height: values.BASE_PADDING * 2),
                      CustomButton(
                        title: ' SEND ',
                        onTab: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
