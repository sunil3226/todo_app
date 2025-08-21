import 'package:flutter/material.dart';
import 'package:todo_app/controller/home_controller.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _titleController = TextEditingController();
    var _contentController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    final args = Get.arguments;
    final int? index = args?["index"];
    final title = args?["title"]?? "";
    final content = args?["content"]?? "";

    if (index != null){
      _titleController.text = title;
      _contentController.text = content;
    }

    HomeController controller = Get.find<HomeController>();

    return Scaffold(
      backgroundColor: Color(0xFFF1EBEB),
      appBar: AppBar(
        title: Text(index == null ? "Add Task Screen" : "Update Task Screen"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16, left: 32, right: 32),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Title is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Title"),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Content is required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Content"),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (index == null) {
                        controller.addTasks(
                          _titleController.text,
                          _contentController.text,
                        );
                      } else {
                        controller.editTasks(
                          index,
                          _titleController.text,
                          _contentController.text,
                        );
                      }
                      Get.back();
                    }
                  },
                  child: Text(index == null ? "Add" : "Update", style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
