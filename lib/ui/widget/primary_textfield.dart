import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryTextField extends StatelessWidget {
  String? text;
  final TextEditingController? controller;
  IconData? icon;
  PrimaryTextField({super.key, this.text, this.controller, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xffDFC3C3).withOpacity(0.2),
        border: Border.all(
          color: const Color(0xffEE7814),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xffB8B8B8)),
          hintText: text,
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            size: 20,
            color: Color(0xffC0ADAD),
          ),
        ),
      ),
    );
  }
}
