import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/pasien/handle_api/consults_pasien_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class RekamMedisPage extends StatefulWidget {
  RekamMedisPage({
    super.key,
  });

  @override
  State<RekamMedisPage> createState() => _RekamMedisPageState();
}

class _RekamMedisPageState extends State<RekamMedisPage> {
  final ConsultsPasienBloc _consultsPasienBloc = ConsultsPasienBloc();
  @override
  void initState() {
    super.initState();
    _consultsPasienBloc.add(GetConsultsPasien());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffFAFAFA),
        elevation: 0.2,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_sharp,
            size: 30,
            color: Color(0xffEE7814),
          ),
        ),
        title: Text(
          'Rekam Medis',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(10),
              shadowColor: Colors.black.withOpacity(0.3),
              child: TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  filled: true,
                  isDense: true, // Added this
                  labelStyle: GoogleFonts.montserrat(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                  ),
                  hintText: 'Cari Rekam Medis',
                  hintStyle: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xffBBBBBB)),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        width: 1, color: Colors.transparent), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        width: 1, color: Colors.transparent), //<-- SEE HERE
                  ),
                ),
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
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.responseConsultsPasien.data!.length,
                      itemBuilder: (context, index) =>
                          cardCriteria(context, state, index),
                    ),
                  );
                } else if (state is ConsultsPasienError) {}
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget cardCriteria(
      BuildContext context, ConsultsPasienSuccess state, int index) {
    final createdAt =
        DateTime.parse(state.responseConsultsPasien.data![index].createdAt!)
            .toLocal();
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        shadowColor: Colors.black.withOpacity(0.3),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. ${state.responseConsultsPasien.data![index].dokter!.namaDokter!}",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  if (state
                          .responseConsultsPasien.data![index].diagnosaLanjut ==
                      null)
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        'Belum Menyelesaikan Konsultasi',
                        style: GoogleFonts.montserrat(
                          fontSize: 8,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  else
                    Text(
                      state.responseConsultsPasien.data![index]
                              .diagnosaLanjut ??
                          "Silahkan Menyelesaikan Diagnosa Lanjut",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Tanggal ${createdAt}',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: const Color(0xff999999),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xffDDDDDD)),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffFF6666),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
