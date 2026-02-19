import 'package:actiday/ui/base/base.dart';
import 'package:actiday/ui/base/web/base_web.dart';
import 'package:actiday/ui/bookingdetails/helper/booking_info_card.dart';
import 'package:actiday/ui/bookingdetails/helper/payment_summary_cards.dart';
import 'package:actiday/ui/bookingdetails/helper/rating_cad.dart';
import 'package:actiday/ui/bookingdetails/helper/stack_card.dart';
import 'package:actiday/ui/bookingdetails/helper/status_buttons.dart';
import 'package:actiday/ui/util/Themes/app_colors.dart';
import 'package:actiday/ui/util/custom_appbar.dart';
import 'package:actiday/ui/util/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../framework/controller/base_bottom_navbar/bottom_navbar_controller.dart';
import '../../util/app_constants.dart';
import '../../util/common_appbar_web.dart';
import '../../util/logout_dialog.dart';

class BookingDetailWeb extends StatefulWidget {
  final int index;
  final String title;
  final String status;
  final bool isUpcoming;

  const BookingDetailWeb({
    super.key,
    required this.title,
    required this.status,
    required this.isUpcoming,
    required this.index,
  });

  @override
  State<BookingDetailWeb> createState() => _BookingDetailWebState();
}

class _BookingDetailWebState extends State<BookingDetailWeb> {
  int index = BottomController.selectedIndex;
  List<String?> ratingList = ['Bad', 'Better', 'Good', 'very Good', 'Excellent'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: clrWhite,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10),
          child: SvgPicture.asset(ic_logoblack),
        ),
        leadingWidth: 220,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: BottomController.bottomList.map((value) {
            return TextButton(
              onPressed: () {
                Navigator.pop(context);
                index = value.id;
                BottomController.selectedIndex = index;
                for (int i = 0; i < BottomController.bottomList.length; i++) {
                  BottomController.bottomList[i].isSelected = index == i;
                }
                setState(() {});
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BaseWeb()),
                );
              },
              child: Text(
                value.name ?? '',
                style: TextStyle(
                  color: (value.isSelected) ? Colors.black : clrBlack45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
        ),
        actions: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(ic_searchIcon),
          ),
          SizedBox(width: 10),
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(ic_notification),
          ),
          SizedBox(width: 10),
          InkWell(
            child: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(ic_appbarComponent),
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return LogoutDialog();
                },
              );
            },
            child: Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: BoxBorder.all(color: clrGreenAccent),
              ),
              child: Align(
                alignment: AlignmentGeometry.center,
                child: CustomText(text: str_Logout),
              ),
            ),
          ),
          SizedBox(width: 70),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Row(
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
                    SizedBox(width: 10),
                    SizedBox(
                      width: 20,
                      child: Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                    SizedBox(width: 7),
                    CustomText(
                      text:
                          BottomController
                              .bottomList[BottomController.selectedIndex]
                              .name ??
                          "",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 20,
                      child: Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                    CustomText(
                      text: "Booking Details",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 100),
                  Container(
                    width: width / 2,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StackCard(
                            status: widget.status,
                            index: widget.index,
                            width: width,
                            title: widget.title,
                            isUpcoming: widget.isUpcoming,
                            height: height,
                          ),
                          BookingInfoCard(
                            status: widget.status,
                            index: widget.index,
                            width: width,
                            height: height,
                          ),
                          SizedBox(height: 10),
                          CustomText(
                            text: "Payment Summary",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          SizedBox(height: 10),
                          PaymentSummaryCards(
                            status: widget.status,
                            index: widget.index,
                            width: width,
                            height: height,
                          ),
                          StatusButtons(status: widget.status),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: width / 4,
                        height: height / 2,
                        decoration: BoxDecoration(
                          color: clrWhite,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: clrGreyShade300,
                              blurRadius: 1,
                              spreadRadius: 0.6,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(text: "Rate Us"),
                              SizedBox(height: 10),
                              ListView.builder(
                                itemCount:ratingList.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: RatingCard(
                                    text: "${index + 1}",
                                    rating: "${ratingList[index]}",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height - (height / 2)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
