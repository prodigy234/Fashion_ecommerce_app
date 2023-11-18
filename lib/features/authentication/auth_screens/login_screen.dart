import 'package:fashion_ecommerce_app/features/widgets/auth_input_text_field_widget.dart';
import 'package:fashion_ecommerce_app/features/widgets/long_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset(
                    'assets/images/Fashion Nova.png',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Welcome',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Pls login or Signup to continue',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            AuthInputTextField(
              controller: emailController,
              obscureText: false,
              labelText: 'Email',
            ),
            const SizedBox(height: 30),
            AuthInputTextField(
              controller: passwordController,
              obscureText: true,
              suffixIcon: const Icon(Icons.visibility_outlined),
              labelText: 'Password',
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                debugPrint(emailController.text);
                debugPrint(passwordController.text);
              },
              child: const LongButtonContainer(
                buttonName: 'Login',
                buttonColor: Colors.black,
                buttonTextColor: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 1,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                const Text('Or'),
                Container(
                  height: 1,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const LongButtonContainer(
              buttonName: 'Continue with Facebook',
              icon: Icons.facebook_outlined,
              buttonColor: Colors.blue,
              buttonTextColor: Colors.white,
            ),
            const SizedBox(height: 10),
            const LongButtonContainer(
              buttonName: 'Continue with Google',
              buttonColor: Colors.white,
              buttonTextColor: Colors.black,
            ),
            const SizedBox(height: 20),
            const LongButtonContainer(
              buttonName: 'Continue with Apple',
              buttonColor: Colors.transparent,
              buttonTextColor: Colors.black,
            ),
          ],
        ),
      )),
    );
  }
}
