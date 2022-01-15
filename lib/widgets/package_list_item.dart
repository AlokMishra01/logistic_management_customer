import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiffy/jiffy.dart';
import 'package:logistic_management_customer/models/package_response_model.dart';
import 'package:logistic_management_customer/utils/get_status_color.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;

class PackageListItem extends StatelessWidget {
  final PackageModel p;

  const PackageListItem({
    Key? key,
    required this.p,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: geStatusColor(
            status: p.status ?? '',
          ).withOpacity(0.1),
          borderRadius: BorderRadius.circular(
            values.RADIUS,
          ),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(
            horizontal: values.BASE_PADDING,
          ),
          trailing: Container(
            padding: const EdgeInsets.all(
              values.BASE_PADDING,
            ),
            decoration: BoxDecoration(
              color: geStatusColor(status: p.status ?? ''),
              borderRadius: BorderRadius.circular(
                values.RADIUS,
              ),
            ),
            child: Text(
              p.status ?? '',
              style: const TextStyle(
                fontSize: values.TITLE_TEXT,
                color: colors.TEXT_WHITE,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                p.packageCode ?? '',
                style: const TextStyle(
                  fontSize: values.TITLE_TEXT,
                  color: colors.TEXT_BLACK,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 4.0),
              SizedBox(
                height: 24.0,
                width: 24.0,
                child: IconButton(
                  onPressed: () {
                    Clipboard.setData(
                      ClipboardData(text: p.packageCode ?? ''),
                    );
                  },
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.copy_rounded,
                    color: colors.BUTTON_GREEN,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(values.BASE_PADDING),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: IconButton(
                                onPressed: () {},
                                visualDensity: VisualDensity.compact,
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.view_in_ar,
                                  color: colors.BUTTON_BLUE,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              p.packageType ?? '',
                              style: const TextStyle(
                                fontSize: values.TITLE_TEXT,
                                color: colors.TEXT_SECONDARY,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: IconButton(
                                onPressed: () {},
                                visualDensity: VisualDensity.compact,
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  CupertinoIcons.rectangle_expand_vertical,
                                  color: colors.BUTTON_BLUE,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '${(p.packageSize ?? 0) / 1000}\u33A4',
                              style: const TextStyle(
                                fontSize: values.TITLE_TEXT,
                                color: colors.TEXT_SECONDARY,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: IconButton(
                                onPressed: () {},
                                visualDensity: VisualDensity.compact,
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  CupertinoIcons.square_fill_on_square_fill,
                                  color: colors.BUTTON_BLUE,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '${p.packageWeight}gm',
                              style: const TextStyle(
                                fontSize: values.TITLE_TEXT,
                                color: colors.TEXT_SECONDARY,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: values.BASE_PADDING / 2),
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: IconButton(
                                onPressed: () {},
                                visualDensity: VisualDensity.compact,
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.ac_unit_rounded,
                                  color: colors.BUTTON_BLUE,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              (p.fragile ?? false) ? 'Fragile' : 'In Frangible',
                              style: const TextStyle(
                                fontSize: values.TITLE_TEXT,
                                color: colors.TEXT_SECONDARY,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: IconButton(
                                onPressed: () {},
                                visualDensity: VisualDensity.compact,
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  CupertinoIcons.airplane,
                                  color: colors.BUTTON_BLUE,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              (p.express ?? false) ? 'Express' : 'Normal',
                              style: const TextStyle(
                                fontSize: values.TITLE_TEXT,
                                color: colors.TEXT_SECONDARY,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 24.0,
                              width: 24.0,
                              child: IconButton(
                                onPressed: () {},
                                visualDensity: VisualDensity.compact,
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  CupertinoIcons.money_dollar,
                                  color: colors.BUTTON_BLUE,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '${p.packagePrice ?? 0.0}',
                              style: const TextStyle(
                                fontSize: values.TITLE_TEXT,
                                color: colors.TEXT_SECONDARY,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: values.BASE_PADDING),

                  /// From
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'From',
                        style: TextStyle(
                          fontSize: values.TITLE_TEXT,
                          color: colors.TEXT_BLACK,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: IconButton(
                              onPressed: () {},
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.access_time_rounded,
                                color: colors.BUTTON_BLUE,
                                size: 24.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            Jiffy(p.pickupTime, 'hh:mm:ss').jm,
                            style: const TextStyle(
                              fontSize: values.TITLE_TEXT,
                              color: colors.TEXT_SECONDARY,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    color: colors.TEXT_WHITE,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: IconButton(
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.person_outline_rounded,
                            color: colors.BUTTON_BLUE,
                            size: 24.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        p.senderName ?? '',
                        style: const TextStyle(
                          fontSize: values.TITLE_TEXT,
                          color: colors.TEXT_SECONDARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: IconButton(
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.location_on_rounded,
                            color: colors.BUTTON_BLUE,
                            size: 24.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        p.senderAddress ?? '',
                        style: const TextStyle(
                          fontSize: values.TITLE_TEXT,
                          color: colors.TEXT_SECONDARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: IconButton(
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.phone_rounded,
                            color: colors.BUTTON_BLUE,
                            size: 24.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '${p.senderMobileno ?? ' '}',
                        style: const TextStyle(
                          fontSize: values.TITLE_TEXT,
                          color: colors.TEXT_SECONDARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: values.BASE_PADDING),

                  /// tO
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'To',
                        style: TextStyle(
                          fontSize: values.TITLE_TEXT,
                          color: colors.TEXT_BLACK,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: IconButton(
                              onPressed: () {},
                              visualDensity: VisualDensity.compact,
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.access_time_rounded,
                                color: colors.BUTTON_BLUE,
                                size: 24.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            Jiffy(p.dropoffTime, 'hh:mm:ss').jm,
                            style: const TextStyle(
                              fontSize: values.TITLE_TEXT,
                              color: colors.TEXT_SECONDARY,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    color: colors.TEXT_WHITE,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: IconButton(
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.person_outline_rounded,
                            color: colors.BUTTON_BLUE,
                            size: 24.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        p.recieverName ?? '',
                        style: const TextStyle(
                          fontSize: values.TITLE_TEXT,
                          color: colors.TEXT_SECONDARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: IconButton(
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.location_on_rounded,
                            color: colors.BUTTON_BLUE,
                            size: 24.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        p.recieverAddress ?? '',
                        style: const TextStyle(
                          fontSize: values.TITLE_TEXT,
                          color: colors.TEXT_SECONDARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child: IconButton(
                          onPressed: () {},
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            Icons.phone_rounded,
                            color: colors.BUTTON_BLUE,
                            size: 24.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        '${p.recieverMobileno ?? ' '}',
                        style: const TextStyle(
                          fontSize: values.TITLE_TEXT,
                          color: colors.TEXT_SECONDARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
