import 'package:actiday/framework/controller/base_bottom_navbar/bottom_navbar_controller.dart';
import 'package:actiday/framework/controller/booking_page_controller/booking_page_controller.dart';
import 'package:actiday/ui/booking/Helper/tab_card_helper.dart';
import 'package:actiday/ui/util/app_constants.dart';
import 'package:actiday/ui/util/booking_card.dart';
import 'package:actiday/ui/util/bottomnavbar/bottom_nav_bar_web.dart';
import 'package:actiday/ui/util/custom_appbar.dart';
import 'package:actiday/ui/util/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../bookingdetails/mobile/booking_detail_mobile.dart';
import '../Helper/past_cards.dart';
import '../Helper/upcoming_crds.dart';

class BookingpageWeb extends StatefulWidget {
  const BookingpageWeb({super.key});

  @override
  State<BookingpageWeb> createState() => _BookingpageWebState();
}

class _BookingpageWebState extends State<BookingpageWeb> {

  bool isUpcoming = true;
  bool isPast = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 7;
    double width = MediaQuery.of(context).size.width / 6;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [

            Row(
              children: [
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset(
                      "assets/svg/home.svg",
                      color: Colors.black,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                SizedBox(width: 20,child: Icon(Icons.arrow_forward_ios,size: 20,),),
                SizedBox(width: 7,),
                CustomText(text:BottomController.bottomList[BottomController.selectedIndex].name??"",fontSize: 20,fontWeight: FontWeight.bold,),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, spreadRadius: 0.2),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        if (isPast) {
                          isPast = false;
                          isUpcoming = true;
                        }

                        setState(() {});
                      },
                      child: TabCardHelper(
                        width: width,
                        height: height,
                        isUpcoming: isUpcoming,
                        isPast: isPast,
                        text: str_Past,
                        color: isUpcoming ? Colors.pinkAccent : Colors.grey,
                      ),
                    ),
                    SizedBox(width: 40),
                    GestureDetector(
                      onTap: () {
                        if (isUpcoming) {
                          isPast = true;
                          isUpcoming = false;
                        }
                        setState(() {});
                      },
                      child: TabCardHelper(
                        width: width,
                        height: height,
                        isUpcoming: isUpcoming,
                        isPast: isPast,
                        text: str_Past,
                        color: isPast ? Colors.pinkAccent : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  childAspectRatio: 11 / 9,
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: BookingPageController.modelUpcoming.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return (isUpcoming)
                      ? upcomingCards(index, isUpcoming,context)
                      : pastCards(index, isPast);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

