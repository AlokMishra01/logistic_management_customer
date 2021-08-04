import 'package:flutter/material.dart';
import 'package:logistic_management_customer/models/blog_model.dart';
import 'package:logistic_management_customer/utils/string_parser.dart';
import 'package:logistic_management_customer/views/blog_details.dart';
import 'package:validators/validators.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class BlogListItem extends StatelessWidget {
  final BlogModel model;

  const BlogListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlogDetails(
              model: model,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: colors.FIELD_BACKGROUND,
          borderRadius: BorderRadius.circular(values.RADIUS),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(values.BASE_PADDING / 2),
              child: Material(
                elevation: values.ELEVATION,
                borderRadius: BorderRadius.circular(values.RADIUS),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(values.RADIUS),
                  child: Image.network(
                    isURL(model.image ?? '', requireProtocol: true)
                        ? model.image ??
                            'https://media.carphonewarehouse.com/is/image/cpw2/essentials-bundle-for-google-pixel-4aNA?\$accessories\$'
                        : 'https://media.carphonewarehouse.com/is/image/cpw2/essentials-bundle-for-google-pixel-4aNA?\$accessories\$',
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: values.BASE_PADDING / 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0),
                    Text(
                      model.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: values.TITLE_TEXT - 2,
                        color: colors.TEXT_BLACK,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      removeAllHtmlTags(model.description ?? ''),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: colors.TEXT_SECONDARY,
                        fontSize: values.DETAILS_TEXT,
                        wordSpacing: 0.015,
                      ),
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
            SizedBox(width: values.BASE_PADDING / 2)
          ],
        ),
      ),
    );
  }
}
