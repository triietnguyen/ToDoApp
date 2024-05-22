import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/modules/home/widgets/add_widget.dart';

class RectangleWidget extends StatelessWidget {
  const RectangleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 332.sp,
            height: 99.sp,
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(bottom: 10.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AddWidget(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title',
                      style: TextStyle(color: Colors.black, fontSize: 20.sp),
                    ),
                    Text(
                      'lorem one two three',
                      style: TextStyle(color: Colors.black45, fontSize: 20.sp),
                    ),
                    Text(
                      '10 Jan, 2023 10:15 pm',
                      style: TextStyle(color: Colors.black, fontSize: 20.sp),
                    ),
                  ],
                ),
                Icon(Icons.save)
              ],
            ),
          );
        });
  }
}
