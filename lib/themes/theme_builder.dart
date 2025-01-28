import 'package:flutter/material.dart';

const primaryColor = Color(0xFF232531);
const secondaryColor = Color(0xFF333645);
const thirdColor = Color(0xFF1F509A);
const titleColor = Color(0xFFFFFFFF);
const descColor = Color(0xFFEEEEEE);

class SlideMaterialPageRoute<T> extends MaterialPageRoute<T> {
  SlideMaterialPageRoute({required super.builder, super.settings});

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}
