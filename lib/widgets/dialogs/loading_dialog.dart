import 'dart:async';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

showLoadingDialog({
  required BuildContext context,
  required Completer completer,
}) {
  context.showBlockDialog(
    dismissCompleter: completer,
  );
}
