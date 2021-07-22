import 'package:flutter/material.dart';

TimeOfDay stringTimeToTimeOfDay({required String time}) {
  List<String> d1 = time.split(' ');
  List<String> d2 = d1.first.split(':');
  if (d1.last == 'AM') {
    return TimeOfDay(hour: int.parse(d2.first), minute: int.parse(d2.last));
  } else {
    return TimeOfDay(
      hour: int.parse(d2.first) + 12,
      minute: int.parse(d2.last),
    );
  }
}
