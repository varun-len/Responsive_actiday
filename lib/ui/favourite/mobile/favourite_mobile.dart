import 'package:actiday/framework/controller/favourite_controller/favourite_controller.dart';
import 'package:actiday/framework/controller/home_page_controlller/home_page_conroller.dart';
import 'package:actiday/ui/util/top_class_card.dart';
import 'package:flutter/material.dart';

class FavouritePageMobile extends StatefulWidget {
  const FavouritePageMobile({super.key});

  @override
  State<FavouritePageMobile> createState() => _FavouritePageMobileState();
}

class _FavouritePageMobileState extends State<FavouritePageMobile> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: FavouriteController.favourite.length,
      itemBuilder: (context, index) {
        int itemIndex=FavouriteController.favourite[index];
        return TopClassCard(
                index:itemIndex,
                image: modelTopClass[itemIndex].image??'',
                title: modelTopClass[itemIndex].title??'',
                rating: modelTopClass[itemIndex].rating?.toDouble()??0.0,
                subTitle:modelTopClass[itemIndex].subTitle??'',
                address: modelTopClass[itemIndex].address??'',
          onFavoriteTap: (){
                  setState(() {

                  });
          },
              );
      },
    );
  }
}
