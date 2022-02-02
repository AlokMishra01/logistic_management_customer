import 'package:flutter/material.dart';
import 'package:logistic_management_customer/providers/blog_provider.dart';
import 'package:logistic_management_customer/widgets/blog_list_item.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/header.dart';

class AllBlogs extends StatelessWidget {
  const AllBlogs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blog = context.watch<BlogProvider>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              backButton: true,
              title: 'Blog / News',
            ),
            if (blog.blogs.isNotEmpty)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: values.BASE_PADDING - 4,
                    vertical: values.BASE_PADDING / 2,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () => blog.fetchBlogs(init: true, reload: true),
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: blog.blogs.length,
                      itemBuilder: (_, i) {
                        return BlogListItem(model: blog.blogs[i]);
                      },
                      separatorBuilder: (_, i) {
                        return const SizedBox(height: values.BASE_PADDING);
                      },
                    ),
                  ),
                ),
              ),
            if (blog.blogs.isEmpty)
              const Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(values.BASE_PADDING * 2),
                    child: Text(
                      'No blogs right now.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colors.TEXT_SECONDARY,
                        fontSize: values.SUB_HEADER_TEXT,
                        fontWeight: FontWeight.bold,
                      ),
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
