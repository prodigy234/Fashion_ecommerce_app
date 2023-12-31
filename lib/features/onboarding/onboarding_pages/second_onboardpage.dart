import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondOnboardPage extends StatelessWidget {
  const SecondOnboardPage({super.key});

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
              'assets/images/lady.jpg',
              fit: BoxFit.cover,
            )),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Take Advantage \nOf The Offer Shopping',
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'We offer the best shopping packages you can expect \nHurry and take advantage of it',
          style: GoogleFonts.poppins(),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
