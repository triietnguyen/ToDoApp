import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/data/models/todo.dart';
import 'package:todoapp/modules/detailpage/controller.dart';

class HeaderBlock extends GetView<DetailItemController> {
  const HeaderBlock({super.key});

  @override
  Widget build(BuildContext context) {
    var item = Get.arguments as Todo;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => controller.navigateToBackHome(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        Text(
          'Deltail Item',
          style: TextStyle(fontSize: 20.sp),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => Get.toNamed('editItem', arguments: item),
              child: const Icon(Icons.edit),
            ),
            SizedBox(
              width: 10.sp,
            ),
            GestureDetector(
              onTap: () => controller.showDeleteConfirmationDialog(item.id!),
              child: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
