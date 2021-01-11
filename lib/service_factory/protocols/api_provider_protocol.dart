import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config.dart';

class ApiProviderProtocol {
  final Dio ntDio = _noTokenDio();
  final Dio tDio = _tokenDio();
  static String getSecureUrl() {
    return ServiceConfig.url;
  }

  static Dio _tokenDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(
        receiveDataWhenStatusError: true,
        followRedirects: false,
        contentType: Headers.jsonContentType,
        validateStatus: (status) {
          return status < 500;
        });
    dio.interceptors.add(getTokenizedWrapper());
    return dio;
  }

  static InterceptorsWrapper getTokenizedWrapper() {
    return InterceptorsWrapper(onRequest: (options) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      options.headers.putIfAbsent(
          "Authorization", () => "Bearer ${prefs.getString("accessToken")}");
//      options.headers.putIfAbsent("Accept", () => "application/json");
//      options.headers
//          .putIfAbsent("Content-Type", () => "application/json; charset=utf-8");

      print("***************************************************");
      print("*** REQUEST FULL URL ${options.baseUrl}${options.uri.path} ***");
      print("*** REQUEST METHOD ${options.method} ***");
      print("*** REQUEST EXTRA ${options.extra} ***");
      print("*** REQUEST DATA ${options.data} ***");
      print("*** REQUEST QUERY PARAMETERS ${options.queryParameters} ***");
      print("*** REQUEST HEADERS ${options.headers} ***");
      print("***************************************************");
      return options;
    }, onResponse: (response) {
      print("***************************************************");
      print("*** RESPONSE DATA ${response.data} ***");
      print("*** RESPONSE CODE ${response.statusCode} ***");
      print("*** RESPONSE MESSAGE ${response.statusMessage} ***");
      print("***************************************************");
    });
  }

  static Dio defaultDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        });
    dio.interceptors.add(getDebugWrapper());
    return dio;
  }

  static InterceptorsWrapper getDebugWrapper() {
    return InterceptorsWrapper(onRequest: (options) async {
      options.headers.putIfAbsent("Accept", () => "application/json");
      options.headers
          .putIfAbsent("Content-Type", () => "application/json; charset=utf-8");

      print("***************************************************");
      print("*** REQUEST FULL URL ${options.baseUrl}${options.uri.path} ***");
      print("*** REQUEST METHOD ${options.method} ***");
      print("*** REQUEST EXTRA ${options.extra} ***");
      print("*** REQUEST DATA ${options.data} ***");
      print("*** REQUEST QUERY PARAMETERS ${options.queryParameters} ***");
      print("*** REQUEST HEADERS ${options.headers} ***");
      print("***************************************************");
      return options;
    }, onResponse: (response) {
      print("***************************************************");
      print("*** RESPONSE DATA ${response.data} ***");
      print("*** RESPONSE CODE ${response.statusCode} ***");
      print("*** RESPONSE MESSAGE ${response.statusMessage} ***");
      print("***************************************************");
    });
  }

  static Dio _noTokenDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(
        receiveDataWhenStatusError: true,
        followRedirects: false,
        contentType: Headers.formUrlEncodedContentType,
        validateStatus: (status) {
          return status < 500;
        });
    dio.interceptors.add(getNoTokenWrapper());
    return dio;
  }

  static InterceptorsWrapper getNoTokenWrapper() {
    return InterceptorsWrapper(onRequest: (options) async {
      options.headers.putIfAbsent("Accept", () => "application/json");
      options.headers
          .putIfAbsent("Access-Control-Allow-Credentials", () => true);

      print("***************************************************");
      print("*** REQUEST FULL URL ${options.baseUrl}${options.uri.path} ***");
      print("*** REQUEST METHOD ${options.method} ***");
      print("*** REQUEST EXTRA ${options.extra} ***");
      print("*** REQUEST DATA ${options.data} ***");
      print("*** REQUEST QUERY PARAMETERS ${options.queryParameters} ***");
      print("*** REQUEST HEADERS ${options.headers} ***");
      print("***************************************************");
      return options;
    }, onResponse: (response) {
      print("***************************************************");
      print("*** RESPONSE DATA ${response.data} ***");
      print("*** RESPONSE CODE ${response.statusCode} ***");
      print("*** RESPONSE MESSAGE ${response.statusMessage} ***");
      print("***************************************************");
    });
  }
}
