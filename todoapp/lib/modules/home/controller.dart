import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/data/models/todo.dart';
import 'package:todoapp/data/services/storage/repository.dart';
import 'package:todoapp/widgets/enum.dart';

class HomeController extends GetxController {
  RxList<Todo> items = <Todo>[].obs;
  RxList<Todo> allItems = <Todo>[].obs; // To store all items for searching
  final HomeRepository _homeRepository = HomeRepository();
  Rx<StateApi> itemStatus = StateApi.loading.obs;

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    getAllItems();
    searchController.addListener(() {
      filterItems(searchController.text);
    });
    super.onInit();
  }

  navigateAddItemPage() {
    Get.toNamed('/addItem');
  }

  navigateDetailPage(int index) {
    Get.toNamed('/detailItem', arguments: items[index]);
  }

  void filterItems(String query) async {
    if (query.isEmpty) {
      items.assignAll(allItems);
    } else {
      try {
        final responseData = await _homeRepository.searchItemsByTitle(query);
        items.assignAll(responseData);
      } catch (e) {
        print('Error searching items: $e');
      }
    }
  }

  Future<void> getAllItems() async {
    itemStatus.value = StateApi.loading;
    try {
      final responseData = await _homeRepository.getAllItems();
      allItems.value = responseData;
      items.value = responseData;
      update();
      items.isEmpty
          ? itemStatus.value = StateApi.empty
          : itemStatus.value = StateApi.success;
    } catch (e) {
      itemStatus.value = StateApi.error;
      print('Error fetching items: $e');
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
