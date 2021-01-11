import 'repository_protocol.dart';

/// DT model
/// R args
/// A api model
class SeRepositoryLocal<DT, R, A> implements SeRepositoryProtocol<DT, A> {
  final dynamic data;
  final DT Function(R) toModel;

  SeRepositoryLocal({this.data, this.toModel});

  @override
  Future<DT> execute(A args) async {
    DT temp = toModel(data);
    return temp;
  }
}
