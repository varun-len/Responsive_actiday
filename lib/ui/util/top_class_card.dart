import 'package:actiday/ui/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'custom_text.dart'; // assuming you already created CustomText

class TopClassCard extends StatelessWidget {
  final String image;
  final String title;
  final double rating;
  final String subTitle;
  final String address;
  final VoidCallback? onFavoriteTap;

  const TopClassCard({
    Key? key,
    required this.image,
    required this.title,
    required this.rating,
    required this.subTitle,
    required this.address,
    this.onFavoriteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height:  width > height ? width /2.6 : width/1.5,
      width: width/2.6,
      decoration: BoxDecoration(
        border: Border.all(color:Colors.transparent),
            borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 2,

          ),

        ],
        color: Colors.white
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: width > height ? width / 8.8:width/2.5,
                width: width,
                child: ClipRRect(
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 25,
                top: 25,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                      border: Border.all(color:Colors.transparent)
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: onFavoriteTap,
                      icon: const Icon(
                        Icons.favorite_outline,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                CustomText(
                  text: title,
                  color: Colors.black,
                  fontSize:  width > height ? width * 0.013:width*0.049,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                CustomText(
                  text: rating.toString(),
                  color: Colors.black45,
                ),
                const SizedBox(width: 5),
                SvgPicture.asset(ic_ratingStar),
                const SizedBox(width: 10),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CustomText(
              text: subTitle,
              color: Colors.black45,
              fontSize: width > height ? width * 0.011 : width * 0.039,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: CustomText(
              text: address,
              color: Colors.black45,
              fontSize: width > height ? width * 0.011 : width * 0.039,
            ),
          ),
        ],
      ),
    );
  }
}
