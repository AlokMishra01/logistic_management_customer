import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../controllers/message_controller.dart';
import '../widgets/header.dart';
import '../widgets/message_list_item.dart';
import 'compose_message.dart';

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = context.watch<MessageController>();
    return Column(
      children: [
        Header(
          title: 'Message',
          trailing: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ComposeMessage(),
                ),
              );
            },
            icon: const Icon(
              Icons.edit_rounded,
              color: colors.TEXT_BLUE,
            ),
          ),
          // trailing: Padding(
          //   padding:
          //       const EdgeInsets.symmetric(horizontal: values.BASE_PADDING),
          //   child: TextButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (_) => const ComposeMessage(),
          //         ),
          //       );
          //     },
          //     child: Row(
          //       children: [
          //         const Icon(
          //           Icons.edit_rounded,
          //           color: colors.TEXT_BLUE,
          //           size: 18.0,
          //         ),
          //         Text(
          //           ' Compose ',
          //           style: GoogleFonts.comfortaa(
          //             color: colors.TEXT_BLUE,
          //             fontSize: values.DETAILS_TEXT,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //       ],
          //     ),
          //     style: TextButton.styleFrom(
          //       backgroundColor: colors.FIELD_BACKGROUND,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(values.RADIUS),
          //       ),
          //       padding: const EdgeInsets.symmetric(
          //         horizontal: 12.0,
          //         vertical: 4.0,
          //       ),
          //     ),
          //   ),
          // ),
        ),
        const SizedBox(height: values.BASE_PADDING),
        // const DateText(date: "2nd Jan,2021"),
        // const SizedBox(height: values.BASE_PADDING / 2),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: message.messages.length,
          itemBuilder: (_, i) {
            final m = message.messages[i];
            return MessageListItem(
              message: m,
            );
          },
        ),
        if (message.messages.isNotEmpty) const SizedBox(height: 120.0),
        if (message.messages.isEmpty)
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(values.BASE_PADDING * 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'No messages right now.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colors.TEXT_SECONDARY,
                        fontSize: values.SUB_HEADER_TEXT,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => message.getMessages(),
                      icon: const Icon(Icons.refresh_rounded),
                    ),
                  ],
                ),
              ),
            ),
          ),
        // const SizedBox(height: values.BASE_PADDING),
        // const DateText(date: "1st Jan,2021"),
        // const SizedBox(height: values.BASE_PADDING / 2),
        // ListView.builder(
        //   physics: const NeverScrollableScrollPhysics(),
        //   shrinkWrap: true,
        //   itemCount: 2,
        //   itemBuilder: (_, i) {
        //     return const MessageListItem();
        //   },
        // ),
      ],
    );
  }
}
