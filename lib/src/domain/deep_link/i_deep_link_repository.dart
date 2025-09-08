abstract class IDeepLinkRepository {
  Stream<Uri> getLinks();
  Future<Uri?> getInitialLink();
}
