import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logistic_management_customer/providers/blog_provider.dart';
import 'package:logistic_management_customer/widgets/blog_list_item.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../providers/authentication.dart';
import '../widgets/header.dart';
import 'all_blogs.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthenticationProvider>();
    final blog = context.watch<BlogProvider>();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(title: 'Home'),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: values.BASE_PADDING,
            ),
            child: Text(
              "Good Morning, "
              "${auth.consumer!.firstname} ${auth.consumer!.lastname}",
              style: TextStyle(
                fontSize: values.TITLE_TEXT,
                color: colors.TEXT_SECONDARY,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: values.BASE_PADDING),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: values.BASE_PADDING - 4,
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(values.RADIUS),
                  child: CarouselSlider(
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      aspectRatio: 320 / 164,
                      viewportFraction: 1,
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            'images/banner1.png',
                            fit: BoxFit.cover,
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  bottom: values.BASE_PADDING / 2,
                  right: values.BASE_PADDING / 2,
                  child: CircleAvatar(
                    backgroundColor: colors.TEXT_WHITE,
                    child: IconButton(
                      onPressed: () => _carouselController.nextPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.linear,
                      ),
                      icon: Icon(
                        CupertinoIcons.chevron_forward,
                        color: colors.TEXT_BLUE,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: values.BASE_PADDING),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: values.BASE_PADDING - 4,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Blog / News",
                  style: TextStyle(
                    color: colors.TEXT_BLUE,
                    fontSize: values.TITLE_TEXT,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => AllBlogs()),
                    );
                  },
                  child: Text('View All'),
                  style: TextButton.styleFrom(
                    backgroundColor: colors.FIELD_BACKGROUND,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(values.RADIUS),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    textStyle: TextStyle(
                      color: colors.TEXT_BLUE,
                      fontSize: values.DETAILS_TEXT + 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: values.BASE_PADDING - 4,
              vertical: values.BASE_PADDING / 2,
            ),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: blog.blogs.length > 2 ? 2 : blog.blogs.length,
              itemBuilder: (_, i) {
                return BlogListItem(
                  model: blog.blogs[i],
                );
              },
              separatorBuilder: (_, i) {
                return SizedBox(height: values.BASE_PADDING / 2);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: values.BASE_PADDING - 4,
              vertical: values.BASE_PADDING / 2,
            ),
            child: Container(
              padding: const EdgeInsets.all(values.BASE_PADDING),
              decoration: BoxDecoration(
                color: colors.BUTTON_BLUE,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      "Be our prime minister and get "
                      "one day delivery service and more",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: values.DETAILS_TEXT,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: values.BASE_PADDING),
                  TextButton(
                    onPressed: () {},
                    child: Text('BUY NOW'),
                    style: TextButton.styleFrom(
                      backgroundColor: colors.FIELD_BACKGROUND,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(values.RADIUS),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 0.0,
                      ),
                      textStyle: TextStyle(
                        color: colors.TEXT_BLUE,
                        fontSize: values.DETAILS_TEXT,
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
