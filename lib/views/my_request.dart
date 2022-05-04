import 'package:flutter/material.dart';
import 'package:logistic_management_customer/controllers/package_controller.dart';
import 'package:logistic_management_customer/widgets/package_list_item.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/header.dart';

class MyRequest extends StatefulWidget {
  const MyRequest({Key? key}) : super(key: key);

  @override
  _MyRequestState createState() => _MyRequestState();
}

class _MyRequestState extends State<MyRequest> {
  // int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final packages = context.watch<PackageController>();
    final listItems = packages.packageAll;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              title: 'History',
              backButton: true,
            ),
            if (listItems.isNotEmpty)
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => packages.getPackageList(),
                  child: ListView.separated(
                    padding: const EdgeInsets.only(
                      right: values.BASE_PADDING,
                      left: values.BASE_PADDING,
                      bottom: 80.0,
                    ),
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listItems.length,
                    // itemCount: 2,
                    itemBuilder: (_, i) {
                      final p = listItems[i];
                      return PackageListItem(p: p);
                    },
                    separatorBuilder: (_, i) {
                      return const SizedBox(height: values.BASE_PADDING / 2);
                    },
                  ),
                ),
              ),
            if (listItems.isEmpty)
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(values.BASE_PADDING * 2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'No request right now.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colors.TEXT_SECONDARY,
                            fontSize: values.SUB_HEADER_TEXT,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () => packages.getPackageList(),
                          icon: const Icon(Icons.refresh_rounded),
                        ),
                      ],
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
