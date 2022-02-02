import 'package:flutter/material.dart';
import 'package:logistic_management_customer/models/message_response_model.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/header.dart';

class MessageDetails extends StatelessWidget {
  final MessageModel model;

  const MessageDetails({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              backButton: true,
              title: model.subject ?? '',
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(values.BASE_PADDING),
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(values.RADIUS),
                    //     child: Image.network(
                    //       isURL(model. ?? '', requireProtocol: true)
                    //           ? model.image ??
                    //               'https://media.carphonewarehouse.com/is/image/cpw2/essentials-bundle-for-google-pixel-4aNA?\$accessories\$'
                    //           : 'https://media.carphonewarehouse.com/is/image/cpw2/essentials-bundle-for-google-pixel-4aNA?\$accessories\$',
                    //       width: double.infinity,
                    //       fit: BoxFit.fitWidth,
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: values.BASE_PADDING,
                      ),
                      child: Text(
                        '${model.message}',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: colors.TEXT_BLACK,
                          fontSize: values.TITLE_TEXT,
                        ),
                      ),
                    ),
                    const SizedBox(height: 120.0),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: values.BASE_PADDING / 2,
                    //   ),
                    //   child: Html(
                    //     data: model.description,
                    //     shrinkWrap: true,
                    //     onLinkTap: (url, cxt, map, element) {
                    //       launch(url ?? '');
                    //     },
                    //   ),
                    // ),
                    SizedBox(height: 120.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
