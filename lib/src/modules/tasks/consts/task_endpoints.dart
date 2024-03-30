class TaskEndpoints {
  static const String get = "/tasks";
  static const String create = "$get/create";
  static String update(String uuid) => "$get/update/$uuid";
  static String findById(String uuid) => "$get/$uuid";
  static String delete(String uuid) => "$get/delete/$uuid";
}
