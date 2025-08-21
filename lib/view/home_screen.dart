import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app_routes/app_roues.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1EBEB),
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              elevation: 8,
              shadowColor: Colors.grey,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListTile(
                leading: Text(
                  "${index + 1}",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                title: Text(
                  "${controller.tasks[index]["title"]}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                subtitle: Text(
                  "${controller.tasks[index]["content"]}",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Container(
                  width: 56,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.ADDTask,
                            arguments: {
                              "index": index,
                              "title": controller.tasks[index]["title"],
                              "content": controller.tasks[index]["content"],
                            },
                          );
                        },
                        child: Icon(Icons.edit, color: Colors.blue),
                      ),
                      SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          controller.deleteTask(index);
                        },
                        child: Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Get.toNamed(Routes.ADDTask);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
