import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:testproject/main.dart';
import 'package:testproject/src/controllers/controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(builder: (controller) {
      return PersistentTabView(
        key: controller.persistentKey,
        controller: controller.persistentTabController,
        tabs: [
          PersistentTabConfig(
            screen: Container(),
            item: ItemConfig(
              icon: Icon(Icons.add),
            ),
          ),
          PersistentTabConfig(
            screen: MySecondTab(),
            item: ItemConfig(
              icon: Icon(Icons.add),
            ),
          ),
          PersistentTabConfig(
            screen: Container(),
            item: ItemConfig(
              icon: Icon(Icons.add),
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) {
          return Style2BottomNavBar(navBarConfig: navBarConfig);
        },
      );
    });
  }
}

class MySecondTab extends StatelessWidget {
  const MySecondTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            pushScreen(context, screen: SecondPage(), withNavBar: true);
          },
          child: Text('second page'),
        ),
      ),
    );
  }
}
