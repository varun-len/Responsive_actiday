import 'package:actiday/ui/dashboard/web/homepage_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile/homepage_mobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return HomepageMobile();
      },

      //
      desktop: (BuildContext context) {
        return HomepageWeb();
      },
    );
  }
}