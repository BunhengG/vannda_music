import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../auth/auth_service.dart';
import '../components/neu_box.dart';
import '../constant/theme_builder.dart';
import '../widget/appBarWidget.dart';
import '../widget/buttonWidget.dart';
import '../widget/textFieldWidget.dart';
import 'login_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    // get auth service
    final authService = AuthService();

    // text controller
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    void signUp() async {
      // prepare data
      final email = emailController.text;
      final password = passwordController.text;
      final confirmPassword = confirmPasswordController.text;

      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        // show error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              'Please fill in all fields',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        return;
      }

      // check that passwords match
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              'Passwords do not match',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
        return;
      }
      // attempt login
      try {
        await authService.signUpWithEmailPassword(email, password);

        // pop this register page
        Navigator.pop(context);
      } catch (e) {
        if (mounted) {
          // show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error $e'),
            ),
          );
        }
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: const CustomAppBar(title: 'S I G N U P'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 16.0,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: NeuBox(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              children: [
                LottieBuilder.network(
                  'https://lottie.host/c8d23eef-b488-4c91-919c-54e744887c1f/hO34SOYiSY.json',
                  width: 160,
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
                  controller: emailController,
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
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  leadingIcon: const Icon(
                    Icons.lock,
                    size: 22,
                  ),
                ),
                const SizedBox(height: 16),

                // confirm password
                CustomTextField(
                  labelText: "Password",
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  leadingIcon: const Icon(
                    Icons.lock,
                    size: 22,
                  ),
                ),

                const SizedBox(height: 16),
                // button
                CustomElevatedButton(
                  text: 'Sign Up',
                  onPressed: signUp,
                  backgroundColor: thirdColor,
                  textColor: titleColor,
                  fontSize: 14.0,
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Already have an account? Sign In",
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
