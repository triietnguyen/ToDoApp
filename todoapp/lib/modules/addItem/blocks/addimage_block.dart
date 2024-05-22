import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddImageBlock extends StatelessWidget {
  const AddImageBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.blue, // Background color of the logo
        width: 136.0.sp, // Width of the circle
        height: 138.0.sp, // Height of the circle
        child: Center(
          child: Icon(
            Icons.star, // Icon inside the circle
            color: Colors.white, // Color of the icon
            size: 61.0.sp, // Size of the icon
          ),
        ),
      ),
    );
  }
}
