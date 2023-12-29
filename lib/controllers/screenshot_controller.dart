import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreenshotControllerr {
  late GlobalKey _containerKey;
  Future<ui.Image?> captureUi() async {
    try {
      if (_containerKey.currentContext != null) {
        final boundary = _containerKey.currentContext!.findRenderObject()
            as RenderRepaintBoundary;
        return await boundary.toImage(pixelRatio: 2);
      }
    } catch (e) {
      throw Exception("widget is not in the widget tree");
    }
    return null;
  }
}
