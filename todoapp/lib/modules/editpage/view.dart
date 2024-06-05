import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/modules/editpage/controller.dart';

class EditPage extends GetView<EditItemController> {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: controller.timeController,
                  decoration: InputDecoration(labelText: 'Time'),
                ),
                // Add fields for additionalFields
                ...controller.additionalFields.entries.map((entry) {
                  return TextFormField(
                    initialValue: entry.value.toString(),
                    decoration: InputDecoration(labelText: entry.key),
                    onChanged: (value) {
                      controller.additionalFields[entry.key] = value;
                    },
                  );
                }).toList(),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.showEditConfirmationDialog();
                      }
                    },
                    child: Text('Save'),
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
