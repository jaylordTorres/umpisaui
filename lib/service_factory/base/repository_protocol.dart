/// M Model
/// DT data Type
/// A args
abstract class SeRepositoryProtocol<DT, A> {
  Future<DT> execute(A args);
}
