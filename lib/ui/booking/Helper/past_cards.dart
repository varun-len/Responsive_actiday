import 'package:flutter/material.dart';

import '../../../framework/controller/booking_page_controller/booking_page_controller.dart';
import '../../util/app_constants.dart';
import '../../util/booking_card.dart';

Widget pastCards(int index, bool isPast) {
  return InkWell(
    onTap: (){

    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: BookingCard(
        index: index,
        image: BookingPageController.modelPast[index].image ?? '',
        title: BookingPageController.modelPast[index].title ?? '',
        credit: BookingPageController.modelPast[index].credit?.toDouble() ?? 0.0,
        status: str_Past,
      ),
    ),
  );
}