class TaskEndpoints {
  static const String get = "/tasks";
  static const String create = "/tasks/create";
  static String update(String uuid) => "/tasks/update/$uuid";
  static String findById(String uuid) => "/tasks/$uuid";
  static String delete(String uuid) => "/tasks/$uuid";
}
