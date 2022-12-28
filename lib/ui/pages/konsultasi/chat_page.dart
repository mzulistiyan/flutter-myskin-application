import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/pasien/handle_api/update_status_konsultasi_bloc.dart';
import 'package:flutter_application_myskin/shared/helper/token_helper.dart';
import 'package:flutter_application_myskin/ui/widget/CustomTooltipShape.dart';
import 'package:flutter_application_myskin/model/response_konsultasi.dart';
import 'package:flutter_application_myskin/ui/widget/custom_pop_loading.dart';
import 'package:flutter_application_myskin/ui/widget/custom_rating.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  Data responseKonsultasi;
  ChatPage({super.key, required this.responseKonsultasi});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final UpdateStatusKonsultasiBloc _updateStatusKonsultasiBloc =
      UpdateStatusKonsultasiBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Dr. ${widget.responseKonsultasi.dokter!.namaDokter} Sp.KK',
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          widget.responseKonsultasi.statusKonsultasi == "SELESAI"
              ? const SizedBox()
              : BlocConsumer<UpdateStatusKonsultasiBloc,
                  UpdateStatusKonsultasiState>(
                  bloc: _updateStatusKonsultasiBloc,
                  listener: (context, state) {
                    print('state is from UpdatePRofileBloc: $state');
                    if (state is UpdateStatusKonsultasiLoading) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return const PopLoading();
                        },
                      );
                    } else if (state is UpdateStatusKonsultasiSuccess) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return const RattingPopUp();
                        },
                      );
                    }

                    if (state is UpdateStatusKonsultasiError) {}
                  },
                  builder: (context, state) {
                    return PopupMenuButton(
                      offset: const Offset(0, 50),
                      shape: const TooltipShape(),
                      onSelected: (result) async {
                        if (result == 1) {
                          final TokenHelper _tokenHelper = TokenHelper();
                          int roles = await _tokenHelper.getRoles();
                          if (roles == 0) {
                            _updateStatusKonsultasiBloc
                                .add(UpdateStatusKonsultasiPost(
                              statusKonsultasi: 'SELESAI',
                              id: widget.responseKonsultasi.id!,
                            ));
                          } else {
                            _showMyDialog(context);
                          }
                        }
                      },
                      icon: const Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: Colors.black,
                      ),
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: 0,
                            child: Text(
                              'Laporkan Dokter',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: Text(
                              'Selesaikan Konsultasi',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ];
                      },
                    );
                  },
                )
        ],
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
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 235,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "The pimple has appeared for 1 month and it hasn't healed",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 235,
                  decoration: const BoxDecoration(
                    color: Color(0xffEE7814),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18),
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "The pimple has appeared for 1 month and it hasn't healed",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        )),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: widget.responseKonsultasi.statusKonsultasi == "SELESAI"
                ? Text(
                    'Sesi konsultasi dengan Dokter berakhir.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          height: 36,
                          child: Center(
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(8),
                                hintText: 'Ketik Pesan Disini',
                                hintStyle: GoogleFonts.poppins(fontSize: 12),
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0xffE3E3E3)), //<-- SEE HERE
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      width: 1,
                                      color: Color(0xffE3E3E3)), //<-- SEE HERE
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Icon(
                        Icons.send,
                        color: Colors.black54,
                      ),
                    ],
                  )),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(24),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        title: Text(
          'Diagnosa Lanjut',
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Masukkan Diagnosa Lanjutan",
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: PrimaryButton(
              onPressed: () async {
                Navigator.pop(context);
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    Fluttertoast.showToast(
                      toastLength: Toast.LENGTH_SHORT,
                      msg: "Berhasil Delete Criteria",
                      backgroundColor: Colors.white,
                    );
                  },
                );
              },
              text: "Tambah Diagnosis Lanjutan",
            ),
          )
        ],
      );
    },
  );
}
