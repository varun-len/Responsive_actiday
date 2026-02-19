import 'package:actiday/framework/controller/booking_page_controller/booking_page_controller.dart';
import 'package:actiday/ui/bookingdetails/mobile/booking_detail_mobile.dart';
import 'package:actiday/ui/util/widgets/booking_card.dart';
import 'package:flutter/material.dart';

Widget upcomingCards(int index, bool isUpcoming,BuildContext context) {
  return InkWell(
    onTap: (){
      print(BookingPageController.modelUpcoming[index].status);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookingDetailMobile(title: BookingPageController.modelUpcoming[index].title ?? '', status:BookingPageController.modelUpcoming[index].status??'',isUpcoming:isUpcoming,index:index,)));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: BookingCard(
        index: index,
        image: BookingPageController.modelUpcoming[index].image ?? '',
        title: BookingPageController.modelUpcoming[index].title ?? '',
        credit:
        BookingPageController.modelUpcoming[index].credit?.toDouble() ?? 0.0,
        status: BookingPageController.modelUpcoming[index].status,
      ),
    ),
  );
}