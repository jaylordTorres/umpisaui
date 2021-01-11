import 'dependency.dart';
import 'package:dio/dio.dart';

/// R for response
/// A for arg
class SeNetworkApiProvider<R, A> extends ApiProviderProtocol {
  final Future<Response> Function(A, Dio) requestHandeler;
  final R Function(dynamic) fromResponseData;
  final R Function(String) withError;

  SeNetworkApiProvider(
      {@required this.requestHandeler,
      @required this.fromResponseData,
      @required this.withError});
  Future<R> execute(A args) async {
    try {
      // dio paras
      Response response = await requestHandeler(args, tDio);
      return fromResponseData(response.data);
    } catch (error, stacktrace) {
      print('Exception occured : $error stacktrace : $stacktrace');
      return withError("$error");
    }
  }
}
