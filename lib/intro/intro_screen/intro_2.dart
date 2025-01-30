import 'package:flutter/material.dart';

import '../../themes/theme_builder.dart';

class Intro2 extends StatelessWidget {
  const Intro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 25),
          color: primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(width: 30),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset('assets/images/ceo.jpg', height: 320),
                  ),
                  const SizedBox(width: 35),
                  const Column(
                    children: [
                      CustomText(text: 'l'),
                      CustomText(text: 'a'),
                      CustomText(text: 'u'),
                      CustomText(text: 'r'),
                      CustomText(text: 'a'),
                      CustomText(text: 'm'),
                      CustomText(text: 'a'),
                      CustomText(text: 'm'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 26),
              const Padding(
                padding: EdgeInsets.only(left: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'O u r C E O ',
                      fontSize: 22,
                    ),
                    Text(
                      ' of TEDxAbdulCarimeSt',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  textAlign: TextAlign.start,
                  'I am honor to be on TEDxAbdulCarimeSt and talk about "How music revolution changes Cambodia narrative". Thank for allowing me this opportunity to share...',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
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
