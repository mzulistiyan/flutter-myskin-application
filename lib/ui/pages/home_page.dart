import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/bloc/pasien/handle_api/pasien_bloc.dart';
import 'package:flutter_application_myskin/bloc/dokter/handle_api/dokter_bloc.dart';
import 'package:flutter_application_myskin/ui/widget/custom_shimmer_home.dart';
import 'package:flutter_application_myskin/ui/widget/primary_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DokterBloc _dokterBloc = DokterBloc();
  final PasienBloc _pasienBloc = PasienBloc();

  @override
  void initState() {
    _dokterBloc.add(GetDokter());
    _pasienBloc.add(GetPasien());
    super.initState();
  }

  int _currentIndex = 0;
  List cardList = [
    Container(
      height: 160,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/image_banner_academy.png',
          ),
        ),
      ),
    ),
    Container(
      height: 160,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/image_banner_academy.png',
          ),
        ),
      ),
    ),
    Container(
      height: 160,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/image_banner_academy.png',
          ),
        ),
      ),
    ),
    Container(
      height: 160,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/image_banner_academy.png',
          ),
        ),
      ),
    ),
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: _currentIndex,
        count: cardList.length,
        effect: const ExpandingDotsEffect(
          dotHeight: 7,
          dotWidth: 7,
          dotColor: Color(0xffD1D1D1),
          activeDotColor: Color(0xffEE7814),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: BlocConsumer<PasienBloc, PasienState>(
        bloc: _pasienBloc,
        listener: (context, state) {
          print('state is $state');
        },
        builder: (context, state) {
          if (state is PasienLoading) {
            return shimmerHomePage(context);
          } else if (state is PasienSuccess) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Hello, ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              state.responseGetPasien.data!.namaPasien!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              softWrap: false,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/icons/icon_profile_default.png',
                          width: 55,
                          height: 55,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 140.0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        aspectRatio: 2.0,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: cardList.map((card) {
                        return Builder(builder: (BuildContext context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.30,
                            width: MediaQuery.of(context).size.width,
                            child: Card(
                              child: card,
                            ),
                          );
                        });
                      }).toList(),
                    ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    // Center(child: buildIndicator()),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Layanan MySkin',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, '/term-condition-page'),
                          child: contentMenu('assets/icons/icon_tes.svg',
                              'Tes Kesehatan\nKulit'),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/konsultasi-page'),
                          child: contentMenu(
                              'assets/icons/icon_konsultasi.svg', 'Konsutasi'),
                        ),
                        contentMenu(
                            'assets/icons/icon_rekam.svg', 'Rekam Medis'),
                        GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, '/transaksi-page'),
                            child: contentMenu(
                                'assets/icons/icon_transaksi.svg',
                                'Transaksi')),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rekomendasi Dokter Kulit',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/dokter-page'),
                          child: Text(
                            'Lihat Semua',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: const Color(0xffEE7814),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocConsumer<DokterBloc, DokterState>(
                      bloc: _dokterBloc,
                      listener: (context, state) {
                        print('state is $state');
                      },
                      builder: (context, state) {
                        if (state is DokterLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is DokterSuccess) {
                          return Expanded(
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount:
                                  state.responseGetDokter.data!.dokter!.length,
                              itemBuilder: (context, index) => Container(
                                height: 80,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    color: const Color(0xffFFFFFF),
                                    border: Border.all(
                                      color: const Color(0xffE3E3E3),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              state.responseGetDokter.data!
                                                  .dokter![index].namaDokter!,
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              state.responseGetDokter.data!
                                                  .dokter![index].rumahSakit!,
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
                            ),
                          );
                        } else if (state is DokterError) {
                          return Container(
                              width: double.infinity,
                              height: 50,
                              alignment: Alignment.center,
                              color: Colors.transparent,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: PrimaryButton(
                                text: 'Reload',
                                onPressed: () {
                                  _dokterBloc.add(GetDokter());
                                },
                              ));
                        }
                        return const SizedBox();
                      },
                    )
                  ],
                ),
              ),
            );
          } else if (state is PasienError) {
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
          return const SizedBox();
        },
      ),
    );
  }

  Widget contentMenu(String image, String label) {
    return Column(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: const BoxDecoration(
            color: Color(0xffEE7814),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(image),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 30,
          child: Text(
            label,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: const Color(0xff878889),
            ),
          ),
        )
      ],
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.3,
              1
            ],
            colors: [
              Color(0xffff4000),
              Color(0xffffcc66),
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.3,
              1
            ],
            colors: [
              Color(0xffff4000),
              Color(0xffffcc66),
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.3,
              1
            ],
            colors: [
              Color(0xffff4000),
              Color(0xffffcc66),
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.3,
              1
            ],
            colors: [
              Color(0xffff4000),
              Color(0xffffcc66),
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text("Data",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
