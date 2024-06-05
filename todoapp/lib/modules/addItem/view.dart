import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todoapp/modules/addItem/blocks/header_block.dart';
import 'package:todoapp/modules/addItem/controllder.dart';
import 'package:todoapp/modules/addItem/widgets/textformfiledwidget.dart';
import 'package:todoapp/widgets/routes/app_image.dart';

class AddItemPage extends GetView<AddItemController> {
  const AddItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.sp),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => controller.navigateToBack(),
                      child: const HeaderBlock(),
                    ),
                    ClipOval(
                      child: Container(
                        color: const Color(0xffD9D9D9),
                        width: 136.0.sp,
                        height: 138.0.sp,
                        child: const Center(
                          child: Image(
                            image: AssetImage(AppImages.imgLogo),
                          ),
                        ),
                      ),
                    ),
                    const TextFormFieldWidget(
                      title: 'Title',
                    ),
                    const TextFormFieldWidget(
                      title: 'Description',
                    ),
                    Obx(
                      () => ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.textformfield.length,
                        itemBuilder: (context, index) {
                          return TextFormFieldWidget(
                            title: controller.textformfield[index],
                            fieldKey: controller
                                .textformfield[index], // Pass the key here
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => controller.textformfield.isEmpty
                              ? const SizedBox.shrink()
                              : TextButton(
                                  onPressed: () {
                                    controller.removeLastItem();
                                  },
                                  child: const Icon(Icons.remove),
                                ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.textController.clear();
                            controller.isOkButtonEnabled.value =
                                false; // Reset OK button state
                            Get.defaultDialog(
                              title: 'Add new field',
                              content: TextFormField(
                                controller: controller.textController,
                                decoration: const InputDecoration(
                                  labelText: 'Key',
                                ),
                                onChanged: (value) {
                                  controller.isOkButtonEnabled.value =
                                      value.trim().isNotEmpty;
                                },
                              ),
                              confirm: Obx(
                                () => ElevatedButton(
                                  onPressed: controller.isOkButtonEnabled.value
                                      ? () {
                                          controller.clickButtonOk();
                                          Get.back(); // Close the dialog after pressing OK
                                        }
                                      : null,
                                  child: const Text('OK'),
                                ),
                              ),
                              cancel: ElevatedButton(
                                onPressed: () {
                                  Get.back(); // Close the dialog on cancel
                                },
                                child: const Text('Cancel'),
                              ),
                            );
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.sp),
                  child: ElevatedButton(
                    onPressed: () => controller.clickButtonSave(),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
