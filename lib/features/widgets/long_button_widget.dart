import 'package:flutter/material.dart';

class LongButtonContainer extends StatelessWidget {
  const LongButtonContainer({
    required this.buttonName,
    this.buttonColor,
    this.buttonBorder,
    this.buttonTextColor,
    super.key,
    this.icon,
  });
  final String buttonName;
  final Color? buttonColor;
  final Border? buttonBorder;
  final Color? buttonTextColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 350,
      decoration: BoxDecoration(
        color: buttonColor,
        border: buttonBorder,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            buttonName,
            style: TextStyle(
                fontSize: 14,
                color: buttonTextColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
