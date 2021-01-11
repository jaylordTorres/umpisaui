class ResponseException implements Exception {
  final dynamic message;

  ResponseException([this.message]);

  String toString() {
    Object message = this.message;
    if (message == null) return "Exception";
    return "$message";
  }
}
