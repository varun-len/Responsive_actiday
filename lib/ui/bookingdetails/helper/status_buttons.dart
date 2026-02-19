import 'package:flutter/material.dart';

import '../../util/Themes/app_colors.dart';
import '../../util/custom_text.dart';

class StatusButtons extends StatelessWidget {
  final String status;
  const StatusButtons({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return (status=="Booked")?isBooked():isCompleted();
  }
}


Widget isBooked(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(text:"You can cancel an appointment minimum of 30 minutes prior to the scheduled time.",color: clrBlack45,),
      SizedBox(
        height: 30,
      ),
      Container(
        height: 40,
        width: 140,
        decoration: BoxDecoration(border: BoxBorder.all(color: clrPinkAccent),borderRadius: BorderRadius.circular(20)),
        child: Center(child: CustomText(text: "Cancel Booking")),
      ),
    ],
  );
}

Widget isCompleted(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(text:"Write Your Reviews",color: clrPinkAccent,),
      CustomText(text:"Lorem Ipsum Is Simply Dummy Text Of The Printing And Typesetting Industry. Lorem Ipsum Has Been The Industry's Standard Dummy Text Ever Since The 1500S, When An Unknown Printer Took A Galley Of Type And Scrambled It To Make A Type Specimen Book.",color: clrBlack45,),
      SizedBox(
        height: 30,
      ),
      Container(
        height: 40,
        width: 140,
        decoration: BoxDecoration(color:clrPinkAccent,border: BoxBorder.all(color: clrPinkAccent),borderRadius: BorderRadius.circular(20)),
        child: Center(child: CustomText(text: "Submit",color: clrWhite,)),
      ),
    ],
  );
}