import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'application/application.dart';
import 'config/config.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await registerDependencies();
  AppRouter.setUrlPathStrategy();
  BlocOverrides.runZoned(
    () => runApp(const Application()),
    blocObserver: AppBlocObserver(),
  );
}
