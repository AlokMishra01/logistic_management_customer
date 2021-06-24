import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../constant.dart';
import '../../../widgets/old/Widgets/Map.dart';
import '../../../widgets/old/Widgets/timeline_custom.dart';

class Trackyourproduct extends StatefulWidget {
  @override
  _TrackyourproductState createState() => _TrackyourproductState();
}

class _TrackyourproductState extends State<Trackyourproduct> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            color: Constant.theme_col,
            size: 25,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Track Products",
          style: TextStyle(color: Constant.theme_col, fontSize: 24),
          textAlign: TextAlign.left,
        ),
        titleSpacing: -10,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Track your product",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: 20,
              child: MyMap(),
            ),
            // Positioned(
            //     width: MediaQuery.of(context).size.width,
            //     bottom: -10,
            //     child: DraggableBottomSheet(
            //       blurBackground: true,
            //       scrollDirection: Axis.vertical,
            //       backgroundWidget: Container(
            //         width: MediaQuery.of(context).size.width,
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.only(
            //                 topRight: Radius.circular(10),
            //                 topLeft: Radius.circular(10)),
            //             border: Border.all(color: Colors.black, width: 2)),
            //       ),
            //       previewChild: Container(
            //         width: MediaQuery.of(context).size.width,
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.only(
            //                 topRight: Radius.circular(10),
            //                 topLeft: Radius.circular(10)),
            //             border: Border.all(color: Colors.black, width: 2)),
            //         child: Column(
            //           children: [
            //             Container(
            //               margin: EdgeInsets.only(top: 14),
            //               decoration: BoxDecoration(
            //                 color: Colors.black,
            //                 borderRadius: BorderRadius.circular(10),
            //               ),
            //               width: 154,
            //               height: 6,
            //             ),
            //             Container(
            //               margin: EdgeInsets.only(top: 10),
            //               width: MediaQuery.of(context).size.width,
            //               child: Text(
            //                 "Track Your Product",
            //                 style: TextStyle(
            //                     color: Constant.theme_col,
            //                     fontSize: 14,
            //                     fontWeight: FontWeight.w400),
            //                 textAlign: TextAlign.center,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       expandedChild: Container(
            //           decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.only(
            //                   topRight: Radius.circular(10),
            //                   topLeft: Radius.circular(10)),
            //               border: Border.all(
            //                   color: Colors.black,
            //                   width: 1.5,
            //                   style: BorderStyle.solid)),
            //           width: MediaQuery.of(context).size.width,
            //           height: 150,
            //           child: Flex(
            //             direction: Axis.vertical,
            //             children: [
            //               Container(
            //                 margin: EdgeInsets.only(top: 14),
            //                 decoration: BoxDecoration(
            //                   color: Colors.black,
            //                   borderRadius: BorderRadius.circular(10),
            //                 ),
            //                 width: 154,
            //                 height: 6,
            //               ),
            //               Container(
            //                 margin: EdgeInsets.only(top: 10),
            //                 width: MediaQuery.of(context).size.width,
            //                 child: Text(
            //                   "Product Code: XXXX",
            //                   style: TextStyle(
            //                       color: Constant.theme_col,
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.w400),
            //                   textAlign: TextAlign.center,
            //                 ),
            //               ),
            //               Container(
            //                 margin: EdgeInsets.only(top: 10),
            //                 width: MediaQuery.of(context).size.width,
            //                 child: Text(
            //                   "Delivery Status:Pending",
            //                   style: TextStyle(
            //                       fontSize: 14, fontWeight: FontWeight.w400),
            //                   textAlign: TextAlign.center,
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 10,
            //               ),
            //               CustomTimeLine(
            //                 title: "Received in collection zone",
            //                 iscomplete: true,
            //               ),
            //               CustomTimeLine(
            //                 title: "Warehouse in Kathmandu",
            //                 iscomplete: true,
            //               ),
            //               CustomTimeLine(
            //                 title: "Delivery Agent (On the way)",
            //                 iscomplete: false,
            //               ),
            //               CustomTimeLine(
            //                 title: "Delivered",
            //                 iscomplete: false,
            //               ),
            //             ],
            //           )),
            //       minExtent: 100,
            //       maxExtent: MediaQuery.of(context).size.height * 0.5,
            //     ))
          ],
        ),
      ),
    );
  }
}
