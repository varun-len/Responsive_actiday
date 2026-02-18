import 'package:actiday/framework/repository/base_bottom_navbar/models/booking_model.dart';
import 'package:actiday/ui/util/app_constants.dart';
import 'package:flutter/services.dart';

class BookingPageController {
  Booking? booking;
  static List<Past> modelPast = [];
  static List<Past> modelUpcoming = [];

  Future<void> loadBookingJson() async {
    // if(FavouriteController.favourite.isNotEmpty) return;

    final String response = await rootBundle.loadString(
      jsonBooking,
    );

    final data = bookingFromJson(response);
    booking = data;
    modelPast = booking?.past ?? [];
    modelUpcoming = booking?.upcoming ?? [];
  }
}