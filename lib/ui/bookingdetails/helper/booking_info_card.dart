import 'package:flutter/material.dart';

import '../../../framework/controller/booking_detail_controller/booking_detail_controller.dart';
import '../../../framework/controller/booking_page_controller/booking_page_controller.dart';
import '../../util/Themes/app_colors.dart';
import '../../util/app_constants.dart';
import '../../util/custom_text.dart';

class BookingInfoCard extends StatelessWidget {
  final String status;
  final int index;
  final double width;
  final double height;
  const BookingInfoCard({super.key,required this.status,required this.index, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return (width>height)?Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0),
      child: bookingcardlayout(index, status),
    ):bookingcardlayout(index, status);
}


}
Widget bookingcardlayout(int index,String status){
return Container(
  height: 170,
  color: clrWhite,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            CustomText(
              text:
              "${(status == str_Upcoming) ? BookingDetailController.modelDetailUpcoming[index].category : BookingDetailController.modelDetailPast[index].category}",
            ),
            Spacer(),
            CustomText(
              text:
              "${(status == str_Upcoming) ? BookingPageController.modelUpcoming[index].credit : BookingPageController.modelPast[index].credit} Credits",
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        Row(
          children: [
            Icon(Icons.alarm, size: 16),
            CustomText(
              text:
              "${(status == str_Upcoming) ? BookingDetailController.modelDetailUpcoming[index].time : BookingDetailController.modelDetailPast[index].time} min",
            ),
          ],
        ),
        Row(
          children: [
            CustomText(text: "Specialist"),
            Spacer(),
            CustomText(
              text:
              "${(status == str_Upcoming) ? BookingDetailController.modelDetailUpcoming[index].specialist : BookingDetailController.modelDetailPast[index].specialist}",
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        Row(
          children: [
            CustomText(text: "Time Slot"),
            Spacer(),
            CustomText(
              text:
              "${(status == str_Upcoming) ? BookingDetailController.modelDetailUpcoming[index].timeSlot : BookingDetailController.modelDetailPast[index].timeSlot}",
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        Row(
          children: [
            CustomText(text: "Booking Id"),
            Spacer(),
            CustomText(
              text:
              "${(status == str_Upcoming) ? BookingDetailController.modelDetailUpcoming[index].bookingId : BookingDetailController.modelDetailPast[index].bookingId}",
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ],
    ),
  ),
);
}