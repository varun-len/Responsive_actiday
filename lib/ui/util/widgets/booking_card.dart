import 'package:actiday/framework/controller/booking_page_controller/booking_page_controller.dart';
import 'package:actiday/ui/bookingdetails/booking_detail_base.dart';
import 'package:actiday/ui/util/Themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class BookingCard extends StatefulWidget {
  final int index;
  final String image;
  final String title;
  final double credit;
  final VoidCallback? onFavoriteTap;
  final Color? iconcolor;
  final String? status;
  final bool? isPast;


  const BookingCard({
    Key? key,
    required this.index,
    required this.image,
    required this.title,
    required this.credit,
   this.status,
     this.isPast,
    this.iconcolor, this.onFavoriteTap,
  }) : super(key: key);

  @override
  State<BookingCard> createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {

  @override
  Widget build(BuildContext context) {
    int timestamp = int.parse(BookingPageController.modelUpcoming[widget.index].date ?? "");
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String subTitle=BookingPageController.modelUpcoming[widget.index].subTitle?.join(' . ')??"";
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BookingDetailScreen(title:widget.title,status:widget.status??'', index:widget.index, isUpcoming: widget.isPast??true)));
      },
      child: Container(
        height:  width > height ? width /2.5 : width/1.3,
        width: width/2.3,
        decoration: BoxDecoration(
            border: Border.all(color:Colors.transparent),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 2,

              ),

            ],
            color: Colors.white
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                SizedBox(
                  height: width > height ? width / 8.9:width/2.7,
                  width: width,
                  child: ClipRRect(
                    child: Image.network(
                      widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
        ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Row(
                children: [
                  CustomText(
                    text: widget.title,
                    color: Colors.black,
                    fontSize:  width > height ? width * 0.013:width*0.049,
                    fontWeight: FontWeight.bold,
                  ),
                  const Spacer(),
                  CustomText(
                    text: widget.credit.toString(),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 30,
                    width: 60,
                    // decoration: BoxDecoration(border:BoxBorder.all(color:Colors.green),borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Center(child: CustomText(text: "credit")),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomText(
                text: subTitle,
                color: Colors.black,
                fontSize: width > height ? width * 0.011 : width * 0.039,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 2,
                color: clrGreyShade300,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: CustomText(
                    text: date.toString(),
                    color: Colors.black,
                    fontSize: width > height ? width * 0.011 : width * 0.039,
                  ),
                ),
                Spacer(),
                Container(
                  height: 30,
                  width:width > height ? width * 0.078 : width * 0.29 ,
                  decoration: BoxDecoration(border:BoxBorder.all(color:Colors.green),borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(child: CustomText(text:widget.status??'',color:clrPinkAccent,fontSize:width>height?width*0.009:width*0.035,)),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
