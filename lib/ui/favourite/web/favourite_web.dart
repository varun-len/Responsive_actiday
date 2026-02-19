import 'package:actiday/framework/controller/base_bottom_navbar/bottom_navbar_controller.dart';
import 'package:actiday/framework/controller/favourite_controller/favourite_controller.dart';
import 'package:actiday/framework/controller/home_page_controlller/home_page_conroller.dart';
import 'package:actiday/ui/util/app_constants.dart';
import 'package:actiday/ui/util/widgets/bottom_nav_bar_web.dart';
import 'package:actiday/ui/util/widgets/custom_text.dart';
import 'package:actiday/ui/util/widgets/top_class_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


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
      child: ListView(
        children: [
          (FavouriteController.favourite.isNotEmpty)?GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                image: HomePageController.modelTopClass[itemIndex].image??'',
                title: HomePageController.modelTopClass[itemIndex].title??'',
                rating: HomePageController.modelTopClass[itemIndex].rating?.toDouble()??0.0,
                subTitle:HomePageController.modelTopClass[itemIndex].subTitle??'',
                address: HomePageController.modelTopClass[itemIndex].address??'',
                onFavoriteTap: (){
                  setState(() {

                  });
                },
              );
            },
          ):Wrap(
            children: [
              SizedBox(
                height: 200,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: SizedBox(
                      height: 25,
                      width: 25,
                      child: SvgPicture.asset(
                        "assets/svg/home.svg",
                        color: Colors.black,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  SizedBox(width: 20,child: Icon(Icons.arrow_forward_ios,size: 20,),),
                  SizedBox(width: 7,),
                  CustomText(text:BottomController.bottomList[BottomController.selectedIndex].name??"",fontSize: 20,fontWeight: FontWeight.bold,),
                ],
              ),
              Center(
                child: CustomText(text: str_noFav),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
          ),
          WebFooter()
        ],
      ),
    );
  }
}
