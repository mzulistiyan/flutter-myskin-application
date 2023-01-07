import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/pasien/handle_api/checkout_bloc.dart';
import 'package:flutter_application_myskin/ui/pages/dokter/pembayaran_page.dart';
import 'package:flutter_application_myskin/ui/pages/transaksi/transaksi_page.dart';
import 'package:flutter_application_myskin/ui/widget/custom_pop_loading.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../model/dokter/response_dokter.dart';

class CheckoutPage extends StatefulWidget {
  Dokter? dokter;
  CheckoutPage({required this.dokter, super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final CheckoutBloc _checkoutBloc = CheckoutBloc();
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xffEE7814),
        title: Text(
          'Checkout',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                            widget.dokter!.namaDokter!,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            widget.dokter!.rumahSakit!,
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
                ],
              ),
            ),
            const Divider(height: 2, thickness: 2, color: Color(0xffF0EFEF)),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp 100.000',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        'Rp 100.000',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff7C7C7D),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Rp 100.000',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocConsumer<CheckoutBloc, CheckoutState>(
        bloc: _checkoutBloc,
        listener: (context, state) {
          print('state is: ${state}');
          if (state is CheckoutLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return const PopLoading();
              },
            );
          } else if (state is CheckoutSuccess) {
            print("Payment URL : ${state.responseCheckout.data!.paymentUrl}");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebViewExample(
                  url: state.responseCheckout.data!.paymentUrl,
                ),
              ),
            );

            // Navigator.pop(context);
            // showDialog<String>(
            //   context: context,
            //   builder: (BuildContext context) => AlertDialog(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     content: Container(
            //       height: 85,
            //       child: Column(
            //         children: [
            //           const Icon(
            //             Icons.check_circle_outlined,
            //             color: Colors.green,
            //             size: 40,
            //           ),
            //           const SizedBox(
            //             height: 15,
            //           ),
            //           Text(
            //             'Daftar Berhasil',
            //             style: GoogleFonts.poppins(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w700,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // );
          }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top:
                    BorderSide(width: 1.0, color: Colors.grey.withOpacity(0.7)),
              ),
            ),
            height: 100,
            child: Center(
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: PrimaryButton(
                  onPressed: () {
                    _checkoutBloc.add(
                      CheckoutPost(
                        idDokter: widget.dokter!.idDokter!,
                        diagnosaSementara: "Cacar",
                      ),
                    );
                  },
                  text: 'Checkout',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
