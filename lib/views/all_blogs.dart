import 'package:flutter/material.dart';

import '../constants/values.dart' as values;
import '../widgets/blog_list_item.dart';
import '../widgets/header.dart';

class AllBlogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(
              backButton: true,
              title: 'Blog / News',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: values.BASE_PADDING - 4,
                  vertical: values.BASE_PADDING / 2,
                ),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (_, i) {
                    return BlogListItem();
                  },
                  separatorBuilder: (_, i) {
                    return SizedBox(height: values.BASE_PADDING / 2);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
