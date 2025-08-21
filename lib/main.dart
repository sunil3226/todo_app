import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_app/app_routes/app_pages.dart';
import 'package:todo_app/app_routes/app_roues.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: AppPages.pages,
    );
  }
}