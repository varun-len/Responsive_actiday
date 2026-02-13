import 'package:actiday/ui/base/mobile/base_mobile.dart';
import 'package:actiday/ui/base/web/base_web.dart';
import 'package:actiday/ui/favourite/mobile/favourite_mobile.dart';
import 'package:actiday/ui/favourite/web/favourite_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return BaseMobile();
      },

      //
      desktop: (BuildContext context) {
        return BaseWeb();
      },
    );
  }
}