import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class RattingPopUp extends StatelessWidget {
  const RattingPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 24,
        ),
        child: Container(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Rate your experience',
                style: GoogleFonts.poppins(
                  color: const Color(0xffEE7814),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'How would you rate\nDr. Mohamad Zulistiyan?',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(),
              ),
              const SizedBox(
                height: 16,
              ),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/main-page');
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xffEE7814),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
