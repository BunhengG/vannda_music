import 'package:flutter/material.dart';

import '../../themes/theme_builder.dart';

class Intro1 extends StatelessWidget {
  const Intro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 45),
          color: primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(width: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset('assets/images/logo.jpg', height: 200),
                  ),
                  const SizedBox(width: 40),
                  const Column(
                    children: [
                      CustomText(text: 'b'),
                      CustomText(text: 'a'),
                      CustomText(text: 'r'),
                      CustomText(text: 'a'),
                      CustomText(text: 'm'),
                      CustomText(text: 'e'),
                      CustomText(text: 'y'),
                    ],
                  ),
                  const SizedBox(width: 40),
                  const Column(
                    children: [
                      CustomText(text: 'p', fontSize: 24),
                      CustomText(text: 'r', fontSize: 24),
                      CustomText(text: 'd', fontSize: 24),
                      CustomText(text: 'o', fontSize: 24),
                      CustomText(text: 'u', fontSize: 24),
                      CustomText(text: 'c', fontSize: 24),
                      CustomText(text: 't', fontSize: 24),
                      CustomText(text: 'i', fontSize: 24),
                      CustomText(text: 'o', fontSize: 24),
                      CustomText(text: 'n', fontSize: 24),
                      CustomText(text: 's', fontSize: 24),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  textAlign: TextAlign.start,
                  'Baramey started in 2016 as a pioneering music label nurturing the talents of original music stars in Cambodia.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 26,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
