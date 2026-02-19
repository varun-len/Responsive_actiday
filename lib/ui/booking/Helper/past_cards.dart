import 'package:actiday/framework/controller/booking_page_controller/booking_page_controller.dart';
import 'package:actiday/ui/bookingdetails/booking_detail_base.dart';
import 'package:actiday/ui/util/widgets/booking_card.dart';
import 'package:flutter/material.dart';
Widget pastCards(int index, bool isPast,BuildContext context) {
  return InkWell(
    onTap: (){
      onTap: (){
        print(BookingPageController.modelPast[index].status);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookingDetailScreen(title: BookingPageController.modelPast[index].title ?? '', status:BookingPageController.modelPast[index].status??'',isUpcoming:true,index:index,)));
      };
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: BookingCard(
        index: index,
        image: BookingPageController.modelPast[index].image ?? '',
        title: BookingPageController.modelPast[index].title ?? '',
        credit: BookingPageController.modelPast[index].credit?.toDouble() ?? 0.0,
        status:BookingPageController.modelPast[index].status,
      ),
    ),
  );
}