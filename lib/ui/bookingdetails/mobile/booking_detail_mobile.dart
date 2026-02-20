import 'package:actiday/ui/bookingdetails/helper/booking_info_card.dart';
import 'package:actiday/ui/bookingdetails/helper/payment_summary_cards.dart';
import 'package:actiday/ui/bookingdetails/helper/stack_card.dart';
import 'package:actiday/ui/bookingdetails/helper/status_buttons.dart';
import 'package:actiday/ui/util/Themes/app_colors.dart';
import 'package:actiday/ui/util/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BookingDetailMobile extends StatefulWidget {
  final int index;
  final String title;
  final String status;
  final bool isUpcoming;

  const BookingDetailMobile({
    super.key,
    required this.title,
    required this.status,
    required this.isUpcoming,
    required this.index,
  });

  @override
  State<BookingDetailMobile> createState() => _BookingDetailMobileState();
}

class _BookingDetailMobileState extends State<BookingDetailMobile> {
  int colorIndexRating = 0;
  List<String?> ratingList = [
    'Bad',
    'Better',
    'Good',
    'Very Good',
    'Excellent',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: clrFAFAFA,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("Booking Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              StackCard(status: widget.status, index: widget.index, width: width, title: widget.title, isUpcoming: widget.isUpcoming,height:height,),
              BookingInfoCard(status:widget.status, index: widget.index, width: width, height: height,),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Payment Summary",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              SizedBox(
                height: 10,
              ),
              PaymentSummaryCards(status:widget.status, index: widget.index, width: width, height: height,),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: (widget.status=='completed'),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width:double.infinity,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:
                                List.generate(5,(index){
                                  return GestureDetector(
                                    onTap: () {
                                      colorIndexRating = index;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 40,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(13),
                                              border: BoxBorder.all(
                                                color:
                                                (index <= colorIndexRating)
                                                    ? clrPinkAccent
                                                    : clrBlack45,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(left:
                                                8.0,right: 8
                                              ),
                                              child: Row(
                                                children: [
                                                  SizedBox(width: width*0.003),
                                                  Center(
                                                    child: CustomText(
                                                      text: "${index + 1}",
                                                      fontSize: width*0.035,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.star_border,
                                                    size: width*0.035,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: (index==4),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(ratingList[colorIndexRating] ?? '', style: TextStyle(fontSize: width*0.035,color: Colors.pinkAccent),),
                                            ),
                                          ) ]
                                      ),
                                    ),
                                  );
                                }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatusButtons(status:widget.status),
              )
            ],
          ),
        ),
      ),
    );
  }
}
