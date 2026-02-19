import 'package:flutter/material.dart';

import '../../../framework/controller/booking_page_controller/booking_page_controller.dart';
import '../../util/app_constants.dart';
import '../../util/custom_text.dart';

class PaymentSummaryCards extends StatelessWidget {
  final String status;
  final int index;
  final double width;
  final double height;
  const PaymentSummaryCards({super.key,required this.status,required this.index, required this.width, required this.height});
  

  @override
  Widget build(BuildContext context) {
    return (width>height)? containerLayout(status, index): containerLayout(status, index);
  }
}

Widget containerLayout(String status ,int index){
  return Container(
    height: 120,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16),bottomRight: Radius.circular(16))
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        SizedBox(
          height: 25,
          child: Row(
            children: [
              CustomText(
                text:
                "Booking Total",
              ),
              Spacer(),
              CustomText(
                text:
                "${(status == str_Upcoming) ? BookingPageController.modelUpcoming[index].credit : BookingPageController.modelPast[index].credit} Credits",)
            ],
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.grey.shade300,
        ),
        SizedBox(
          height: 25,
          child: Row(
            children: [
              CustomText(
                text:
                "Order Total",
              ),
              Spacer(),
              CustomText(
                text:
                "${(status == str_Upcoming) ? BookingPageController.modelUpcoming[index].credit : BookingPageController.modelPast[index].credit} Credits",)
            ],
          ),
        ),
      ]),
    ),
  );
}