import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home screen"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Get.nestedKey(1)?.currentState!.pushNamed("/reportInformation");
          },
          child: Text("Go to report information"),
        ),
      ),
    );
  }
}
