import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/data/models/todo.dart';

class BodyBlock extends StatelessWidget {
  const BodyBlock({super.key});

  @override
  Widget build(BuildContext context) {
    var item = Get.arguments as Todo;
    final entries = item.additionalFields!.entries.toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildReadOnlyField('Title', item.title!),
          SizedBox(height: 10.sp),
          _buildReadOnlyField('Description', item.description!),
          // SizedBox(height: 10.sp),
          // _buildReadOnlyField('Important', item.important?.toString() ?? ''),
          SizedBox(height: 10.sp),
          _buildReadOnlyField(
              'Time',
              item.time != null
                  ? '${DateFormat.yMMMMEEEEd().format(item.time!.toLocal())} ${DateFormat.Hm().format(item.time!.toLocal())}'
                  : ''),
          SizedBox(height: 10.sp),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  initialValue: entry.value.toString(),
                  decoration: InputDecoration(
                    labelText: entry.key,
                    labelStyle: TextStyle(color: Colors.black87),
                    border: OutlineInputBorder(),
                    enabled: false,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReadOnlyField(String label, String value) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black87),
        border: OutlineInputBorder(),
        enabled: false,
      ),
    );
  }
}
