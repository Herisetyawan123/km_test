import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:km_test/src/constant/color.dart';
import 'package:km_test/src/pages/widget/btn_primary.dart';
import 'package:km_test/src/providers/user/user_provider.dart';
import 'package:km_test/src/routes.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = Provider.of<UserProvider>(context, listen: false).myname;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Second Screen",
          style: GoogleFonts.poppins(
            color: black,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: blue,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32,
          horizontal: 20,
        ),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    name,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Select User Name",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            ButtonPrimary(
              width: MediaQuery.of(context).size.width,
              text: "Choose a User",
              function: () => Navigator.of(context).pushNamed(MyRoute.third),
            )
          ],
        ),
      ),
    );
  }
}
