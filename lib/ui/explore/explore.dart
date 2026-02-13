import 'package:actiday/ui/explore/mobile/explore_mobile.dart';
import 'package:actiday/ui/explore/web/explore_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return ExplorePageMobile();
      },

      //
      desktop: (BuildContext context) {
        return ExplorePageWeb();
      },
    );
  }
}