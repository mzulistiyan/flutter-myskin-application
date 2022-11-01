import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HasilDiagnosaSementaraPage extends StatelessWidget {
  const HasilDiagnosaSementaraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Hasil Diagnosis Sementara',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: SvgPicture.asset('assets/images/diagnosa-sementar.svg'),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Hey, hasil diagnosis sementara dari gejala Anda adalah ',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                children: [
                  TextSpan(
                    text: 'HERPES',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: const Color(0xffEE7814),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xffEE7814))),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Volutpat est velit egestas dui id ornare. Magna sit amet purus gravida quis blandit turpis cursus. Nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum. Posuere urna nec tincidunt praesent semper.',
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        height: 160,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.warning,
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    'Silahkan melanjutkan ke konsultasi untuk mengatasi masalah kulitmu bersama Dokter Kulit MySkin! Silahkan pilih doktermu terlebih dahulu',
                    style: GoogleFonts.poppins(
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            PrimaryButton(
              text: 'Lanjutkan',
              onPressed: () {
                Navigator.pushNamed(context, '/dokter-page');
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Kembali ke Menu Utama',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
