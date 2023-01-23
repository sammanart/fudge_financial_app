import 'package:dio/dio.dart';
import 'package:fudge_financial_app/src/config/env.dart';
import 'package:fudge_financial_app/src/core/injector/injector.dart';

///DioClient for requests
class DioClient {
  ///Creating  dio client instance
  final Dio dio = Dio();

  ///Set baseUrl option
  void _setBaseOption() {
    final baseUrl = injector<AppEnvironment>().apiHttpUrl;
    dio.options = BaseOptions(baseUrl: baseUrl);
  }

  DioClient() {
    _setBaseOption();
  }
}
