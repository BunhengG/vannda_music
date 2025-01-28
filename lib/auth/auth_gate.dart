/*

? This file remain to continuously listen for auth state changes.

if - Unauthenticated -> Login Page
else - authenticated -> Profile Page

*/

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vd_music_player/screens/home_screen.dart';

import '../screens/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // Listen to auth state changes
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        // loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }

        // check if there a valid session currently
        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null) {
          return const HomeScreen();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
