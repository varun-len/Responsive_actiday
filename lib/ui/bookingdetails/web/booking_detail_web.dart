
import 'package:actiday/ui/base/base.dart';
import 'package:actiday/ui/base/web/base_web.dart';
import 'package:actiday/ui/bookingdetails/helper/booking_info_card.dart';
import 'package:actiday/ui/bookingdetails/helper/payment_summary_cards.dart';
import 'package:actiday/ui/bookingdetails/helper/stack_card.dart';
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
  int index=BottomController.selectedIndex;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:AppBar(
        backgroundColor:clrWhite,
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BaseWeb()));
              },
              child: Text(
                value.name ?? '',
                style: TextStyle(
                  color: (value.isSelected) ? Colors.black :clrBlack45,
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
              showDialog(context: context, builder: (context){
                return LogoutDialog();
              });
            },
            child: Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: BoxBorder.all(color:clrGreenAccent),
              ),
              child: Align(alignment:AlignmentGeometry.center,child: CustomText(text: str_Logout)),
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
              SizedBox(height: 70),
              StackCard(status: widget.status, index: widget.index, width: width, title: widget.title, isUpcoming: widget.isUpcoming,height: height,),
              Padding(
                padding: const EdgeInsets.only(right: 400.0),
                child: BookingInfoCard(status:widget.status, index: widget.index, width: width, height: height,),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: CustomText(
                  text: "Payment Summary",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 400.0),
                child: PaymentSummaryCards(status:widget.status, index: widget.index, width: width, height: height,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

