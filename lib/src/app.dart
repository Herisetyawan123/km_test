import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:km_test/src/constant/color.dart';
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
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            elevation: 0,
            foregroundColor: black,
            backgroundColor: white,
            centerTitle: true,
            titleTextStyle: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }
}
