import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7FC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Dr. Mohamad Zulistiyan Sp.KK',
          style: GoogleFonts.poppins(
            fontSize: 16,
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
            )
          ],
        )),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(12),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.add,
                color: Colors.black54,
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
          ),
        ),
      ),
    );
  }
}