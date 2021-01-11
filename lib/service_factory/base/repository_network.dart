import 'dependency.dart';

import 'repository_network_api_provider.dart';
import 'repository_protocol.dart';

/// DT data type
/// R for response
/// A args
class SeRepositoryNetwork<DT, R, A> extends SeRepositoryProtocol<DT, A> {
  final SeNetworkApiProvider<R, A> apiProvider;
  final DT Function(R) toModel;
  SeRepositoryNetwork({@required this.apiProvider, @required this.toModel});

  @override
  Future<DT> execute(A args) async {
    var result = await apiProvider.execute(args);
    return toModel(result);
  }
}
