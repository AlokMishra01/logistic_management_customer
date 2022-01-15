import 'package:flutter/material.dart';
import 'package:logistic_management_customer/controllers/package_controller.dart';
import 'package:logistic_management_customer/widgets/package_list_item.dart';
import 'package:provider/src/provider.dart';

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
          ],
        ),
      ),
    );
  }
}
