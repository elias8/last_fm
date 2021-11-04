import 'dart:developer';

import 'package:bloc/bloc.dart';

/// Sets a global bloc observer for logging bloc behaviour.
void setBlocObserver() => Bloc.observer = _AppBlocObserver();

class _AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
