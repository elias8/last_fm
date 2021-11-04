// ignore_for_file: do_not_use_environment
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @Named('ApiKey')
  String get apiKey => const String.fromEnvironment('API_KEY');

  @Named('BaseUrl')
  String get baseHttpUrl => 'https://ws.audioscrobbler.com/2.0/';

  @lazySingleton
  PrettyDioLogger get prettyLogger {
    return PrettyDioLogger(requestHeader: true, requestBody: true);
  }

  @lazySingleton
  Dio dio(BaseOptions baseOptions, PrettyDioLogger logger) {
    final interceptors = <Interceptor>[if (kDebugMode) logger];
    return Dio(baseOptions)..interceptors.addAll(interceptors);
  }

  @lazySingleton
  BaseOptions dioBaseOptions(
    @Named('BaseUrl') String url,
    @Named('ApiKey') String apiKey,
  ) {
    return BaseOptions(
      baseUrl: url,
      connectTimeout: 30000,
      queryParameters: {'format': 'json', 'api_key': apiKey},
    );
  }
}
