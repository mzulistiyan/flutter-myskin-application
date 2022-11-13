import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/ui/pages/artikel/detail_artikel_page.dart';

import 'package:google_fonts/google_fonts.dart';

class ArikelPage extends StatelessWidget {
  const ArikelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFAFAFA),
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Artikel',
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Column(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xffE3E3E3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: TextFormField(
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                      hintText: 'Cari Artikel Kesehatan Kulit',
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ).copyWith(isDense: true),
                  ),
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailArtikelPage(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xffF9F3F3),
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kesehatan Kulit Wajah',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 165,
                                  child: Text(
                                    '4 Manfaat Eksfoliasi untuk Kesehatan Kulit dan Kecantikan',
                                    style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 115,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/image_artikel_1.png'),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '15 Hari Lalu',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                  ),
                                ),
                                const Icon(Icons.more_horiz)
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'eksfoliasi adalah proses menghilangkan sel kulit mati di permukaan kulit menggunakan mati di permukaan kulit menggunakan',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    for (int i = 0; i < 3; i++)
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xffF9F3F3),
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Penyakit Kulit',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 165,
                                  child: Text(
                                    'Monkeypox Press Release',
                                    style: GoogleFonts.poppins(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 115,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            'assets/images/image_artikel_2.png'),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '15 Hari Lalu',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                  ),
                                ),
                                const Icon(Icons.more_horiz)
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'eksfoliasi adalah proses menghilangkan sel kulit mati di permukaan kulit menggunakan mati di permukaan kulit menggunakan',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
