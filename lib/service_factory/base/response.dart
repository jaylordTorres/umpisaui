import 'dependency.dart';

abstract class SeResponse extends ExtendedCheckable {}

class SeListResponse extends SeResponse {
  dynamic data;
  SeListResponse({this.data});

  SeListResponse.withError(String errorValue) {
    this.withError(error: errorValue);
  }
}

class SeGetResponse extends SeResponse {
  dynamic data;
  SeGetResponse({this.data});

  SeGetResponse.fromJson(dynamic responseBody) {
    // todo: validate if has errror or .data;
    // print('from SeGetResponse.fromJson');
    data = responseBody['data'];
  }

  SeGetResponse.withError(String errorValue) {
    this.withError(error: errorValue);
  }
}

/// will process list response
class SeGetListResponse extends SeResponse {
  dynamic data;
  SeGetListResponse({this.data});

  SeGetListResponse.fromJson(dynamic responseBody) {
    data = responseBody['data'];
  }

  SeGetListResponse.withError(String errorValue) {
    this.withError(error: errorValue);
  }
}
