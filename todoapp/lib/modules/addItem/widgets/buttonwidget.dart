import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/modules/addItem/controllder.dart';

class ButtonWidget extends GetView<AddItemController> {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.clickButtonSave();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xffF6ECC9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            color: Colors.black,
            width: 2.sp,
          ),
        ),
        minimumSize: Size(323.sp, 54.sp), // Kích thước của nút
      ),
      child: const Text('Save'),
    );
  }
}
