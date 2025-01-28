import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vd_music_player/providers/theme_provider.dart';

class NeuBox extends StatelessWidget {
  final Widget child;

  const NeuBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // is dark mode
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: isDarkMode ? Colors.black87 : Colors.grey.shade500,
            blurRadius: 16,
            offset: const Offset(-4, -4),
          ),
          BoxShadow(
            color: isDarkMode ? Colors.grey.shade800 : Colors.white,
            blurRadius: 16,
            offset: const Offset(4, 4),
          )
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(15),
      child: child,
    );
  }
}
