import 'package:flutter/material.dart';
import 'package:logistic_management_customer/controllers/package_controller.dart';
import 'package:logistic_management_customer/widgets/package_list_item.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart' as colors;
import '../constants/values.dart' as values;
import '../widgets/header.dart';
import '../widgets/type_bar.dart';

class MyRequest extends StatefulWidget {
  const MyRequest({Key? key}) : super(key: key);

  @override
  _MyRequestState createState() => _MyRequestState();
}

class _MyRequestState extends State<MyRequest> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final packages = context.watch<PackageController>();
    final packageListPending = packages.packageAll.where((e) {
      return (e.status == 'Pending');
    }).toList();
    final packageListApproved = packages.packageAll.where((e) {
      return (e.status == 'Approved');
    }).toList();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              title: 'My Requests',
              backButton: true,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: values.BASE_PADDING,
              ),
              child: Text(
                'You can see the list of pending and approved '
                'request for deliver or pickups.',
                style: TextStyle(
                  fontSize: values.TITLE_TEXT,
                  color: colors.TEXT_SECONDARY,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(values.BASE_PADDING),
              child: Container(
                height: 48.0,
                decoration: BoxDecoration(
                  color: colors.FIELD_BACKGROUND,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    TypeBar(
                      title: "Pending",
                      selected: _selected == 0,
                      onTab: () {
                        _selected = 0;
                        setState(() {});
                      },
                    ),
                    TypeBar(
                      title: "Approved",
                      selected: _selected == 1,
                      onTab: () {
                        _selected = 1;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: values.BASE_PADDING,
                ),
                child: RefreshIndicator(
                  onRefresh: () => packages.getPackageList(),
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: _selected == 0
                        ? packageListPending.length
                        : packageListApproved.length,
                    itemBuilder: (_, i) {
                      if (_selected == 0) {
                        final p = packageListPending[i];
                        return PackageListItem(p: p);
                      }
                      final p = packageListApproved[i];
                      return PackageListItem(p: p);
                    },
                    separatorBuilder: (_, i) {
                      return const SizedBox(height: values.BASE_PADDING / 2);
                    },
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
