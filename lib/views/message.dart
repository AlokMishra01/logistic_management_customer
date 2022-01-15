import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/date_text.dart';
import '../widgets/header.dart';
import '../widgets/message_list_item.dart';
import 'compose_message.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Header(
        title: 'Message',
        trailing: Padding(
          padding: const EdgeInsets.symmetric(horizontal: values.BASE_PADDING),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ComposeMessage(),
                ),
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.edit_rounded,
                  color: colors.TEXT_BLUE,
                  size: 18.0,
                ),
                Text(
                  ' Compose ',
                  style: GoogleFonts.comfortaa(
                    color: colors.TEXT_BLUE,
                    fontSize: values.DETAILS_TEXT,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            style: TextButton.styleFrom(
              backgroundColor: colors.FIELD_BACKGROUND,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(values.RADIUS),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 4.0,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: values.BASE_PADDING),
      const DateText(date: "2nd Jan,2021"),
      const SizedBox(height: values.BASE_PADDING / 2),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (_, i) {
          return const MessageListItem();
        },
      ),
      const SizedBox(height: values.BASE_PADDING),
      const DateText(date: "1st Jan,2021"),
      const SizedBox(height: values.BASE_PADDING / 2),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (_, i) {
          return const MessageListItem();
        },
      ),
    ]);
  }
}
