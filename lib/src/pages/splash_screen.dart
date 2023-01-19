import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:km_test/src/constant/color.dart';
import 'package:km_test/src/pages/widget/btn_primary.dart';
import 'package:km_test/src/pages/widget/input_form.dart';
import 'package:km_test/src/pages/widget/space_h.dart';
import 'package:km_test/src/routes.dart';
import 'package:km_test/src/utils/palindrome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController palindrome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 32,
          ),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/background.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 116,
                height: 116,
                decoration: BoxDecoration(
                  color: white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Center(
                  child: Icon(
                    Icons.person_add_alt_1,
                    color: white,
                    size: 35,
                  ),
                ),
              ),
              spaceH(58),
              InputForm(
                placeholder: "Name",
                controller: name,
              ),
              spaceH(30),
              InputForm(
                placeholder: "Palindrome",
                controller: palindrome,
              ),
              spaceH(40),
              ButtonPrimary(
                width: width,
                text: "CHECK",
                function: () => alertDialog(
                  context,
                  checkPalindrome(palindrome.text)
                      ? "isPalindrome"
                      : "not palindrome",
                ),
              ),
              spaceH(15),
              ButtonPrimary(
                width: width,
                text: "NEXT",
                function: () => Navigator.of(context).pushNamed(MyRoute.second),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> alertDialog(BuildContext context, String message) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 187, 187),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text(
                "close",
                style: GoogleFonts.poppins(
                  color: Colors.red,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
