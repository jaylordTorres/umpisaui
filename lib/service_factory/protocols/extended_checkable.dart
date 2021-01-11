import 'status_codeable.dart';
import 'Fallable.dart';
import 'networkable_error.dart';

abstract class Checkable implements Fallable, Completable, NetworkableError {}

class ExtendedCheckable extends Checkable {
  int _statusCode;
  bool _success;
  String _error;

  String _message;

  ExtendedCheckable({bool success, String error}) {
    this._success = success;
    this._error = error;
  }

  someMethod(Map<String, dynamic> json) {}

  withJson(Map<String, dynamic> json) {
    print("CHECKABLE ${json}");
    _success = json['success'];
    _statusCode = json['statusCode'];
    _error = json['error'];
    _message = json['message'];
  }

  ExtendedCheckable.withDummy({bool success}) : _success = success;

  withError({String error}) {
    _error = error;
    _success = false;
  }

  @override
  String getError() {
    return _error;
  }

  @override
  String getMessage() {
    return _message;
  }

  @override
  bool isSuccess() {
    print("STATUS CODE $_statusCode");
    if (_statusCode == null) {
      return true;
    }
    if (_statusCode - 200 < 100) {
      return true;
    } else {
      return false;
    }
  }

  @override
  setSuccess(bool val) {
    // TODO: implement setSuccess
    throw UnimplementedError();
  }
}
