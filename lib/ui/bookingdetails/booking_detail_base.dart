import 'package:actiday/ui/bookingdetails/web/booking_detail_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'mobile/booking_detail_mobile.dart';

class BookingDetailScreen extends StatelessWidget {
  final int index;
  final String title;
  final String status;
  final bool isUpcoming;
  const BookingDetailScreen({super.key,required this.title,required this.status,required this.isUpcoming, required this.index,});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) {
        print(index);
        return BookingDetailMobile(title: title,status: status,isUpcoming:isUpcoming, index:index,);
      },

      //
      desktop: (BuildContext context) {
        return BookingDetailWeb(title: title,status: status,isUpcoming:isUpcoming, index:index,);
      },
    );
  }
}