import 'package:fashion_ecommerce_app/features/authentication/auth_screens/login_screen.dart';
import 'package:fashion_ecommerce_app/features/authentication/success_screen.dart';
import 'package:fashion_ecommerce_app/features/widgets/auth_input_text_field_widget.dart';
import 'package:fashion_ecommerce_app/features/widgets/long_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  FirebaseAuth firebaseauth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  signUp() async {
    User? currentUser;
    await firebaseauth
        .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((auth) => currentUser = auth.user)
        .catchError((error) {
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
          content: Text('Signup successful'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SuccessScreen(),
        ),
      );
      setState(() {
        var isLoading = false;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Not signed'),
        ),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
          child: SingleChildScrollView(
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
                          'assets/images/Fashion Nova.png',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Signup',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Create a new account',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AuthInputTextField(
                    validate: (name) {
                      if (name == null || name.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    obscureText: false,
                    labelText: 'User Name',
                    controller: userNameController,
                  ),
                  const SizedBox(height: 30),
                  AuthInputTextField(
                    validate: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!email.contains('@') || !email.contains('')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                    controller: emailController,
                    obscureText: false,
                    labelText: 'Email',
                  ),
                  const SizedBox(height: 30),
                  AuthInputTextField(
                    validate: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Please enter your password';
                      } else if (password.length < 6) {
                        return 'Password must be a minimum of 6 characters';
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: !isPasswordObscure,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isPasswordObscure = !isPasswordObscure;
                        });
                      },
                      child: isPasswordObscure == true
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined),
                    ),
                    labelText: 'Password',
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        signUp();
                      }
                    },
                    child: const LongButtonContainer(
                      buttonName: 'SignUp',
                      buttonColor: Colors.black,
                      buttonTextColor: Colors.amberAccent,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
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
