import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/pasien/handle_api/consults_pasien_bloc.dart';
import 'package:flutter_application_myskin/ui/pages/konsultasi/chat_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class KonsultasiPage extends StatefulWidget {
  const KonsultasiPage({super.key});

  @override
  State<KonsultasiPage> createState() => _KonsultasiPageState();
}

class _KonsultasiPageState extends State<KonsultasiPage> {
  final ConsultsPasienBloc _consultsPasienBloc = ConsultsPasienBloc();

  @override
  void initState() {
    super.initState();
    _consultsPasienBloc.add(GetConsultsPasien());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Konsultasi',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chat Teratas',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocConsumer<ConsultsPasienBloc, ConsultsPasienState>(
              bloc: _consultsPasienBloc,
              listener: (context, state) {
                print(state);
              },
              builder: (context, state) {
                if (state is ConsultsPasienLoading) {
                  return SizedBox();
                } else if (state is ConsultsPasienSuccess) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.responseConsultsPasien.data!.length,
                      itemBuilder: ((context, index) => GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatPage(
                                          responseKonsultasi: state
                                              .responseConsultsPasien
                                              .data![index],
                                        ))),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  padding: const EdgeInsets.all(10),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.primaries[Random()
                                          .nextInt(Colors.primaries.length)],
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Center(
                                    child: Text(
                                      state.responseConsultsPasien.data![index]
                                          .dokter!.namaDokter!
                                          .toUpperCase()
                                          .substring(0, 2),
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Dr. ${state.responseConsultsPasien.data![index].dokter!.namaDokter!} Sp.KK',
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              'Today',
                                              style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Good morning, did you sleep well?',
                                              style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(6),
                                              decoration: const BoxDecoration(
                                                  color: Color(0xffEE7814),
                                                  shape: BoxShape.circle),
                                              child: Text(
                                                '1',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )));
                } else if (state is ConsultsPasienError) {}
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
