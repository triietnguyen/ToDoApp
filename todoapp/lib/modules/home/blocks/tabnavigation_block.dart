import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/modules/home/blocks/header_block.dart';
import 'package:todoapp/modules/home/widgets/reactangle_widget.dart';

class TabNavigationBarBlock extends StatelessWidget {
  const TabNavigationBarBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom: TabBar(
            labelStyle: TextStyle(
              fontSize: 18.0.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16.0.sp,
              color: Colors.white54,
            ),
            tabs: const [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Reminder',
              ),
              Tab(
                text: 'Important',
              ),
            ],
          ),
          title: const HeaderBlock(),
        ),
        body: const TabBarView(
          children: [
            RectangleWidget(),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
