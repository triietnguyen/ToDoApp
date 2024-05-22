import 'package:get/get.dart';
import 'package:todoapp/modules/detailpage/controller.dart';

class DetailItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailItemController());
    // Get.put(DetailItemController());
  }
}
