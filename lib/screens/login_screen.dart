import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vd_music_player/components/neu_box.dart';

import '../auth/auth_service.dart';
import '../constant/theme_builder.dart';
import '../widget/appBarWidget.dart';
import '../widget/buttonWidget.dart';
import '../widget/textFieldWidget.dart';
import 'register_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // get auth service
  final authService = AuthService();

  // text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // login button pressed
  void login() async {
    // prepare data
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      // show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'Please fill in all fields',
            style: TextStyle(color: Theme.of(context).colorScheme.surface),
          ),
        ),
      );
      return;
    }

    // attempt login
    try {
      await authService.signInWithEmailPassword(email, password);
    } catch (e) {
      if (mounted) {
        // show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              // 'Error $e',
              'Oops! Something went wrong. Please try again.',
              style: TextStyle(color: Theme.of(context).colorScheme.surface),
            ),
          ),
        );
      }
    }
  }

  // Build UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const CustomAppBar(title: 'S I G N  I N'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 16.0,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: NeuBox(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              children: [
                LottieBuilder.network(
                  'https://lottie.host/c8d23eef-b488-4c91-919c-54e744887c1f/hO34SOYiSY.json',
                  width: 120,
                  height: 90,
                  fit: BoxFit.contain,
                  reverse: true,
                  alignment: Alignment.center,
                  repeat: true,
                ),
                const SizedBox(height: 25),

                // email
                CustomTextField(
                  labelText: "Email",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  leadingIcon: const Icon(
                    Icons.email_rounded,
                    size: 22,
                  ),
                ),
                const SizedBox(height: 16),
                // password
                CustomTextField(
                  labelText: "Password",
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  leadingIcon: const Icon(
                    Icons.lock,
                    size: 22,
                  ),
                ),

                const SizedBox(height: 25),
                // button
                CustomElevatedButton(
                  text: 'Sign in',
                  onPressed: login,
                  backgroundColor: thirdColor,
                  textColor: titleColor,
                  fontSize: 14.0,
                ),
                const SizedBox(height: 12),
                // go to register page to sign up
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Dont't have an account? Sign Up",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
