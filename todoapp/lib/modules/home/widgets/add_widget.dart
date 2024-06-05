import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWidget extends StatelessWidget {
  const AddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Color(0xffD9D9D9), // Background color of the logo
        width: 51.0.sp, // Width of the circle
        height: 49.0.sp, // Height of the circle
        child: const Center(
          child: Icon(
            Icons.add, // Icon inside the circle
            color: Colors.black, // Color of the icon
            size: 30.0, // Size of the icon
          ),
        ),
      ),
    );
  }
}
