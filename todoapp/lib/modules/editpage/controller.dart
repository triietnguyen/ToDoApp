import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/data/models/todo.dart';
import 'package:todoapp/data/services/storage/repository.dart';
import 'package:todoapp/modules/home/controller.dart';

class EditItemController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();
  final HomeController homeController = Get.find();
  late Todo item;

  EditItemController() {
    item = Get.arguments as Todo;
  }

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final importantController = TextEditingController();
  final timeController = TextEditingController();
  Map<String, dynamic> additionalFields = {};

  @override
  void onInit() {
    super.onInit();
    titleController.text = item.title!;
    descriptionController.text = item.description!;
    importantController.text = item.important?.toString() ?? '';
    timeController.text = item.time?.toLocal().toString() ?? '';
    additionalFields = Map<String, dynamic>.from(item.additionalFields!);
  }

  Future<void> updateItem() async {
    try {
      final updatedItem = Todo(
        id: item.id,
        title: titleController.text,
        description: descriptionController.text,
        important: importantController.text.isNotEmpty
            ? bool.parse(importantController.text)
            : null,
        time: timeController.text.isNotEmpty
            ? DateTime.parse(timeController.text)
            : null,
        additionalFields: additionalFields,
      );
      await _homeRepository.updateItem(updatedItem);
      int index =
          homeController.items.indexWhere((item) => item.id == updatedItem.id);
      if (index != -1) {
        homeController.items[index] = updatedItem;
      }
      Get.back(); // Close dialog
      Get.back(); // Navigate back to detailpage
      Get.back(); // Navigate back to home
    } catch (e) {
      print('Error updating item: $e');
      Get.snackbar('Error', 'Could not update the item.');
    }
  }

  void showEditConfirmationDialog() {
    Get.defaultDialog(
      title: 'Save Changes',
      middleText: 'Are you sure you want to save the changes?',
      textCancel: 'Cancel',
      textConfirm: 'Save',
      confirmTextColor: Colors.white,
      onConfirm: () {
        updateItem();
      },
    );
  }
}
