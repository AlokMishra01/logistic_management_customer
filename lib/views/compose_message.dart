import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/enums.dart';
import '../constants/values.dart' as values;
import '../controllers/message_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';
import '../widgets/dialogs/bottom_dialog.dart';
import '../widgets/dialogs/loading_dialog.dart';
import '../widgets/header.dart';

class ComposeMessage extends StatefulWidget {
  const ComposeMessage({Key? key}) : super(key: key);

  @override
  _ComposeMessageState createState() => _ComposeMessageState();
}

class _ComposeMessageState extends State<ComposeMessage> {
  final TextEditingController _subject = TextEditingController();
  final TextEditingController _message = TextEditingController();

  @override
  void dispose() {
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
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Subject',
                          style: GoogleFonts.comfortaa(
                            color: colors.TEXT_BLUE,
                            fontSize: values.TITLE_TEXT,
                            fontWeight: FontWeight.w700,
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
                            fontSize: values.TITLE_TEXT,
                            fontWeight: FontWeight.w700,
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
                        onTab: _save,
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

  _save() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (_subject.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter subject',
      );
      return;
    }
    if (_message.text.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'ERROR!',
        message: 'Please enter message',
      );
      return;
    }

    var progressDialog = getProgressDialog(context: context);
    progressDialog.show(useSafeArea: false);

    var result = await context.read<MessageController>().sendMessage(
          subject: _subject.text,
          message: _message.text,
        );

    progressDialog.dismiss();

    if (result.isEmpty) {
      showBottomDialog(
        context: context,
        dialogType: DialogType.SUCCESS,
        title: 'Message Sent Successfully',
        message: 'Your message is sent successfully.',
      );
      Navigator.pop(context);
    } else {
      showBottomDialog(
        context: context,
        dialogType: DialogType.ERROR,
        title: 'Error',
        message: result,
      );
    }
  }
}
