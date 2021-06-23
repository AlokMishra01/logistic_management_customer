import 'package:flutter/material.dart';
import '../../../widgets/old/Widgets/singleBlogCard.dart';

import '../../../constant.dart';

class AllBlogs extends StatefulWidget {
  @override
  _AllBlogsState createState() => _AllBlogsState();
}

class _AllBlogsState extends State<AllBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Constant.theme_col,
            size: 25,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Blog/News",
          style: TextStyle(color: Constant.theme_col, fontSize: 24),
          textAlign: TextAlign.left,
        ),
        titleSpacing: -10,
        shadowColor: Colors.transparent,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, position) {
            return SingleBlogCard();
          }),
    );
  }
}
