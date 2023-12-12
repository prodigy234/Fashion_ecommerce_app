import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthInputTextField extends StatelessWidget {
  const AuthInputTextField({
    super.key,
    required this.labelText,
    this.suffixIcon,
    this.obscureText,
    required this.controller, this.validate,
    //required String? Function(dynamic name) validate,
  });
  final String labelText;
  final Widget? suffixIcon;
  final String? Function(String?)? validate;
  final bool? obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //You didn't add validator
      validator: validate,
      controller: controller,
      obscureText: obscureText!,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        label: Text(labelText),
        labelStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: const Color.fromRGBO(0, 0, 0, 1),
        ),
      ),
    );
  }
}
