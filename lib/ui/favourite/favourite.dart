import 'package:actiday/ui/favourite/mobile/favourite_mobile.dart';
import 'package:actiday/ui/favourite/web/favourite_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return FavouritePageMobile();
      },

      //
      desktop: (BuildContext context) {
        return FavouritePageWeb();
      },
    );
  }
}