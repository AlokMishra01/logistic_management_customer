import 'package:flutter/material.dart';
import 'package:logistic_management_customer/controllers/package_controller.dart';
import 'package:logistic_management_customer/widgets/package_list_item.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../models/package_response_model.dart';
import '../widgets/header.dart';

class AllPackages extends StatelessWidget {
  final String status;

  const AllPackages({
    Key? key,
    this.status = 'All',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final packages = context.watch<PackageController>();
    List<PackageModel> listItems = [];
    if (status == 'Active') {
      listItems = packages.packageActive;
    } else {
      listItems = packages.packageAll;
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(
              backButton: true,
              title: '$status Packages',
            ),
            if (listItems.isNotEmpty)
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => packages.getPackageList(status: status),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: values.BASE_PADDING,
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
                          'No packages right now.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: colors.TEXT_SECONDARY,
                            fontSize: values.SUB_HEADER_TEXT,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () =>
                              packages.getPackageList(status: status),
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
