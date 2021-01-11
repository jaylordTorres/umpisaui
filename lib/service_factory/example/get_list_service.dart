import '../base/base.dart';
import 'data.dart';
import 'model.dart';
import 'variable.dart';

class SampleListRequestArgs extends SRequestArgs {
  SampleListRequestArgs(this.id);
  final id;
  @override
  String toString() {
    return "id is :" + id;
  }
}

class SampleListBloc
    extends SeBloc<List<SampleViewModel>, SampleListRequestArgs> {
  SampleListBloc(
      {SeRepositoryProtocol<List<SampleViewModel>, SampleListRequestArgs> repo})
      : super(repo: repo);
}

// network repo
final createNetworRepoSample = () => SeRepositoryNetwork<List<SampleViewModel>,
        SeGetListResponse, SampleListRequestArgs>(
      toModel: (response) {
        return SampleViewModel.fromListResponseData(response);
      },
      apiProvider:
          SeNetworkApiProvider<SeGetListResponse, SampleListRequestArgs>(
        requestHandeler: (args, apiService) => apiService
            .get("${ApiProviderProtocol.getSecureUrl()}$exampleUrl/${args.id}"),
        fromResponseData: (data) {
          return SeGetListResponse.fromJson(data);
        },
        withError: (error) {
          print(error);
          return SeGetListResponse.withError(error);
        },
      ),
    );

// local repo
final createLocalListRepoSample = () => SeRepositoryLocal<List<SampleViewModel>,
        SeGetListResponse, SampleListRequestArgs>(
      data: SeGetListResponse.fromJson(exampleListData),
      toModel: (response) {
        return SampleViewModel.fromListResponseData(response);
      },
    );
