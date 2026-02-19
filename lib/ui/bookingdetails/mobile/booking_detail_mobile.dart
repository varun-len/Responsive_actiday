import 'package:actiday/ui/bookingdetails/helper/booking_info_card.dart';
import 'package:actiday/ui/bookingdetails/helper/payment_summary_cards.dart';
import 'package:actiday/ui/bookingdetails/helper/stack_card.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
