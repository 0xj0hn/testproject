import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Controller());
  }
}

class Controller extends GetxController {
  GlobalKey persistentKey = GlobalKey<ScaffoldState>();
  @override
  void onReady() {
    super.onReady();
  }

  final PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);
}
