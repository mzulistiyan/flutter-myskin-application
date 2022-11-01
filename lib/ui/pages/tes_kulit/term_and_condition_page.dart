import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TermAndConditionPage extends StatefulWidget {
  const TermAndConditionPage({super.key});

  @override
  State<TermAndConditionPage> createState() => _TermAndConditionPageState();
}

class _TermAndConditionPageState extends State<TermAndConditionPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      if (!isChecked) {
        return Colors.black;
      } else {
        return const Color(0xffEE7814);
      }
    }

    return Scaffold(
      backgroundColor: Color(0xffF9F3F3),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terms and',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Condition',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        color: Color(0xffEE7814),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset('assets/images/term_and_condition.svg'),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1 - Syarat dan Ketentuan Pengguna',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Saat Anda membuat akun dengan kami, Anda menjamin bahwa Anda berusia di atas 18 tahun, dan bahwa informasi yang Anda berikan kepada kami akurat, lengkap, dan terkini setiap saat. Informasi yang tidak akurat, tidak lengkap, atau usang dapat mengakibatkan penghentian segera akun Anda di Layanan.',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Saat Anda membuat akun dengan kami, Anda menjamin bahwa Anda berusia di atas 18 tahun, dan bahwa informasi yang Anda berikan kepada kami akurat, lengkap, dan terkini setiap saat. Informasi yang tidak akurat, tidak lengkap, atau usang dapat mengakibatkan penghentian segera akun Anda di Layanan.',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Anda tidak boleh menggunakan sebagai nama pengguna nama orang atau entitas lain atau yang tidak tersedia secara sah untuk digunakan, nama atau merek dagang yang tunduk pada hak orang atau entitas lain selain Anda, tanpa otorisasi yang sesuai. Anda tidak boleh menggunakan sebagai nama pengguna nama apa pun yang menyinggung, vulgar, atau cabul.',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Kami berhak menolak layanan, menghentikan akun, menghapus atau mengedit konten, atau membatalkan pesanan atas kebijakan kami sendiri.',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text(
                  'Menyetujui kebijakan dan persyaratan  yang berlaku',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24),
        child: PrimaryButton(
          text: 'Mulai',
          onPressed: () {
            Navigator.pushNamed(context, '/tes-kesehatan-page');
          },
        ),
      ),
    );
  }
}
