import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/data/models/todo.dart';
import 'package:todoapp/data/services/storage/repository.dart';
import 'package:todoapp/modules/home/controller.dart';

class AddItemController extends GetxController {
  final TextEditingController textController = TextEditingController();
  RxList<String> textformfield = <String>[].obs;
  final HomeRepository _homeRepository = HomeRepository();
  RxBool isOkButtonEnabled = false.obs;
  Todo todo = Todo();
  HomeController controller = Get.find();

  @override
  void onInit() {
    super.onInit();
    todo.additionalFields = {}; // Initialize additional fields
  }

  void clickButtonOk() {
    textformfield.add(textController.text);
    textController.clear(); // Clear the text field after adding
  }

  void removeLastItem() {
    if (textformfield.isNotEmpty) {
      textformfield.removeLast();
    }
  }

  void navigateToBack() {
    Get.back();
  }

  Future<void> clickButtonSave() async {
    try {
      var newTodo = await _homeRepository.createItem(todo);
      controller.items.add(newTodo);
      Get.back();
    } catch (e) {
      print('Error creating todo: $e');
      // Handle error appropriately, e.g., show a message to the user
    }
  }
}
