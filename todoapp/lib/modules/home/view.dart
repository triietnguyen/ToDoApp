import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/modules/home/blocks/tabnavigation_block.dart';
import 'package:todoapp/modules/home/controller.dart';
import 'package:todoapp/modules/home/widgets/add_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        const TabNavigationBarBlock(),
        Padding(
          padding: EdgeInsets.only(bottom: 20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 26.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () => controller.navigateAddItemPage(),
                        child: AddWidget()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
