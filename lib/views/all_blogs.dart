import 'package:flutter/material.dart';
import '../providers/blog_provider.dart';
import 'package:provider/provider.dart';

import '../constants/values.dart' as values;
import '../widgets/blog_list_item.dart';
import '../widgets/header.dart';

class AllBlogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blog = context.watch<BlogProvider>();
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
                  itemCount: blog.blogs.length,
                  itemBuilder: (_, i) {
                    return BlogListItem(model: blog.blogs[i]);
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
