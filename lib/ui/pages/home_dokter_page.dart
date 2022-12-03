import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/dokter/bloc/update_status_konsultasi_bloc.dart';
import 'package:flutter_application_myskin/bloc/dokter/event/logout_event.dart';
import 'package:flutter_application_myskin/bloc/dokter/handle_api/consults_dokter_bloc.dart';
import 'package:flutter_application_myskin/bloc/dokter/handle_api/logout_bloc.dart';
import 'package:flutter_application_myskin/bloc/dokter/handle_api/profile_dokter_bloc.dart';
import 'package:flutter_application_myskin/model/dokter/response_status_konsultasi.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/login_page.dart';
import 'package:flutter_application_myskin/ui/widget/CustomTooltipShape.dart';
import 'package:flutter_application_myskin/ui/widget/custom_pop_loading.dart';
import 'package:flutter_application_myskin/ui/widget/custom_shimmer_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDokterPage extends StatefulWidget {
  const HomeDokterPage({super.key});

  @override
  State<HomeDokterPage> createState() => _HomeDokterPageState();
}

class _HomeDokterPageState extends State<HomeDokterPage> {
  final LogoutDokterBloc _logoutDokterBloc = LogoutDokterBloc();
  final UpdateStatusKonsultasiBloc _updateStatusKonsultasiBloc =
      UpdateStatusKonsultasiBloc();

  bool? _value1 = false;
  bool pending = false;
  bool selesai = false;
  bool batal = false;
  bool varl = false;
  final ProfileDokterBloc _profileDokterBloc = ProfileDokterBloc();
  final ConsultsDokterBloc _consultsDokterBloc = ConsultsDokterBloc();

  @override
  void initState() {
    _consultsDokterBloc.add(GetConsultsDokterDokter());
    _profileDokterBloc.add(GetProfileDokter());
    super.initState();
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear().then((value) {
      if (value) {
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return const LoginPage();
        }), (Route<dynamic> route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _showDialogLogout() {
      Widget cancelButton = TextButton(
        child: const Text("Tidak"),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
      );
      Widget continueButton = TextButton(
        child: const Text("Ya"),
        onPressed: () async {
          _logoutDokterBloc.add(DokterLogout());
          await Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context, rootNavigator: true).pop();
            _logout();
          });
        },
      );
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: const Text("Keluar"),
        content: Text(
          "Anda yakin ingin keluar?",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          cancelButton,
          continueButton,
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<ProfileDokterBloc, ProfileDokterState>(
        bloc: _profileDokterBloc,
        listener: (context, state) {
          print('state is $state');
        },
        builder: (context, state) {
          if (state is ProfileDokterLoading) {
            return Center(
              child: shimmerProfilePage(context),
            );
          } else if (state is ProfileDokterSuccess) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/icon_dokter.png',
                                width: 80,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dr. ${state.responseDokter.data!.namaDokter!} Sp.KK',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Rs. ${state.responseDokter.data!.rumahSakit!}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 2,
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
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/icons/icon_progress.png',
                                        width: 10,
                                        height: 10,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '100%',
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: const Color(0xffEE7814),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Proyek Terselesaikan',
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 25, //set desired REAL HEIGHT
                                    width: 45, //set desired REAL WIDTH
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                            color: _value1!
                                                ? Colors.transparent
                                                : const Color(0xffE3E3E3)),
                                        color: _value1!
                                            ? const Color(0xff2CC069)
                                            : const Color(0xffEFF1F1)),
                                    child: Transform.scale(
                                      transformHitTests: false,
                                      scale: .6,
                                      child: CupertinoSwitch(
                                        value: _value1!,
                                        activeColor: const Color(0xff2CC069),
                                        trackColor: const Color(0xffEFF1F1),
                                        thumbColor: CupertinoColors.white,
                                        onChanged: (v) => setState(() {
                                          _value1 = v;
                                        }),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          PopupMenuButton(
                            offset: const Offset(0, 50),
                            shape: const TooltipShape(),
                            onSelected: (result) {
                              if (result == 2) {
                                showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) {
                                    return _showDialogLogout();
                                  },
                                );
                              } else if (result == 1) {
                                Navigator.pushNamed(
                                    context, '/ganti-kata-sandi-page');
                              }
                            },
                            icon: const Icon(
                              Icons.more_horiz,
                              size: 30,
                            ),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: 0,
                                  child: Text(
                                    'Edit Profile',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 1,
                                  child: Text(
                                    'Ganti kata Sandi',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 2,
                                  child: Text(
                                    'Keluar',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Divider(
                      thickness: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pasien Konsultasi',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Daftar Penerimaan Pasien',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 15),
                          TextField(
                            onChanged: (v) {},
                            decoration: InputDecoration(
                              filled: true,
                              isDense: true, // Added this
                              contentPadding: const EdgeInsets.all(8),
                              prefixIcon:
                                  const Icon(Icons.search), // Added this
                              hintText: 'Cari Pasien',
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
                          Padding(
                            padding: const EdgeInsets.only(top: 16, bottom: 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (!pending) {
                                          pending = true;
                                        } else {
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
                                        } else {
                                          selesai = false;
                                        }
                                      });
                                    },
                                    child: filterTab(selesai, "Berjalan ", 20),
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
                                    child: filterTab(batal, "Selesai ", 20),
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
                          BlocConsumer<ConsultsDokterBloc, ConsultsDokterState>(
                            bloc: _consultsDokterBloc,
                            listener: (context, stateList) {
                              // TODO: implement listener
                            },
                            builder: (context, stateList) {
                              if (stateList is ConsultsDokterLoading) {
                              } else if (stateList is ConsultsDokterSuccess) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      stateList.responseDokter.data!.length,
                                  itemBuilder: (context, index) => Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFAFAFA),
                                        border: Border.all(
                                            color: const Color(0xffDADADA),
                                            width: 0.4),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/icons/icon-pasien-dokter.svg',
                                              width: 50,
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Ahamad Saepul',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                Text(
                                                  'Herpes',
                                                  style: GoogleFonts.poppins(
                                                    color:
                                                        const Color(0xff999999),
                                                    fontSize: 9,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        if (stateList
                                                .responseDokter
                                                .data![index]
                                                .statusKonsultasi ==
                                            "BERKONSULTASI")
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.chat,
                                              color: Color(0xffEE7814),
                                            ),
                                          )
                                        else
                                          BlocConsumer<
                                              UpdateStatusKonsultasiBloc,
                                              UpdateStatusKonsultasiState>(
                                            bloc: _updateStatusKonsultasiBloc,
                                            listener: (context, state) {
                                              print(
                                                  'state is from UpdatePRofileBloc: $state');
                                              if (state
                                                  is UpdateStatusKonsultasiLoading) {
                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop();
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) {
                                                    Future.delayed(
                                                        Duration(seconds: 1),
                                                        () {
                                                      Navigator.of(context)
                                                          .pop(true);
                                                    });
                                                    return const PopLoading();
                                                  },
                                                );
                                              } else if (state
                                                  is UpdateStatusKonsultasiSuccess) {
                                                _consultsDokterBloc.add(
                                                    GetConsultsDokterDokter());
                                                // Fluttertoast.showToast(
                                                //   msg:
                                                //       'Data berhasil terupdate',
                                                //   backgroundColor:
                                                //       const Color(0xffEE7814),
                                                //   textColor: Colors.white,
                                                //   gravity:
                                                //       ToastGravity.CENTER,
                                                // );
                                                // Future.delayed(
                                                //     Duration(seconds: 3));
                                                // Navigator.pop(context);
                                              }

                                              if (state
                                                  is UpdateStatusKonsultasiError) {
                                                // Fluttertoast.showToast(
                                                //     msg: responseUpdatePasienToJson(
                                                //         state
                                                //             .responseUpdatePasien));
                                              }
                                            },
                                            builder: (context, state) {
                                              return Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        barrierDismissible:
                                                            true,
                                                        context: context,
                                                        builder: (context) {
                                                          return _showDialogKonfirmasi(
                                                              stateList
                                                                  .responseDokter
                                                                  .data![index]
                                                                  .id);
                                                        },
                                                      );
                                                    },
                                                    icon:
                                                        const Icon(Icons.close),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      showDialog(
                                                        barrierDismissible:
                                                            true,
                                                        context: context,
                                                        builder: (context) {
                                                          return _showDialogKonfirmasi(
                                                              stateList
                                                                  .responseDokter
                                                                  .data![index]
                                                                  .id);
                                                        },
                                                      );
                                                    },
                                                    icon: const Icon(
                                                      Icons.check,
                                                      color: Color(0xffEE7814),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          )
                                      ],
                                    ),
                                  ),
                                );
                              } else if (state is ConsultsDokterError) {}
                              return const SizedBox();
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ProfileDokterError) {
            return Container();
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _showDialogKonfirmasi(int? konsultasi) {
    Widget cancelButton = TextButton(
      child: const Text("Tidak"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Ya"),
      onPressed: () {
        _updateStatusKonsultasiBloc.add(UpdateStatusKonsultasiPost(
          statusKonsultasi: 'BERKONSULTASI',
          id: konsultasi!,
        ));
      },
    );
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: const Text("Konfirmasi"),
      content: Text(
        "Anda yakin ingin terima pasien?",
        style: GoogleFonts.poppins(),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }

  Widget _showDialogDecline(int? id) {
    Widget cancelButton = TextButton(
      child: const Text("Tidak"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Ya"),
      onPressed: () {
        _updateStatusKonsultasiBloc.add(UpdateStatusKonsultasiPost(
          statusKonsultasi: 'BERKONSULTASI',
          id: id!,
        ));
      },
    );
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: const Text("Konfirmasi"),
      content: Text(
        "Anda yakin ingin tolak pasien?",
        style: GoogleFonts.poppins(),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }

  Widget filterTab(bool cek, String name, int jml) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.5),
      decoration: BoxDecoration(
          color: !cek ? Colors.white : const Color(0xffEE7814).withOpacity(0.2),
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
}
