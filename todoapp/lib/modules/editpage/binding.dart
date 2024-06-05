import 'package:get/get.dart';
import 'package:todoapp/modules/editpage/controller.dart';

class EditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditItemController>(() => EditItemController());
  }
}
