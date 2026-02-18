
import 'package:actiday/ui/util/app_constants.dart';
import 'package:flutter/services.dart';

import '../../repository/base_bottom_navbar/models/booking_detail_model.dart';

class BookingDetailController {
  BookingDetail? bookingDetail;
  static List<Past> modelDetailPast = [];
  static List<Past> modelDetailUpcoming = [];

  Future<void> loadBookingDetailJson() async {
    // if(FavouriteController.favourite.isNotEmpty) return;

    final String response = await rootBundle.loadString(
      jsonDetailBooking,
    );

    final data = bookingDetailFromJson(response);
    bookingDetail = data;
    modelDetailPast = bookingDetail?.past ?? [];
    modelDetailUpcoming = bookingDetail?.upcoming ?? [];
  }
}