abstract class AppStorage {
  Future<void> write({required String key, required dynamic value});
  Future<dynamic> read({required String key});
  Future<void> delete({required String key});
}
