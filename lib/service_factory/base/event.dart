import 'package:equatable/equatable.dart';

// import 'request_arg.dart';

abstract class SeEvent<A> extends Equatable {
  final A args;
  const SeEvent([this.args]);

  @override
  List<Object> get props => [];
}

/// A for args
class SeExecute<A> extends SeEvent {
  final A args;
  const SeExecute([this.args]);

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "SeExecute witdh args: $args";
  }
}
