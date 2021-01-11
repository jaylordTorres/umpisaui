import 'dependency.dart';

abstract class SeState extends Equatable {
  const SeState();

  @override
  List<Object> get props => [];
}

class SeInitialized extends SeState {}

class SeInProgress extends SeState {}

/// T for model
class SeLoaded<T> extends SeState {
  final T data;

  const SeLoaded(this.data);

  @override
  List<Object> get props => [this.data];
}

class SeFailed extends SeState {
  final String error;

  const SeFailed([this.error]);

  @override
  List<Object> get props => [this.error];
}
