import 'package:flutter/material.dart';
import 'package:logistic_management_customer/controllers/package_controller.dart';
import 'package:logistic_management_customer/widgets/package_list_item.dart';
import 'package:logistic_management_customer/widgets/type_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/api_constants.dart';
import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/header.dart';

class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {
  int val = 0;
  final _trackingCode = TextEditingController();

  @override
  void dispose() {
    _trackingCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final packages = context.watch<PackageController>();
    return RefreshIndicator(
      onRefresh: () => packages.getPackageList(
        status: val == 0 ? 'Pending' : 'Delivered',
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Header(title: 'Track'),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING,
              ),
              child: Text(
                'You can now track your package live just '
                'enter the housing airway bill number and proceed.',
                style: TextStyle(
                  color: colors.TEXT_BLACK,
                  fontSize: values.TITLE_TEXT,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(values.BASE_PADDING),
              child: TextFormField(
                controller: _trackingCode,
                decoration: InputDecoration(
                  hintText: "Enter your HAWB number",
                  hintStyle: const TextStyle(
                    color: colors.TEXT_SECONDARY,
                    fontSize: values.TITLE_TEXT,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(values.RADIUS),
                    borderSide: const BorderSide(
                      color: colors.TEXT_SECONDARY,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(values.RADIUS),
                    borderSide: const BorderSide(
                      color: colors.TEXT_SECONDARY,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusColor: colors.FIELD_BACKGROUND,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(values.RADIUS),
                    borderSide: const BorderSide(
                      color: colors.TEXT_SECONDARY,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: colors.TEXT_BLACK,
                  fontSize: values.TITLE_TEXT,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING,
              ),
              child: Text(
                "Track up to 10 numbers at a time. Separate by a comma (,)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colors.TEXT_BLACK,
                  fontSize: values.DETAILS_TEXT,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: values.BASE_PADDING),
            TextButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                if (_trackingCode.text.isNotEmpty) {
                  launch(
                    '${APIConstants.tracking}'
                    '?trackingcode=${_trackingCode.text}',
                  );
                }
              },
              child: const Text(
                ' TRACK ',
                style: TextStyle(
                  fontSize: values.BUTTON_TEXT,
                  color: colors.TEXT_WHITE,
                  fontWeight: FontWeight.bold,
                  height: 1.35,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: colors.BUTTON_GREEN,
                padding: const EdgeInsets.symmetric(
                  horizontal: values.BASE_PADDING * 2,
                  vertical: values.BASE_PADDING,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(values.RADIUS / 2),
                ),
              ),
            ),
            const Divider(
              height: values.BASE_PADDING * 4,
              thickness: 3,
              color: colors.FIELD_BACKGROUND,
            ),
            Padding(
              padding: const EdgeInsets.all(values.BASE_PADDING),
              child: Container(
                decoration: BoxDecoration(
                  color: colors.FIELD_BACKGROUND,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    TypeBar(
                      title: "Pending",
                      selected: val == 0,
                      onTab: () {
                        val = 0;
                        setState(() {});
                      },
                    ),
                    TypeBar(
                      title: "Delivered",
                      selected: val == 1,
                      onTab: () {
                        val = 1;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING,
              ),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: val == 0
                    ? packages.packagePending.length
                    : packages.packageCompleted.length,
                itemBuilder: (_, i) {
                  final p = (val == 0
                      ? packages.packagePending
                      : packages.packageCompleted)[i];
                  return PackageListItem(p: p);
                },
                separatorBuilder: (_, i) {
                  return const SizedBox(height: values.BASE_PADDING / 2);
                },
              ),
            ),

            if ((val == 0 ? packages.packagePending : packages.packageCompleted)
                .isEmpty)
              Padding(
                padding: const EdgeInsets.all(values.BASE_PADDING * 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'No ${val == 0 ? 'pending' : 'delivered'} package',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: colors.TEXT_SECONDARY,
                        fontSize: values.SUB_HEADER_TEXT,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => packages.getPackageList(
                        status: val == 0 ? 'Pending' : 'Delivered',
                      ),
                      icon: const Icon(Icons.refresh_rounded),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 120.0),
            // Container(
            //   padding: EdgeInsets.all(values.BASE_PADDING),
            //   margin: EdgeInsets.all(values.BASE_PADDING),
            //   decoration: BoxDecoration(
            //     color: colors.FIELD_BACKGROUND,
            //     borderRadius: BorderRadius.circular(values.RADIUS),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           Text(
            //             "Rs 500",
            //             textAlign: TextAlign.right,
            //             style: TextStyle(
            //               fontSize: values.DETAILS_TEXT,
            //               fontWeight: FontWeight.w500,
            //             ),
            //           ),
            //         ],
            //       ),
            //       RichText(
            //         text: TextSpan(
            //           text: "Reciever Name :  ",
            //           style: TextStyle(
            //             fontSize: values.DETAILS_TEXT,
            //             fontWeight: FontWeight.w500,
            //             color: colors.TEXT_SECONDARY,
            //             height: 1.5,
            //           ),
            //           children: [
            //             TextSpan(
            //               text: "Raj Kumar Thapa",
            //               style: TextStyle(
            //                 fontSize: values.DETAILS_TEXT,
            //                 fontWeight: FontWeight.w600,
            //                 color: colors.TEXT_BLACK,
            //                 height: 1.5,
            //               ),
            //             )
            //           ],
            //         ),
            //         softWrap: true,
            //       ),
            //       RichText(
            //         text: TextSpan(
            //           text: "Address :  ",
            //           style: TextStyle(
            //             fontSize: values.DETAILS_TEXT,
            //             fontWeight: FontWeight.w500,
            //             color: colors.TEXT_SECONDARY,
            //             height: 1.5,
            //           ),
            //           children: [
            //             TextSpan(
            //               text: "Bhaktapur",
            //               style: TextStyle(
            //                 fontSize: values.DETAILS_TEXT,
            //                 fontWeight: FontWeight.w600,
            //                 color: colors.TEXT_BLACK,
            //                 height: 1.5,
            //               ),
            //             )
            //           ],
            //         ),
            //         softWrap: true,
            //       ),
            //       RichText(
            //         text: TextSpan(
            //           text: "Current Status :  ",
            //           style: TextStyle(
            //             fontSize: values.DETAILS_TEXT,
            //             fontWeight: FontWeight.w500,
            //             color: colors.TEXT_SECONDARY,
            //             height: 1.5,
            //           ),
            //           children: [
            //             TextSpan(
            //               text: "At Kathmandu WareHouse",
            //               style: TextStyle(
            //                 fontSize: values.DETAILS_TEXT,
            //                 fontWeight: FontWeight.w600,
            //                 color: colors.BUTTON_GREEN,
            //                 height: 1.5,
            //               ),
            //             )
            //           ],
            //         ),
            //         softWrap: true,
            //       ),
            //       SizedBox(height: 4),
            //       // Row(
            //       //   mainAxisAlignment: MainAxisAlignment.end,
            //       //   children: [
            //       //     TextButton(
            //       //       onPressed: () {
            //       //         Navigator.push(
            //       //           context,
            //       //           MaterialPageRoute(
            //       //             builder: (_) => TrackProduct(),
            //       //           ),
            //       //         );
            //       //       },
            //       //       child: Text(
            //       //         '  Track Product  ',
            //       //         style: TextStyle(
            //       //           fontSize: values.BUTTON_TEXT - 2,
            //       //           color: colors.TEXT_WHITE,
            //       //           height: 1.25,
            //       //         ),
            //       //       ),
            //       //       style: TextButton.styleFrom(
            //       //         backgroundColor: colors.BUTTON_GREEN,
            //       //         padding: EdgeInsets.zero,
            //       //         visualDensity: VisualDensity.compact,
            //       //         shape: RoundedRectangleBorder(
            //       //           borderRadius: BorderRadius.circular(
            //       //             values.RADIUS / 2,
            //       //           ),
            //       //         ),
            //       //       ),
            //       //     ),
            //       //   ],
            //       // ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
