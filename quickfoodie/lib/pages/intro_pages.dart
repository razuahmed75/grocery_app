// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:myapp/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 160, left: 80, right: 80, bottom: 40),
            child: Image.asset("assets/images/avocado.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text('''We deliver 
 groceries at your 
doorstep''',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Text(
              '''
Groceer gives your fresh vegetables and fruits. 
    Order fresh items from groceries
                         ''',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                  color: Colors.grey[600], height: 1.5, fontSize: 16),
            ),
          ),
          Spacer(),
          InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              final Route route =
                  MaterialPageRoute(builder: ((context) => HomePage()));
              Navigator.pushReplacement(context, route);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(40)),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  left: 35,
                  right: 35,
                ),
                child: Text(
                  "Get Started",
                  style: GoogleFonts.robotoMono(color: Colors.white),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
