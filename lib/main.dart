import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:testproject/src/bloc/counter_bloc.dart';
import 'package:testproject/src/bottom_nav_bar.dart';
import 'package:testproject/src/controllers/controller.dart';
import 'package:testproject/src/repositories/weather_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBindings(),
      home: const RootApp(),
    );
  }
}

class RootApp extends StatelessWidget {
  const RootApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(builder: (controller) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) return;
          var navigator = Navigator.of(context);
          await navigator.maybePop();
        },
        child: Navigator(
          key: Get.nestedKey(1),
          onGenerateRoute: (context) {
            return MaterialPageRoute(
              builder: (_) => BottomNavBar(),
            );
          },
        ),
      );
    });
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('back'),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
      ),
      body: SafeArea(child: Text("Hello")),
    );
  }
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider(
//       create: (context) => WeatherRepository(),
//       child: BlocProvider(
//         create: (context) => CounterBloc(),
//         child: MaterialApp(
//           home: SafeArea(
//             child: Scaffold(
//               body: BlocBuilder<CounterBloc, int>(
//                 builder: (context, state) {
//                   return Column(
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           BlocProvider.of<CounterBloc>(context)
//                               .add(CounterIncrement());
//                         },
//                         child: const Text("Increment"),
//                       ),
//                       Center(
//                         child: Text('Hello World! $state'),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//               floatingActionButton: Builder(builder: (context) {
//                 return FloatingActionButton(
//                   onPressed: () async {
//                     final temperature = await context
//                         .read<WeatherRepository>()
//                         .getWeatherTemp();
//                     print("Temperature: $temperature");
//                     context.read<CounterBloc>().add(CounterDecrement());
//                   },
//                 );
//               }),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
