import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlateController extends GetxController {
  String initialPlate1 = "";
  String initialPlate2 = "";
  String initialPlate3 = "";
  String mobileNumber = "";

  String plate1 = "";
  String plate2 = "";
  String plate3 = "";

  bool get isEdited =>
      initialPlate1 != plate1 ||
      initialPlate2 != plate2 ||
      initialPlate3 != plate3;

  bool isDataChanged = false;

  void updatePlate1(String value) {
    plate1 = value;
    update();
  }

  void updatePlate2(String value) {
    plate2 = value;
    update();
  }

  void updatePlate3(String value) {
    plate3 = value;
    update();
  }

  void updateTheWholePlate() {
    initialPlate1 = plate1;
    initialPlate2 = plate2;
    initialPlate3 = plate3;
    update();
    getPlateIdentities();
  }

  getPlateIdentities() {
    mobileNumber = Random().nextInt(5).toString();
    update();
  }
}
