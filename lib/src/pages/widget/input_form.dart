import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant/color.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
    required this.placeholder,
    required this.controller,
  }) : super(key: key);

  final String placeholder;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: white,
        filled: true,
        hintStyle: GoogleFonts.poppins(
          color: inputColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        hintText: placeholder,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 7,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE2E3E4),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFE2E3E4),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
