import 'package:get/get.dart';

class AddItemController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  navigateToBack() {
    Get.back();
  }

  navigateToDetailPage() {
    Get.offAndToNamed('/detailItem');
  }
}
