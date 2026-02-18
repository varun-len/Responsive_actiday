import 'package:flutter/material.dart';

import '../../../framework/controller/booking_page_controller/booking_page_controller.dart';
import '../../bookingdetails/mobile/booking_detail_mobile.dart';
import '../../util/app_constants.dart';
import '../../util/booking_card.dart';

Widget upcomingCards(int index, bool isUpcoming,BuildContext context) {
  return InkWell(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookingDetailMobile(title: ' ', status: ' ',isUpcoming:true,index:0,)));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: BookingCard(
        index: index,
        image: BookingPageController.modelUpcoming[index].image ?? '',
        title: BookingPageController.modelUpcoming[index].title ?? '',
        credit:
        BookingPageController.modelUpcoming[index].credit?.toDouble() ?? 0.0,
        status: str_Upcoming,
      ),
    ),
  );
}