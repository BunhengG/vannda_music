import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vd_music_player/providers/theme_provider.dart';
import 'package:vd_music_player/screens/home_screen.dart';

import 'providers/playlist_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => PlaylistProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const HomeScreen(),
    );
  }
}
