import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoarding2Page extends StatelessWidget {
  const OnBoarding2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset('assets/images/onboarding/onboarding_2.svg'),
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.all(50),
          width: double.infinity,
          height: 371,
          decoration: const BoxDecoration(
            color: Color(0xffFDF1E7),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'MySkins ',
                    style: GoogleFonts.poppins(
                      color: Color(0xffEE7814),
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'apps ',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Kulit menjadi garda terdepan perlindungan diri dari berbagai ancaman fisik, kimia, dan kuman.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
