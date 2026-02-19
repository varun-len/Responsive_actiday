import 'package:flutter/material.dart';

import '../../util/Themes/app_colors.dart';
import '../../util/custom_text.dart';

class RatingCard extends StatelessWidget {
  final String text;
  final String rating;
  const RatingCard({super.key, required this.text, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 60,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),border: BoxBorder.all(color: clrPinkAccent)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Center(child: CustomText(text: text)),
                  Icon(Icons.star_border,size: 19,),]
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(rating)
      ],
    );
  }
}
