import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    loadTask();
  }

  RxList<Map<String, String>> tasks = <Map<String, String>>[].obs;

  addTasks(String title, String content) {
    tasks.add({"title": title.trim(), "content": content.trim()});
    saveTasks(tasks);
  }

  Future<void> saveTasks(List<Map<String, String>> tasks) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String jsonTasks = jsonEncode(tasks);
    await pref.setString("taskaData", jsonTasks);
  }

  Future loadTask() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? jsonTasks = pref.getString("taskaData");
    if (jsonTasks != null) {
      List<dynamic> decodedList = jsonDecode(jsonTasks);

      Iterable<Map<String, String>> loadedTasks = decodedList.map(
        (item) => Map<String, String>.from(item),
      );
      tasks.addAll(loadedTasks);
    }
  }

  deleteTask(index) {
    tasks.removeAt(index);
    saveTasks(tasks);
  }

  editTasks(int index, String newTitle, String newContent) {
    tasks[index] = {"title": newTitle, "content": newContent};
    saveTasks(tasks);
  }
}
