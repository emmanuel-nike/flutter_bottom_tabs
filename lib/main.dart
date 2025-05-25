import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bottom_tabs/src/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize shared preferences and some other parameters
  await initialize();

  FlutterError.onError = (FlutterErrorDetails details) =>
      Zone.current.handleUncaughtError(
        details.exception,
        details.stack ?? StackTrace.current,
      );

  runApp(ProviderScope(child: App()));
}
