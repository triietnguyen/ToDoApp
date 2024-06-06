import 'package:flutter/material.dart';
import 'package:todoapp/modules/home/blocks/bodyhome_block.dart';

class TabNavigationBarBlock extends StatelessWidget {
  const TabNavigationBarBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("My Notes"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.list)),
                Tab(icon: Icon(Icons.check_circle_outline)),
                Tab(icon: Icon(Icons.check_circle_rounded)),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              BodyHomeBlock(),
              BodyHomeBlock(),
              BodyHomeBlock(),
            ],
          )),
    );
  }
}
