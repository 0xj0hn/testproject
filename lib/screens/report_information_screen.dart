import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controllers/gkey_controller.dart';
import 'package:testproject/controllers/plate_controller.dart';
import 'package:testproject/controllers/screenshot_controller.dart';
import 'package:testproject/widgets/plateinput_widget.dart';

class ReportInformationScreen extends StatefulWidget {
  const ReportInformationScreen({super.key});

  @override
  State<ReportInformationScreen> createState() =>
      _ReportInformationScreenState();
}

class _ReportInformationScreenState extends State<ReportInformationScreen> {
  final som = Get.put(PlateController());
  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report information page"),
      ),
      body: GetBuilder<PlateController>(builder: (context) {
        return Column(
          children: [
            GetBuilder<PlateController>(builder: (c) {
              return Text(c.mobileNumber);
            }),
            GetBuilder<PlateController>(builder: (c) {
              return PlateInputWidget(
                plate1: c.plate1,
                plate2: c.plate2,
                plate3: c.plate3,
                onChangedPlate1: c.updatePlate1,
                onChangedPlate2: c.updatePlate2,
                onChangedPlate3: c.updatePlate3,
              );
            }),
            GetBuilder<PlateController>(builder: (c) {
              return OutlinedButton(
                onPressed: c.isEdited ? c.updateTheWholePlate : null,
                child: const Text("Edit"),
              );
            })
          ],
        );
      }),
    );
  }
}
