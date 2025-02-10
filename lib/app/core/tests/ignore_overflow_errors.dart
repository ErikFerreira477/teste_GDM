import 'package:flutter/cupertino.dart';

void ignoreOverflowErrors(
  FlutterErrorDetails details, {
  bool forceReport = false,
}) {
  bool ifIsOverflowError = false;
  var exception = details.exception;

  if (exception is FlutterError) {
    ifIsOverflowError = !exception.diagnostics.any(
      (e) => e.value.toString().startsWith("A RenderFlex overflowed by"),
    );
  }

  if (ifIsOverflowError) {
    debugPrint('Overflow error ignored');
  } else {
    FlutterError.dumpErrorToConsole(details, forceReport: forceReport);
  }
}
