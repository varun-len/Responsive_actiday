import 'package:actiday/framework/controller/favourite_controller/favourite_controller.dart';
import 'package:actiday/framework/controller/home_page_controlller/home_page_conroller.dart';
import 'package:actiday/ui/util/top_class_card.dart';
import 'package:flutter/material.dart';

class FavouritePageWeb extends StatefulWidget {
  const FavouritePageWeb({super.key});

  @override
  State<FavouritePageWeb> createState() => _FavouritePageWebState();
}

class _FavouritePageWebState extends State<FavouritePageWeb> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        childAspectRatio: 11 / 8,
      ),
          itemCount: FavouriteController.favourite.length,
          shrinkWrap: true,
          itemBuilder :(context, index) {
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
      ),
    );
  }
}
