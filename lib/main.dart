import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testproject/controllers/gkey_controller.dart';
import 'package:testproject/screens/responsive/desktop_navigation_screen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends GetResponsiveView {
  MyHome({
    super.key,
  });

  @override
  Widget builder() {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Navigator(
              key: Get.nestedKey(1),
              initialRoute: "/firstScreen",
              onGenerateRoute: (settings) {
                late Widget screen;
                switch (settings.name) {
                  case "/firstScreen":
                    screen = const Text("First screen");
                  case "/secondScreen":
                    screen = const Text("Second screen");
                  case "/thirdScreen":
                    screen = const Text("Third screen");
                  default:
                    screen = const Text("Unknown");
                }
                return GetPageRoute(
                  transitionDuration: 0.seconds,
                  page: () => screen,
                  settings: settings,
                );
              },
            ),
          ),
          Expanded(
            child: AnimatedCrossFade(
              firstChild: Container(
                width: double.infinity,
                color: Colors.red,
              ),
              secondChild: SizedBox(),
              crossFadeState: screen.isPhone
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: 300.milliseconds,
            ),
          )
        ],
      ),
      bottomNavigationBar: DesktopNavigation(),
    );
  }
}
