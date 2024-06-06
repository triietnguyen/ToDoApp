import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/modules/home/controller.dart';

class BodyHomeBlock extends GetView<HomeController> {
  const BodyHomeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: TextField(
                controller: controller.searchController,
                decoration: const InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => controller.navigateDetailPage(index),
                      child: Container(
                        width: 332.sp,
                        height: 120.sp,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(bottom: 10.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 20.sp,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.items[index].title!,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.sp),
                                ),
                                Text(
                                  controller.items[index].description!,
                                  style: TextStyle(
                                      color: Colors.black45, fontSize: 20.sp),
                                ),
                                Text(
                                  '${DateFormat.yMMMMEEEEd().format(controller.items[index].time!.toLocal())} \n${DateFormat.Hm().format(controller.items[index].time!.toLocal())}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20.sp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
