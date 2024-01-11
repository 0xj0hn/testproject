import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesktopNavigation extends GetResponsiveWidget {
  DesktopNavigation({super.key});

  @override
  Widget phone() {
    return AnimatedCrossFade(
      crossFadeState:
          screen.isPhone ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: 300.milliseconds,
      secondChild: const SizedBox(),
      firstChild: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              tooltip: "Add",
              icon: const Icon(Icons.add),
              onPressed: () {
                Get.nestedKey(1)!
                    .currentState!
                    .pushReplacementNamed("/firstScreen");
              },
            ),
            IconButton(
              tooltip: "profile",
              icon: const Icon(Icons.person),
              onPressed: () {
                Get.nestedKey(1)!
                    .currentState!
                    .pushReplacementNamed("/secondScreen");
              },
            ),
            IconButton(
              tooltip: "Home",
              icon: const Icon(Icons.home),
              onPressed: () {
                Get.nestedKey(1)!
                    .currentState!
                    .pushReplacementNamed("/thirdScreen");
              },
            ),
          ],
        ),
      ),
    );
  }
}
