import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/data/models/todo.dart';
import 'package:todoapp/data/services/storage/repository.dart';
import 'package:todoapp/modules/home/controller.dart';

class DetailItemController extends GetxController {
  final HomeRepository _homeRepository = HomeRepository();
  final HomeController homeController = Get.find();

  navigateToBackHome() {
    Get.back();
  }

  void showDeleteConfirmationDialog(String id) {
    Get.defaultDialog(
      title: 'Delete Item',
      middleText: 'Are you sure you want to delete this item?',
      textCancel: 'Cancel',
      textConfirm: 'Delete',
      confirmTextColor: Colors.white,
      onConfirm: () {
        deleteItem(id);
      },
    );
  }

  Future<void> deleteItem(String id) async {
    try {
      await _homeRepository.deleteItem(id);
      homeController.items.removeWhere((item) => item.id == id);
      Get.back(); // Close the dialog
      Get.back(); // Navigate back to home
    } catch (e) {
      print('Error deleting item: $e');
      Get.snackbar('Error', 'Could not delete the item.');
    }
  }

  Future<void> updateItem(Todo todo) async {
    try {
      await _homeRepository.updateItem(todo);
      int index = homeController.items.indexWhere((item) => item.id == todo.id);
      if (index != -1) {
        homeController.items[index] = todo;
      }
      Get.back(); // Navigate back to home
    } catch (e) {
      print('Error updating item: $e');
      Get.snackbar('Error', 'Could not update the item.');
    }
  }
}
