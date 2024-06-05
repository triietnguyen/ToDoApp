import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/widgets/routes/app_image.dart';

class HeaderBlock extends StatelessWidget {
  const HeaderBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'My Notes',
        style: TextStyle(
          fontSize: 30.sp,
        ),
      ),
    );
  }
}
