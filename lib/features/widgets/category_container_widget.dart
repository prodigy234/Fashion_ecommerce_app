import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category_ContainerWidget extends StatelessWidget {
  const Category_ContainerWidget({
    super.key,
    required this.icon,
    required this.titleText,
    required this.productNo,
  });

  final IconData icon;
  final String titleText;
  final String productNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 15),
              Text(
                titleText,
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            productNo,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
