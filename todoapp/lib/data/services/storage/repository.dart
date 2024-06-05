import 'package:todoapp/data/models/todo.dart';
import 'package:todoapp/data/network/api/api_url.dart';
import 'package:todoapp/data/network/api/dio_client.dart';

class HomeRepository {
  Future<List<Todo>> getAllItems() async {
    try {
      var response = await Api().get(ApiUrl.getAllItem);
      List<dynamic> responseData = response.data;
      List<Todo> items =
          responseData.map((item) => Todo.fromJson(item)).toList();
      return items;
    } catch (e) {
      print('Error fetching items: $e');
      rethrow;
    }
  }

  Future<Todo> createItem(Todo todo) async {
    try {
      final data = {
        'title': todo.title,
        'description': todo.description,
        // Include additional fields
        if (todo.additionalFields != null) ...todo.additionalFields!,
      };
      var response = await Api().post(ApiUrl.createItem, data: data);
      return Todo.fromJson(response.data);
    } catch (e) {
      print('Error creating item: $e');
      rethrow;
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      var response = await Api().delete(ApiUrl.deleteItem + id);
    } catch (e) {
      print('Error deleting item: $e');
      rethrow;
    }
  }

  Future<void> updateItem(Todo todo) async {
    try {
      final data = {
        'title': todo.title,
        'description': todo.description,
        if (todo.additionalFields != null) ...?todo.additionalFields,
      };
      var response = await Api().put(ApiUrl.updateItem + todo.id!, data: data);
    } catch (e) {
      print('Error updating item: $e');
      rethrow;
    }
  }

  Future<List<Todo>> searchItemsByTitle(String title) async {
    try {
      var response = await Api().get(ApiUrl.getItemByTitle + title);
      List<dynamic> responseData = response.data;
      List<Todo> items =
          responseData.map((item) => Todo.fromJson(item)).toList();
      return items;
    } catch (e) {
      print('Error searching items: $e');
      rethrow;
    }
  }
}
