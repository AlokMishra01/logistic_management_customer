import 'package:flutter/material.dart';

import '../constants/values.dart' as values;
import '../widgets/header.dart';

class AllBlogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final blog = context.watch<BlogProvider>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              backButton: true,
              title: 'Blog / News',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: values.BASE_PADDING - 4,
                  vertical: values.BASE_PADDING / 2,
                ),
                child: ListView(),
                // child: RefreshIndicator(
                //   onRefresh: () => blog.fetchBlogs(init: true, reload: true),
                //   child: ListView.separated(
                //     physics: AlwaysScrollableScrollPhysics(),
                //     itemCount: blog.blogs.length,
                //     itemBuilder: (_, i) {
                //       return BlogListItem(model: blog.blogs[i]);
                //     },
                //     separatorBuilder: (_, i) {
                //       return SizedBox(height: values.BASE_PADDING / 2);
                //     },
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
