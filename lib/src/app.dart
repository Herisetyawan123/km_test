import 'package:flutter/material.dart';
import 'package:km_test/src/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "KM test suitmedia",
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoute.splash,
      routes: MyRoute.data,
    );
  }
}
