import 'package:flutter/material.dart';

import '../constants/colors.dart' as colors;

Color geStatusColor({required String status}) {
  // All / Not Received / In Transit / Picked Up / At Watehouse / Dispatched / Completed / Pending / Approved
  switch (status) {
    case 'Not Received':
      return Colors.red;
    case 'In Transit':
      return Colors.pink;
    case 'Picked Up':
      return Colors.deepPurple;
    case 'At Watehouse':
      return Colors.purple;
    case 'Dispatched':
      return Colors.deepOrange;
    case 'Completed':
      return Colors.green;
    case 'Pending':
      return Colors.amber;
    case 'Approved':
      return Colors.blueAccent;
    default:
      return colors.TEXT_WHITE;
  }
}
