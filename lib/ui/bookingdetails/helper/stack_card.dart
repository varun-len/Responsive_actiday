import 'package:actiday/framework/controller/booking_detail_controller/booking_detail_controller.dart';
import 'package:actiday/framework/controller/booking_page_controller/booking_page_controller.dart';
import 'package:actiday/ui/util/Themes/app_colors.dart';
import 'package:actiday/ui/util/app_constants.dart';
import 'package:actiday/ui/util/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class StackCard extends StatelessWidget {
  final String status;
  final int index;
  final double width;
  final double height;
  final String title;
  final bool isUpcoming;
  const StackCard({super.key,required this.status,required this.index, required this.width, required this.title, required this.isUpcoming, required this.height});

  @override
  Widget build(BuildContext context) {
    return (width>height)?stackCardSkeletonWeb(width, height, title, isUpcoming, index, status):stackCardSkeletonMobile(width, height, title, isUpcoming, index, status);


  }


}
Widget stackCardSkeletonMobile(double width,double height,String title ,bool isUpcoming, int index, String status){
  return Stack(
    children: [
      Container(
        height: 110,
        width: (width>height)?width*0.45:width-20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(16),topRight: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: clrGreyShade300,
              blurRadius: 1,
              spreadRadius: 0.4,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 70,
              color: Colors.white54,
              child: Row(
                children: [
                  SizedBox(width: 100),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          top: 12,
                        ),
                        child: Container(
                          height: 100,
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: title,
                                fontSize: 17,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 16,
                                  ),
                                  CustomText(
                                    text:
                                    "${(status == str_Upcoming) ? BookingDetailController.modelDetailUpcoming[index].address : BookingDetailController.modelDetailPast[index].address}",
                                  ),
                                  CustomText(
                                    text:
                                    "(${(status == str_Upcoming) ? BookingDetailController.modelDetailUpcoming[index].distance : BookingDetailController.modelDetailPast[index].distance} km )",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              color: clrGreyShade300,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  children: [
                    SizedBox(width: 100),
                    Container(
                      child: CustomText(
                        text:
                        "${(status == str_Upcoming) ? BookingDetailController.modelDetailUpcoming[index].rating.toString() : BookingDetailController.modelDetailPast[index].rating.toString()}",
                      ),
                    ),
                    Icon(Icons.star, color: clrBlack, size: 16),
                    Spacer(),
                    Container(
                      height: 25,
                      width: width / 3,
                      decoration: BoxDecoration(
                        color: clrWhite,
                        borderRadius: BorderRadius.circular(20),
                        border: BoxBorder.all(color: clrPinkAccent),
                      ),
                      child: CustomText(
                        text: (isUpcoming)
                            ? BookingPageController
                            .modelUpcoming[index]
                            .status ??
                            ''
                            : BookingPageController
                            .modelPast[index]
                            .status ??
                            '',
                        fontSize: 17,
                        align: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        top: 20,
        left: 20,
        child: Container(
          height: 75,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: clrGreyShade300,
                blurRadius: 1,
                spreadRadius: 0.7,
              ),
            ],
          ),
          child: Image.asset(
            ((BookingPageController
                .modelUpcoming[index]
                .status ??
                '') ==
                str_Upcoming)
                ? BookingDetailController
                .modelDetailUpcoming[index]
                .image ??
                ''
                : BookingDetailController
                .modelDetailUpcoming[index]
                .image ??
                '',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
Widget stackCardSkeletonWeb(double width,double height,String title ,bool isUpcoming, int index, String status){
  return Stack(
    children: [
      Container(
        height: 120,
        width: (width>height)?width*0.55:width-20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft:Radius.circular(16),topRight: Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              color: clrGreyShade300,
              blurRadius: 1,
              spreadRadius: 0.4,
            ),
          ],
        ),
        child: Column(

          children: [
            Container(

              color: Colors.white54,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 100),
                        Expanded(
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                top: 12,
                              ),
                              child: Container(
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: title,
                                      fontSize: 17,
                                    ),

                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Container(
                                        height: 35,
                                        width: width*0.08,
                                        decoration: BoxDecoration(
                                          color: clrWhite,
                                          borderRadius: BorderRadius.circular(20),
                                          border: BoxBorder.all(color: clrPinkAccent),
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            text: status,
                                            fontSize: 17,
                                            align: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 30,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            SizedBox(width: width*0.08),
                            Icon(
                              Icons.location_on_outlined,
                              size: 16,
                            ),
                            CustomText(
                              text:
                              "${(status == str_Upcoming) ? BookingDetailController.modelDetailUpcoming[index].address : BookingDetailController.modelDetailPast[index].address}",
                            ),
                            CustomText(
                              text:
                              "(${(status == str_Upcoming) ? BookingDetailController.modelDetailUpcoming[index].distance : BookingDetailController.modelDetailPast[index].distance} km )",
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(".",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                            ),
                            Container(
                              child: CustomText(
                                text:
                                "${(status == str_Upcoming) ? BookingDetailController.modelDetailUpcoming[index].rating.toString() : BookingDetailController.modelDetailPast[index].rating.toString()}",
                              ),
                            ),
                            Icon(Icons.star, color: clrBlack, size: 16),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      Positioned(
        top: 20,
        left: 20,
        child: Container(
          height: 75,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: clrGreyShade300,
                blurRadius: 1,
                spreadRadius: 0.7,
              ),
            ],
          ),
          child: Image.asset(
            ((BookingPageController
                .modelUpcoming[index]
                .status ??
                '') ==
                str_Upcoming)
                ? BookingDetailController
                .modelDetailUpcoming[index]
                .image ??
                ''
                : BookingDetailController
                .modelDetailUpcoming[index]
                .image ??
                '',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );

}


