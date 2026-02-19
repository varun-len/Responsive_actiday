import 'package:flutter/material.dart';
import 'custom_text.dart'; // your CustomText widget

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final double? heightFactor; // fraction of screen width for height
  final double? widthFactor;  // fraction of screen width for width

  const CategoryCard({
    Key? key,
    required this.image,
    required this.title,
    this.heightFactor = 8,   // default: screenWidth / 8
    this.widthFactor = 2.45, // default: screenWidth / 2.29
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: screenWidth / heightFactor!,
          width: screenWidth / widthFactor!,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueAccent,
          ),
          child: Image.network(
            image,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 10,
          left: 30,
          child: CustomText(
            text: title,
            fontSize: screenWidth > screenHeight ? screenWidth* 0.023:screenWidth*0.027, // responsive text size
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade100,
          ),
        ),
      ],
    );
  }
}
