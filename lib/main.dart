import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'application/application.dart';
import 'config/config.dart';

Future<void> main() async {
  setBlocObserver();
  await Hive.initFlutter();
  await registerDependencies();
  AppRouter.setUrlPathStrategy();
  runApp(const Application());
}
