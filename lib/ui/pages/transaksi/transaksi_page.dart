import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_myskin/bloc/pasien/handle_api/transaksi_bloc.dart';
import 'package:flutter_application_myskin/model/auth/pasien/response_transaksi.dart';
import 'package:flutter_application_myskin/ui/pages/dokter/pembayaran_page.dart';
import 'package:flutter_application_myskin/ui/widget/bottom_navigation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  bool pending = false;
  bool selesai = false;
  bool batal = false;
  bool varl = false;

  final TransaksiBloc _transaksiBloc = TransaksiBloc();

  List<DataTransaksi> _listDataUser = [];
  List<DataTransaksi> _listResult = [];
  List<String> _filter = [];
  @override
  void initState() {
    super.initState();
    _transaksiBloc.add(GetTransaksi());
  }

  @override
  Widget build(BuildContext context) {
    Widget filterTab(bool cek, String name, int jml) {
      return Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.5),
        decoration: BoxDecoration(
            color:
                !cek ? Colors.white : const Color(0xffEE7814).withOpacity(0.2),
            border: Border.all(
              color: !cek ? const Color(0xffDADADA) : const Color(0xffEE7814),
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: !cek ? const Color(0xff7C7C7D) : const Color(0xffEE7814),
              ),
            ),
            Text(
              '($jml)',
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: !cek ? const Color(0xff7C7C7D) : const Color(0xffEE7814),
              ),
            ),
          ],
        ),
      );
    }

    Widget cardPending(List<DataTransaksi> transaksi, int index) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/icon-coin.png',
                  width: 35,
                  height: 35,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    transaksi[index].idDokter == null
                        ? Text(
                            '',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : Text(
                            'Dr. ${transaksi[index].dokter!.namaDokter!} Sp.KK',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Dari Transfer Bank',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '13-11-2022',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  transaksi[index].totalBayar.toString(),
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  transaksi[index].statusBayar!,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xffEE7814),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget cardBerhasil() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/icon-coin.png',
                  width: 35,
                  height: 35,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Jennifer Sp.KK',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Dari Transfer Bank',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '13-11-2022',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rp 120.000.00',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Berhasil',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xffEE7814),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget cardBatal() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/icon-coin.png',
                  width: 35,
                  height: 35,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Jennifer Sp.KK',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Dari Transfer Bank',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '13-11-2022',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rp 120.000.00',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Batal',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xffEE7814),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Riwayat Transaksi',
          style: GoogleFonts.poppins(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
              (route) => false,
            );
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!pending) {
                          pending = true;
                          _filter.add("PENDING");
                          print(_filter);
                          _listResult = _listDataUser
                              .where(
                                  (element) => element.statusBayar! == _filter)
                              .toList();
                          _transaksiBloc.add(GetTransaksi());

                          print(_listDataUser);
                        } else {
                          _transaksiBloc.add(GetTransaksi());
                          pending = false;
                        }
                      });
                    },
                    child: filterTab(pending, "Pending ", 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!selesai) {
                          selesai = true;
                          _listResult = _listDataUser
                              .where(
                                (element) =>
                                    element.statusBayar!.contains("SUCCESS"),
                              )
                              .toList();
                          _transaksiBloc.add(GetTransaksi());
                        } else {
                          _transaksiBloc.add(GetTransaksi());
                          selesai = false;
                        }
                      });
                    },
                    child: filterTab(selesai, "Selesai ", 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!batal) {
                          batal = true;
                        } else {
                          batal = false;
                        }
                      });
                    },
                    child: filterTab(batal, "Menunggu Dokter ", 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!varl) {
                          varl = true;
                        } else {
                          varl = false;
                        }
                      });
                    },
                    child: filterTab(varl, "Batal ", 20),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transaksi Terakhir',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Semua Transaksi',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: const Color(0xffEE7814),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          BlocConsumer<TransaksiBloc, TransaksiState>(
            bloc: _transaksiBloc,
            listener: (context, state) {
              print('state is $state');
              if (state is TransaksiSuccess) {
                if (!pending) {
                  _listDataUser = state.responseTransaksi.data ?? [];
                } else {
                  _listDataUser = _listResult;
                }
              }
            },
            builder: (context, state) {
              if (state is TransaksiLoading) {
              } else if (state is TransaksiSuccess) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _listDataUser.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewExample(
                              url: _listDataUser[index].paymentUrl,
                            ),
                          ),
                        );
                      },
                      child: cardPending(
                        _listDataUser,
                        index,
                      ),
                    ),
                  ),
                );
              } else if (state is TransaksiError) {}
              return SizedBox();
            },
          ),
          ListView(
            shrinkWrap: true,
            children: [
              // cardBerhasil(),
              // cardBatal(),
            ],
          ),
          // if (pending == true) cardPending(),
          // if (selesai == true) cardBerhasil(),
          // if (batal == true) cardBatal(),
        ],
      ),
    );
  }
}
