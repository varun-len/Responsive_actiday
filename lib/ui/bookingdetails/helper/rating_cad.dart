import 'package:actiday/ui/util/Themes/app_colors.dart';
import 'package:actiday/ui/util/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class RatingCard extends StatelessWidget {
  final String text;
  final String rating;
  final int colorRatingIndex;
  final int index;
  const RatingCard({super.key, required this.text, required this.rating, required this.colorRatingIndex, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 60,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),border:BoxBorder.all(color: (index<colorRatingIndex)?clrPinkAccent:clrBlack45)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Center(child: CustomText(text: text)),
                  Icon(Icons.star_border,size: 19,color: (index<colorRatingIndex)?clrPinkAccent:clrBlack45),]
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
