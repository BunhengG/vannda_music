import 'package:flutter/material.dart';
import '../auth/auth_service.dart';
import '../themes/theme_builder.dart';
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
            backgroundColor: Colors.red,
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
            backgroundColor: Colors.red,
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

    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 16.0,
            ),
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/logo.jpg',
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "S I G N U P",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // email
                CustomTextField(
                  labelText: "Email",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  leadingIcon: const Icon(
                    Icons.email_rounded,
                    color: Colors.red,
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
                    color: Colors.red,
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
                    color: Colors.red,
                    size: 22,
                  ),
                ),

                const SizedBox(height: 25),
                // button
                CustomElevatedButton(
                  text: 'Sign Up',
                  onPressed: signUp,
                  fontSize: 14.0,
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    SlideMaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.redAccent,
                          ),
                        ),
                      ],
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
