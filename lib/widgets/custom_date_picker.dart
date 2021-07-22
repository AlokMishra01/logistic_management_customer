import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

Future<String?> customDatePicker({
  required BuildContext context,
  required DateTime date,
}) async {
  DateTime? d = await showDatePicker(
    context: context,
    initialDate: date,
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
  );
  if (d == null) {
    return null;
  }
  return Jiffy(d).format("yyyy-MM-d");
}
