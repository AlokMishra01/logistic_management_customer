import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

Future<String?> customTimePicker({
  required BuildContext context,
  required TimeOfDay time,
}) async {
  TimeOfDay? d = await showTimePicker(
    context: context,
    initialTime: time,
  );
  if (d == null) {
    return null;
  }
  return Jiffy(DateTime(0, 1, 1, d.hour, d.minute)).format("h:mm a");
}
