import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:todoapp/modules/detailpage/controller.dart';

class HeaderBlock extends GetView<DetailItemController> {
  const HeaderBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () => controller.navigateToBackHome(),
            child: const Icon(Icons.arrow_back_ios)),
        Row(
          children: [
            const Icon(Icons.edit),
            SizedBox(
              width: 10.sp,
            ),
            const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ],
        ),
      ],
    );
  }
}
