import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/onboarding_page_1.dart';
import 'package:flutter_application_myskin/ui/pages/onboarding/onboarding_page_3.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onboarding_page_2.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controllerSlide = CarouselController();

  int currentIndex = 0;
  int activeIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List imgList = [
      const OnBoarding1Page(),
      const OnBoarding2Page(),
      const OnBoarding3Page()
    ];

    void next() => controllerSlide.nextPage(
            duration: const Duration(
          milliseconds: 300,
        ));
    void back() => controllerSlide.previousPage(
            duration: const Duration(
          milliseconds: 300,
        ));

    Widget buildButtonBack() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: activeIndex > 0 ? back : () {},
              child: Icon(
                Icons.arrow_back_sharp,
                size: 36,
                color:
                    activeIndex > 0 ? Colors.transparent : Colors.transparent,
              ),
            )
          ],
        );

    Widget buildButtons() => Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                  color: const Color(0xffEE7814),
                  borderRadius: BorderRadius.circular(8)),
              child: TextButton(
                onPressed: () {
                  activeIndex == 2
                      ? Navigator.pushNamedAndRemoveUntil(
                          context, '/login-page', (route) => false)
                      : next();
                },
                child: Center(
                  child: Text(
                    activeIndex == 2 ? 'Masuk' : 'Selanjutnya',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );

    Widget buildButtonsDaftar() => Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/login-page', (route) => false),
              child: Center(
                child: Text(
                  'Lewati',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );

    Widget buildIndicator() => AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: imgList.length,
          effect: const WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: Color(0xffD1D1D1),
            activeDotColor: Colors.orange,
          ),
        );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          buildButtonBack(),
          CarouselSlider.builder(
              carouselController: controllerSlide,
              itemCount: imgList.length,
              options: CarouselOptions(
                initialPage: 0,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                viewportFraction: 1,
                height: double.infinity,
              ),
              itemBuilder: (context, index, realIndex) {
                return imgList[index];
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32),
              height: 120,
              child: Column(
                children: [
                  Center(child: buildIndicator()),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: buildButtons(),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Center(
                    child: buildButtonsDaftar(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
