import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/modules/home/widgets/add_widget.dart';

class HeaderBlock extends StatelessWidget {
  const HeaderBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'My Notes',
          style: TextStyle(fontSize: 36.sp, color: Colors.white),
        ),
        AddWidget(),
      ],
    );
  }
}
