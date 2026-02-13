import 'package:actiday/ui/booking/mobile/bookingpage_mobile.dart';
import 'package:actiday/ui/booking/web/bookingpage_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

  class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        return BookingpageMobile();
      },

      //
      desktop: (BuildContext context) {
        return BookingpageWeb();
      },
    );
  }
}