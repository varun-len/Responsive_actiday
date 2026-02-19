import 'package:flutter/material.dart';
import '../Themes/app_colors.dart';
import 'custom_text.dart';


class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: clr000000,
      child: Center(
        child: Wrap(
          children:[Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(
                text: "copyright 2020 - 22 Dreamplug Technologies Pvt Ltd.",
                color: clr576464,
                fontWeight: FontWeight.bold,
              ),
              CustomText(
                text: "privacy policy | terms and conditions | returns and refunds",
                color:clr576464,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),],
        ),
      ),
    );
  }
}