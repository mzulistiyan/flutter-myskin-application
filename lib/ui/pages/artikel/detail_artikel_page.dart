import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailArtikelPage extends StatelessWidget {
  const DetailArtikelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Detail Artikel',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/image_artikel_1.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '4 Manfaat Eksfoliasi untuk Kesehatan Kulit dan Kecantikan',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Dijelaskan oleh Healthline, eksfoliasi adalah proses menghilangkan sel kulit mati di permukaan kulit menggunakan zat kimia, butiran, atau alat khusus untuk eksfoliasi. Kulit sebenarnya bisa merontokkan sel kulit mati setiap sekitar 30 hari sekali untuk memberikan ruang pada sel kulit baru. Meskipun begitu, proses ini tidak bisa membersihkan sel kulit mati sepenuhnya sehingga proses eksfoliasi diperlukan. Selain itu, ada beberapa manfaat eksfoliasi, baik untuk kesehatan kulit dan kecantikan. ',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '1. Membuat wajah lebih cerah ',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Menurut American Academy of Dermatology, melakukan eksfoliasi bisa membuat wajah lebih cerah. Eksfoliasi bisa membantu mengatasi permasalah kulit, seperti bintik hitam, tekstur kulit yang tidak rata, hiperpigmentasi, dan bekas jerawat. Kulit juga akan tampak lebih cerah karena proses eksfoliasi melancarkan peredaran darah.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                '2. Membuat produk skin care diserap oleh kulit dengan baik ',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Produk skin care tidak akan terserap dengan baik ketika masih ada sel kulit mati yang tertinggal. Produk yang paling mahal sekalipun tidak akan memberikan manfaat pada kulit ketika sel kulit mati belum hilang sepenuhnya. Namun dengan eksfoliasi, sel kulit mati bisa hilang dan membuat produk skin care diserap dengan lebih baik oleh pori-pori kulit.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
