// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstOnboardPage extends StatelessWidget {
  const FirstOnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              'assets/images/man.jpg',
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: 30,
        ),
        Text(
          '20% Discount \nNew Arrival Product',
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Publish up your selfies to make yourself \nmore beautiful with this app',
          style: GoogleFonts.poppins(),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
