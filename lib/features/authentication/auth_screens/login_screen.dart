// ignore_for_file: use_build_context_synchronously

import 'package:fashion_ecommerce_app/features/authentication/auth_screens/sign_up_screen.dart';
import 'package:fashion_ecommerce_app/features/screens/category_screen.dart';
import 'package:fashion_ecommerce_app/features/services/auth_service.dart';
import 'package:fashion_ecommerce_app/features/widgets/auth_input_text_field_widget.dart';
import 'package:fashion_ecommerce_app/features/widgets/long_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  FirebaseAuth firebaseauth = FirebaseAuth.instance;

  login() async {
    User? currentUser;

    await firebaseauth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((auth) {
      currentUser = auth.user;
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(error.toString()),
        ),
      );
    });
    if (currentUser != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Login successful'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomnavScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Not logged in'),
        ),
      );
    }
  }

  bool isObscure = true;

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            //You didn't wrap the Column with Form and add the _formKey
            child: Form(
              key: _formKey,
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
                          'assets/images/Logo.png',
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
                    validate: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!email.contains('@') || !email.contains('.')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  AuthInputTextField(
                    controller: passwordController,
                    obscureText: isObscure,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: isObscure == true
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined),
                    ),
                    labelText: 'Password',
                    validate: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Please enter your password';
                      } else if (password.length < 6) {
                        return 'Password must be a minimum of 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        // setState(() {
                        //   isLoading = true;
                        // });
                        // AuthService()
                        //     .login(
                        //   email: emailController.text.trim(),
                        //   password: passwordController.text.trim(),
                        // )
                        //     .then((value) {
                        //   setState(() {
                        //     isLoading = false;
                        //   });
                        // });
                      }
                      login();
                    },
                    child: LongButtonContainer(
                      buttonName: isLoading == true ? 'Loading...' : 'Login',
                      buttonColor: Colors.black,
                      buttonTextColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignupScreen()));
                          },
                          child: Text(
                            "Sign up",
                            style: GoogleFonts.poppins(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
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
            ),
          ),
        ),
      ),
    );
  }
}
