import 'package:flutter/material.dart';
import 'package:logistic_management_customer/controllers/package_controller.dart';
import 'package:logistic_management_customer/widgets/package_list_item.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/header.dart';

class AllPackages extends StatelessWidget {
  const AllPackages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final packages = context.watch<PackageController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              backButton: true,
              title: 'Packages',
            ),
            if (packages.packageAll.isNotEmpty)
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => packages.getPackageList(),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: values.BASE_PADDING,
                    ),
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: packages.packageAll.length,
                    // itemCount: 2,
                    itemBuilder: (_, i) {
                      final p = packages.packageAll[i];
                      return PackageListItem(p: p);
                    },
                    separatorBuilder: (_, i) {
                      return const SizedBox(height: values.BASE_PADDING / 2);
                    },
                  ),
                ),
              ),
            if (packages.packageAll.isEmpty)
              const Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(values.BASE_PADDING * 2),
                    child: Text(
                      'No packages right now.',
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
