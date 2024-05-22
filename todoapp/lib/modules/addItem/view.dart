import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/modules/addItem/blocks/addimage_block.dart';
import 'package:todoapp/modules/addItem/blocks/header_block.dart';
import 'package:todoapp/modules/addItem/controllder.dart';
import 'package:todoapp/modules/addItem/widgets/buttonwidget.dart';
import 'package:todoapp/modules/addItem/widgets/textformfiledwidget.dart';

class AddItemPage extends GetView<AddItemController> {
  const AddItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xffF6ECC9),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () => controller.navigateToBack(),
                  child: HeaderBlock(),
                ),
                AddImageBlock(),
                TextFormFieldWidget(),
                TextFormFieldWidget(),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.sp),
              child: ButtonWidget(),
            ),
          ],
        ),
      ),
    ));
  }
}
