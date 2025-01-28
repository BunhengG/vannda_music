import 'package:flutter/material.dart';
import 'package:vd_music_player/screens/profile_screen.dart';
import 'package:vd_music_player/screens/setting_screen.dart';

import '../auth/auth_service.dart';
import '../constant/theme_builder.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // get auth service
  final authService = AuthService();

  @override
  Widget build(BuildContext context) {
    // get user email
    final userEmail = authService.getUserEmail();

    String userName = userEmail!.split('@').first;

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          // header
          DrawerHeader(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // close pop
                  Navigator.pop(context);

                  // open profile page
                  Navigator.push(
                    context,
                    SlideMaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: const NetworkImage(
                          'https://avatar.iran.liara.run/public/48',
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      userName.toUpperCase(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // body
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25.0),
            child: ListTile(
              title: const Text("H O M E"),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25.0),
            child: ListTile(
              title: const Text("S E T T I N G S"),
              leading: const Icon(Icons.settings),
              onTap: () {
                // close pop
                Navigator.pop(context);

                // open settings page
                Navigator.push(
                  context,
                  SlideMaterialPageRoute(
                    builder: (context) => const SettingScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
