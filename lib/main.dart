import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controllers/gkey_controller.dart';
import 'package:testproject/report_information_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: const Center(
          child: Text('Hello World!'),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.to(() => const ReportInformationScreen());
        }),
      ),
    );
  }
}
