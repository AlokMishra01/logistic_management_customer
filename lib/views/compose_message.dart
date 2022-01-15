import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/header.dart';

class ComposeMessage extends StatefulWidget {
  const ComposeMessage({Key? key}) : super(key: key);

  @override
  _ComposeMessageState createState() => _ComposeMessageState();
}

class _ComposeMessageState extends State<ComposeMessage> {
  final TextEditingController _from = TextEditingController();
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _message = TextEditingController();

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
            const Header(
              title: 'Compose Message',
              backButton: true,
            ),
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
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'Subject',
                          style: GoogleFonts.comfortaa(
                            color: colors.TEXT_BLUE,
                            fontSize: values.DETAILS_TEXT,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      CustomInput(controller: _subject, hint: ''),
                      const SizedBox(height: values.BASE_PADDING),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Message',
                          style: GoogleFonts.comfortaa(
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
                        minLines: 8,
                        maxLines: 8,
                      ),
                      const SizedBox(height: values.BASE_PADDING * 2),
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
