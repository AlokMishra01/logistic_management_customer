import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistic_management_customer/controllers/general_controller.dart';
import 'package:logistic_management_customer/controllers/package_controller.dart';
import 'package:logistic_management_customer/providers/blog_provider.dart';
import 'package:logistic_management_customer/utils/greetings_util.dart';
import 'package:logistic_management_customer/utils/string_parser.dart';
import 'package:logistic_management_customer/views/all_notification.dart';
import 'package:logistic_management_customer/views/all_packages.dart';
import 'package:logistic_management_customer/widgets/blog_list_item.dart';
import 'package:logistic_management_customer/widgets/custom_input.dart';
import 'package:logistic_management_customer/widgets/join_us_today_widget.dart';
import 'package:logistic_management_customer/widgets/package_list_item.dart';
import 'package:logistic_management_customer/widgets/services_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../controllers/profile_controller.dart';
import '../widgets/header.dart';
import 'all_blogs.dart';

class Home extends StatefulWidget {
  final Function(int)? changeIndex;

  const Home({
    Key? key,
    this.changeIndex,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _trackText = TextEditingController();
  final CarouselController _carouselController = CarouselController();

  @override
  void dispose() {
    _trackText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileController>();
    final blog = context.watch<BlogProvider>();
    final packages = context.watch<PackageController>();
    final general = context.watch<GeneralController>();
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                title: 'Home',
                trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const AllNotification()),
                    );
                  },
                  icon: const Icon(
                    Icons.notifications_rounded,
                    color: colors.TEXT_BLUE,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: values.BASE_PADDING,
                ),
                child: Text(
                  "${greetingPartOfDay()}, "
                  "${profile.user?.name ?? ''}",
                  style: const TextStyle(
                    fontSize: values.TITLE_TEXT,
                    color: colors.TEXT_SECONDARY,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: values.BASE_PADDING),

              /// Tracking
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: values.BASE_PADDING,
                ),
                child: Text(
                  'Enter your tracking number and view details about your parcel',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: values.TITLE_TEXT,
                    color: colors.TEXT_SECONDARY,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: values.BASE_PADDING,
                ),
                child: CustomInput(
                  controller: _trackText,
                  hint: 'Enter Tracking Number',
                  icon: Icons.search_rounded,
                  onSuffixTab: () {
                    if (_trackText.text.isNotEmpty) {
                      launch(
                        'https://tracking.ikimaexpress.com'
                        '?trackingcode=${_trackText.text}',
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: values.BASE_PADDING),

              /// Banner
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: values.BASE_PADDING,
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
                        items: general.banners.map((i) {
                          return Builder(
                            builder: (cxt) {
                              return Stack(
                                children: [
                                  CachedNetworkImage(
                                    width: double.infinity,
                                    imageUrl: i.image ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: colors.TEXT_BLACK.withOpacity(0.1),
                                  ),
                                  Positioned(
                                    bottom: values.BASE_PADDING / 2,
                                    right: values.BASE_PADDING / 2,
                                    left: values.BASE_PADDING / 2,
                                    child: Text(
                                      removeAllHtmlTags(i.description ?? ''),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: colors.TEXT_WHITE,
                                        fontSize: values.TITLE_TEXT,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              );
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
                      top: values.BASE_PADDING / 2,
                      bottom: values.BASE_PADDING / 2,
                      right: values.BASE_PADDING / 2,
                      child: CircleAvatar(
                        backgroundColor: colors.TEXT_BLACK.withOpacity(0.1),
                        child: IconButton(
                          onPressed: () => _carouselController.nextPage(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.linear,
                          ),
                          icon: const Icon(
                            CupertinoIcons.chevron_forward,
                            color: colors.TEXT_WHITE,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: values.BASE_PADDING / 2,
                      bottom: values.BASE_PADDING / 2,
                      left: values.BASE_PADDING / 2,
                      child: CircleAvatar(
                        backgroundColor: colors.TEXT_BLACK.withOpacity(0.1),
                        child: IconButton(
                          onPressed: () => _carouselController.previousPage(
                            duration: const Duration(milliseconds: 250),
                            curve: Curves.linear,
                          ),
                          icon: const Icon(
                            CupertinoIcons.chevron_back,
                            color: colors.TEXT_WHITE,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: values.BASE_PADDING),

              /// pending request or current package in transit
              if (packages.myRequest != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: values.BASE_PADDING,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "My Requests",
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
                            MaterialPageRoute(
                              builder: (_) => const AllPackages(),
                            ),
                          );
                        },
                        child: Text(
                          'View All',
                          style: GoogleFonts.comfortaa(
                            color: colors.TEXT_BLUE,
                            fontSize: values.DETAILS_TEXT,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: colors.FIELD_BACKGROUND,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(values.RADIUS),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: values.BASE_PADDING,
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: packages.myRequest != null ? 1 : 0,
                  itemBuilder: (_, i) {
                    final p = packages.myRequest;
                    return PackageListItem(p: p!);
                  },
                  separatorBuilder: (_, i) {
                    return const SizedBox(height: values.BASE_PADDING / 2);
                  },
                ),
              ),
              if (packages.myRequest != null)
                const SizedBox(height: values.BASE_PADDING),

              /// Blog - one line only
              if (blog.blogs.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: values.BASE_PADDING,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
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
                            MaterialPageRoute(builder: (_) => const AllBlogs()),
                          );
                        },
                        child: Text(
                          'View All',
                          style: GoogleFonts.comfortaa(
                            color: colors.TEXT_BLUE,
                            fontSize: values.DETAILS_TEXT,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: colors.FIELD_BACKGROUND,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(values.RADIUS),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: values.BASE_PADDING,
                ),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: blog.blogs.length > 1 ? 1 : blog.blogs.length,
                  itemBuilder: (_, i) {
                    return BlogListItem(
                      model: blog.blogs[i],
                    );
                  },
                  separatorBuilder: (_, i) {
                    return const SizedBox(height: values.BASE_PADDING / 2);
                  },
                ),
              ),
              if (blog.blogs.isNotEmpty)
                const SizedBox(height: values.BASE_PADDING),
              const SizedBox(height: values.BASE_PADDING),

              // /// Book a courier button. This button will take to New Order screen
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: values.BASE_PADDING,
              //     vertical: values.BASE_PADDING,
              //   ),
              //   child: CustomButton(
              //     title: 'Book a Courier',
              //     onTab: () {
              //       if (widget.changeIndex != null) {
              //         widget.changeIndex!(1);
              //       }
              //     },
              //   ),
              // ),

              /// Services
              const ServiceWidget(),

              /// Join us Today button
              const JoinUsTodayWidget(),

              const SizedBox(height: 120.0),
            ],
          ),
        ),
      ),
    );
  }
}
