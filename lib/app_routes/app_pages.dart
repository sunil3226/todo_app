import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_app/app_routes/app_roues.dart';
import 'package:todo_app/binding/home_binding.dart';
import 'package:todo_app/view/add_task.dart';
import 'package:todo_app/view/home_screen.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding()),
    GetPage(name: Routes.ADDTask, page: () => AddTask()),
  ];
}
