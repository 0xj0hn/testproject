import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: "https://shtvqhmxbfrbgpitmyqt.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNodHZxaG14YmZyYmdwaXRteXF0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDQ5OTc4NTUsImV4cCI6MjAyMDU3Mzg1NX0.lQIEXV-2DQR9hVOLh8M4kEYQquU1fpEDnXOTw62rtwo",
  );
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

  final supabase = Supabase.instance.client;

  @override
  Widget builder() {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                print(supabase.auth.currentSession);
              },
              child: Text("Check status"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (supabase.auth.currentSession != null)
                  await supabase.auth.signOut();
                print(await supabase.auth.signInWithPassword(
                  email: "nxh7@duck.com",
                  password: "13821382",
                ));
              },
              child: Text("Query"),
            ),
          ],
        ),
      ),
    );
  }
}
