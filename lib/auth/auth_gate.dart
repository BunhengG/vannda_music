/*

? This file remain to continuously listen for auth state changes.

if - Unauthenticated -> Login Page
else - authenticated -> Profile Page

*/

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vd_music_player/screens/home_screen.dart';
import '../intro/onborading_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  // Stream to listen to auth changes
  late final Stream<AuthState> authStateStream;

  @override
  void initState() {
    super.initState();
    authStateStream = Supabase.instance.client.auth.onAuthStateChange;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthState>(
      stream: authStateStream,
      builder: (context, snapshot) {
        // Show loading spinner while waiting for the stream
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // Check current session directly
        final session = Supabase.instance.client.auth.currentSession;

        // Navigate based on session state
        if (session != null) {
          return const HomeScreen();
        } else {
          return const OnboardingScreen();
        }
      },
    );
  }
}
