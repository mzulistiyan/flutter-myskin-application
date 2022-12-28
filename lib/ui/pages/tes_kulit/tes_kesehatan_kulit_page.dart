import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/pasien/bloc/tes_kesehatan_kulit_bloc.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TesKesehatanKulitPage extends StatefulWidget {
  const TesKesehatanKulitPage({super.key});

  @override
  State<TesKesehatanKulitPage> createState() => _TesKesehatanKulitPageState();
}

class _TesKesehatanKulitPageState extends State<TesKesehatanKulitPage> {
  final _tesKesehatanKulitBloc = TesKesehatanKulitBloc();
  int? _valueMasalah = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            height: 200,
            decoration: const BoxDecoration(
              color: Color(0xffEE7814),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bagian kulit mana  yang mengalami masalah ?',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  'Pilih salah satu jawaban berikut',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.all(24),
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xffEE7814),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kulit Kepala',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: const Color(0xffEE7814),
                  value: 1,
                  groupValue: _valueMasalah,
                  onChanged: (value) {
                    setState(() {
                      _valueMasalah = value as int?;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xffEE7814),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Wajah',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: const Color(0xffEE7814),
                  value: 2,
                  groupValue: _valueMasalah,
                  onChanged: (value) {
                    setState(() {
                      _valueMasalah = value as int?;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xffEE7814),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Punggung',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: const Color(0xffEE7814),
                  value: 3,
                  groupValue: _valueMasalah,
                  onChanged: (value) {
                    setState(() {
                      _valueMasalah = value as int?;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xffEE7814),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dada / Perut',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: const Color(0xffEE7814),
                  value: 4,
                  groupValue: _valueMasalah,
                  onChanged: (value) {
                    setState(() {
                      _valueMasalah = value as int?;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar:
          BlocConsumer<TesKesehatanKulitBloc, TesKesehatanKulitState>(
        bloc: _tesKesehatanKulitBloc,
        listener: (context, state) {
          print("Debug $state");
          if (state is TesKesehatanKulitSuccess) {
            Navigator.pushNamed(context, '/hasil-sementara-page');
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(10),
            height: 60,
            child: PrimaryButton(
              text: 'Selesai',
              onPressed: () {
                _tesKesehatanKulitBloc.add(
                  TesKesehatanKulit(diagnosaSementara: "KULIT CACAR"),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
