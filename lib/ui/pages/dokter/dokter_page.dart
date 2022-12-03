import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/dokter/handle_api/dokter_bloc.dart';
import 'package:flutter_application_myskin/ui/pages/dokter/detail_dokter_page.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../model/dokter/response_dokter.dart';

class DokterPage extends StatefulWidget {
  const DokterPage({super.key});

  @override
  State<DokterPage> createState() => _DokterPageState();
}

class _DokterPageState extends State<DokterPage> {
  final DokterBloc _dokterBloc = DokterBloc();
  TextEditingController keyword = TextEditingController(text: '');
  List<Dokter> _listDataUser = [];
  List<Dokter> _listResult = [];
  @override
  void initState() {
    _dokterBloc.add(GetDokter());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Rekomendasi Dokter Kulit',
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: TextField(
                  controller: keyword,
                  onChanged: (v) {
                    print('keyword: $v');
                    _listResult = _listDataUser
                        .where(
                          (element) =>
                              element.namaDokter!.toLowerCase().contains(
                                    v.toLowerCase(),
                                  ),
                        )
                        .toList();
                    _dokterBloc.add(GetDokter());
                  },
                  decoration: InputDecoration(
                    filled: true,
                    isDense: true, // Added this
                    contentPadding: const EdgeInsets.all(8),
                    prefixIcon: Icon(Icons.search), // Added this
                    hintText: 'Cari Dokter Kulit',
                    hintStyle: GoogleFonts.poppins(fontSize: 12),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          width: 1, color: Color(0xffE3E3E3)), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          width: 1, color: Color(0xffE3E3E3)), //<-- SEE HERE
                    ),
                  ),
                ),
              ),
            ),
            BlocConsumer<DokterBloc, DokterState>(
              bloc: _dokterBloc,
              listener: (context, state) {
                print('state is $state');
                if (state is DokterSuccess) {
                  if (keyword.text.isEmpty) {
                    _listDataUser = state.responseGetDokter.data!.dokter ?? [];
                  } else {
                    _listDataUser = _listResult;
                  }
                }
              },
              builder: (context, state) {
                if (state is DokterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is DokterSuccess) {
                  return _buildListDokter(context, _listDataUser);
                } else if (state is DokterError) {
                  return Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: PrimaryButton(
                        text: 'Reload',
                        onPressed: () {
                          _dokterBloc.add(GetDokter());
                        },
                      ));
                }
                return SizedBox();
              },
            ),
          ],
        ));
  }

  Widget _buildListDokter(BuildContext context, List<Dokter> listDokter) {
    return Expanded(
        child: RefreshIndicator(
      onRefresh: () async {
        _dokterBloc.add(GetDokter());
      },
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: _listDataUser.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailDokter(
                    dokter: Dokter(
                      idDokter: _listDataUser[index].idDokter,
                      namaDokter: _listDataUser[index].namaDokter,
                      rumahSakit: _listDataUser[index].rumahSakit,
                    ),
                  ),
                ),
              ),
              child: Container(
                height: 80,
                margin: const EdgeInsets.symmetric(vertical: 3),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: const Color(0xffFFFFFF),
                    border: Border.all(
                      color: const Color(0xffE3E3E3),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/icon_dokter.png',
                          width: 55,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              listDokter[index].namaDokter!,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              listDokter[index].rumahSakit!,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xffFFA235),
                                  size: 17,
                                ),
                                Text(
                                  '4.6',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xffB8B8B8),
                          size: 20,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
