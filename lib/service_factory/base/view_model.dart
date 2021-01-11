import 'dependency.dart';

/// K for key data type
class SViewModel<K> extends Equatable {
  final K key;
  SViewModel({this.key});
  SViewModel.setKey(this.key);
  //
  static create(response) {}

  @override
  List<Object> get props => [key];

  // fromApiModel(fromJson) {}
}
