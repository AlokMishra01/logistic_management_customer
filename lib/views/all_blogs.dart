import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/values.dart' as values;
import '../providers/blog_provider.dart';
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
                child: RefreshIndicator(
                  onRefresh: () => blog.fetchBlogs(init: true, reload: true),
                  child: ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
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
            ),
          ],
        ),
      ),
    );
  }
}
