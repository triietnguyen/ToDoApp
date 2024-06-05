import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/modules/detailpage/blocks/body_block.dart';
import 'package:todoapp/modules/detailpage/blocks/header_block.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderBlock(),
              SizedBox(
                height: 20.sp,
              ),
              BodyBlock(),
            ],
          ),
        ),
      ),
    );
  }
}
