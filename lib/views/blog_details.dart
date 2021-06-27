import 'package:flutter/material.dart';
import 'package:logistic_management_customer/models/blog_model.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/header.dart';

class BlogDetails extends StatelessWidget {
  final BlogModel model;

  const BlogDetails({Key? key, required this.model}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              backButton: true,
              title: 'Blog / News',
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(values.BASE_PADDING),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(values.RADIUS),
                        child: Image.asset(
                          'images/banner2.png',
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: values.BASE_PADDING,
                        vertical: values.BASE_PADDING / 2,
                      ),
                      child: Text(
                        'Opening Day Delivery',
                        style: TextStyle(
                          color: colors.TEXT_BLUE,
                          fontWeight: FontWeight.bold,
                          fontSize: values.TITLE_TEXT,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: values.BASE_PADDING,
                        vertical: values.BASE_PADDING / 2,
                      ),
                      child: Text(
                        'Our delivery service started from the date of 2nd Jan, 2021',
                        style: TextStyle(
                          color: colors.TEXT_BLACK,
                          fontWeight: FontWeight.w500,
                          fontSize: values.DETAILS_TEXT,
                        ),
                      ),
                    ),
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
