import '../base/base.dart';
import 'data.dart';
import 'model.dart';
import 'variable.dart';

class SampleRequestArgs extends SRequestArgs {
  SampleRequestArgs(this.id);
  final id;
  @override
  String toString() {
    return "id is :" + id;
  }
}

class SampleBloc extends SeBloc<SampleViewModel, SampleRequestArgs> {
  SampleBloc({SeRepositoryProtocol<SampleViewModel, SampleRequestArgs> repo})
      : super(repo: repo);
}

// network repo
final createNetworRepoSample = () =>
    SeRepositoryNetwork<SampleViewModel, SeGetResponse, SampleRequestArgs>(
      toModel: (response) {
        return SampleViewModel.create(response);
      },
      apiProvider: SeNetworkApiProvider<SeGetResponse, SampleRequestArgs>(
        requestHandeler: (args, apiService) async {
          return await apiService
              .get("${ApiProviderProtocol.getSecureUrl()}$exampleUrl");
        },
        fromResponseData: (data) {
          return SeGetResponse.fromJson(data);
        },
        withError: (error) {
          print(error);
          return SeGetResponse.withError(error);
        },
      ),
    );

// local repo
final createLocalRepoSample =
    () => SeRepositoryLocal<SampleViewModel, SeGetResponse, SampleRequestArgs>(
          data: SeGetResponse.fromJson(exampleItemData),
          toModel: (response) {
            return SampleViewModel.create(response);
          },
        );
