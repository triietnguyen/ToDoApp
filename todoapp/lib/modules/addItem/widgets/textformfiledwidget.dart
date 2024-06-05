import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/modules/addItem/controllder.dart';

class TextFormFieldWidget extends GetView<AddItemController> {
  const TextFormFieldWidget({super.key, required this.title, this.fieldKey});

  final String title;
  final String? fieldKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: title,
      ),
      onChanged: (value) {
        if (fieldKey == null) {
          // If fieldKey is null, it's a predefined field (Title or Description)
          if (title == 'Title') {
            controller.todo.title = value;
          } else if (title == 'Description') {
            controller.todo.description = value;
          }
        } else {
          // If fieldKey is not null, it's an additional field
          controller.todo.additionalFields?[fieldKey!] = value;
        }
      },
    );
  }
}
