import 'package:flutter/material.dart';
import 'package:logistic_management_customer/widgets/request_item.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(
              title: 'My Requests',
              backButton: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
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
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: 5,
                  separatorBuilder: (_, i) => SizedBox(
                    height: values.BASE_PADDING / 2,
                  ),
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: i == 4 ? 120 : 0),
                      child: RequestItem(
                        approved: _selected == 1,
                      ),
                    );
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
