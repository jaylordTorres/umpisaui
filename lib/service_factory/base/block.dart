import 'dependency.dart';
import 'event.dart';
import 'repository_protocol.dart';
import 'state.dart';

/// R for Repo
/// A for args
/// E for events
/// S for state
/// DT data type

class SeBloc<DT, A> extends Bloc<SeExecute<A>, SeState> {
  SeRepositoryProtocol repo;

  SeBloc({@required this.repo}) : assert(repo != null);

  @override
  SeState get initialState => SeInitialized();

  @override
  Stream<SeState> mapEventToState(SeExecute<A> event) async* {
    final currentState = state;
    if (event is SeExecute<A>) {
      yield* _execute(currentState, event);
    }
  }

  Stream<SeState> _execute(SeState currentState, SeExecute<A> event) async* {
    yield SeInProgress();
    try {
      final response = await repo.execute(event.args);

      // todo: need to validate if response data is valid for body
      yield SeLoaded<DT>(response);
    } catch (error, _) {
      print(error.toString());
      yield SeFailed(error.toString());
    }
  }
}
