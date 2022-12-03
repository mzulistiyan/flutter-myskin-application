import 'package:flutter/material.dart';
import '../../../model/dokter/response_dokter.dart';
import 'package:flutter_application_myskin/ui/pages/dokter/detail_transaksi_page.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailDokter extends StatelessWidget {
  Dokter dokter;
  DetailDokter({
    required this.dokter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Detail Dokter',
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black54,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 450.0,
            foregroundDecoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/dokter-1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. ${dokter.namaDokter} .KK',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Dokter Spesial Kulit',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffF3F3F3),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                          ),
                          Text(
                            '4.5 Rattings',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffF3F3F3),
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.attach_money,
                            size: 16,
                          ),
                          Text(
                            'IDR 20K/Jam',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'About Me',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: const Color(0xffC5C1C1),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        height: 80,
        child: PrimaryButton(
          text: 'Lanjut Pembayaran',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutPage(
                  dokter: Dokter(
                    idDokter: dokter.idDokter,
                    namaDokter: dokter.namaDokter,
                    rumahSakit: dokter.rumahSakit,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
