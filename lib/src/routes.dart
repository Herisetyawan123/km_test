import 'package:flutter/widgets.dart';
import 'package:km_test/src/pages/second_screen.dart';
import 'package:km_test/src/pages/splash_screen.dart';
import 'package:km_test/src/pages/third_screen.dart';

class MyRoute {
  MyRoute._();

  static const String splash = "/splash";
  static const String second = "/second";
  static const String third = "/third";

  static Map<String, WidgetBuilder> data = {
    splash: (_) => const SplashScreen(),
    second: (_) => const SecondScreen(),
    third: (_) => const ThirdScreen(),
  };
}
