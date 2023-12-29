import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

class GKeyController extends GetxController {
  GlobalKey iconKey = GlobalKey();
  List<GlobalKey> globalKeys = [];
  IconData currentIcon = Icons.disabled_by_default;
  List<IconData> iconDataList = [
    Icons.abc,
    Icons.person,
    Icons.person_2,
    Icons.watch,
    Icons.e_mobiledata,
    Icons.g_mobiledata,
  ];
  ByteData? image;
  static GKeyController get to => Get.find<GKeyController>();

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    super.onClose();
    update();
  }

  GlobalKey generateUniqueKey() {
    iconKey = GlobalKey();
    globalKeys.add(iconKey);
    return globalKeys.last;
  }

  GlobalKey generateUniqueKeyWithUpdate() {
    generateUniqueKey();
    update();
    return iconKey;
  }

  removeLastGlobalKey() {
    globalKeys.removeLast();
    iconKey = globalKeys.lastOrNull ?? GlobalKey();
  }

  Future<ByteData?> getImage() async {
    if (iconKey.currentContext != null) {
      RenderRepaintBoundary repaintBoundary =
          iconKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final thing = await repaintBoundary.toImage(pixelRatio: 2.0);
      image = await thing.toByteData(format: ui.ImageByteFormat.png);
    } else {
      print("Widget with the associated global key is not in the widget tree");
    }
    update();
    return image;
  }

  IconData getRandomIcon() {
    Random random = Random();
    int randomNum = random.nextInt(iconDataList.length);
    currentIcon = iconDataList[randomNum];
    return currentIcon;
  }
}
