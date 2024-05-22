import 'package:get/get.dart';
import 'package:todoapp/modules/addItem/controllder.dart';

class AddItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddItemController());
  }
}
