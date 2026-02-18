import 'package:actiday/framework/controller/base_bottom_navbar/bottom_navbar_controller.dart';
import 'package:actiday/framework/controller/booking_page_controller/booking_page_controller.dart';
import 'package:actiday/ui/booking/Helper/tab_card_helper.dart';
import 'package:actiday/ui/util/Themes/app_colors.dart';
import 'package:actiday/ui/util/booking_card.dart';
import 'package:actiday/ui/util/custom_text.dart';
import 'package:flutter/material.dart';

class BookingpageMobile extends StatefulWidget {
  const BookingpageMobile({super.key});

  @override
  State<BookingpageMobile> createState() => _BookingpageMobileState();
}

class _BookingpageMobileState extends State<BookingpageMobile> {
  bool isUpcoming = true;
  bool isPast=false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width:double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: clrWhite,
              boxShadow: [
                BoxShadow(
                  color:clrGreyShade300,
                  spreadRadius: 0.2
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                GestureDetector(
                  onTap: () {
                    if(isPast){
                      isPast=false;
                      isUpcoming=true;
                    }

                    setState(() {});
                  },
                  child:TabCardHelper(width: width, height: height, isUpcoming: isUpcoming,isPast: isPast, text: "Upcoming", color: isUpcoming ? clrPinkAccent : clrGrey)
                ),

                GestureDetector(
                  onTap: () {
                    if(isUpcoming){
                      isPast=true;
                      isUpcoming=false;
                    }
                    setState(() {});
                  },
                  child: TabCardHelper(width: width, height: height, isUpcoming: isUpcoming,isPast: isPast, text: "Past", color: isPast ? clrPinkAccent :clrGrey)
                ),

              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount:BookingPageController.modelUpcoming.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: BookingCard(index: index, image: BookingPageController.modelUpcoming[index].image??'', title:BookingPageController.modelUpcoming[index].title??'', credit: BookingPageController.modelUpcoming[index].credit?.toDouble()??0.0),
            );
          }),
        ),
      ],
    );
  }
}
