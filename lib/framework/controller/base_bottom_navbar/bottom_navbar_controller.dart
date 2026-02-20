import 'package:actiday/ui/booking/booking.dart';
import 'package:actiday/ui/dashboard/home.dart';
import 'package:actiday/ui/explore/explore.dart';
import 'package:actiday/ui/favourite/favourite.dart';
import 'package:actiday/ui/util/app_constants.dart';
import 'package:actiday/ui/util/common_enums.dart';
import 'package:flutter/material.dart';

import '../../repository/base_bottom_navbar/models/bottomnavbar_model.dart';

class BottomController {
  static int selectedIndex=0;
  static List<BottomModel> bottomList = [
    BottomModel(
      name: "Home",
      iconName: Icon(Icons.home),
      color: Colors.black,
      isSelected: true,
      body: HomePage(),
      id: 0
    ),
    BottomModel(
      name: str_Booking,
      iconName: Icon(Icons.calendar_month),
      color: Colors.black,
      body:BookingScreen(),
      id:1,
    ),
    BottomModel(
      name: str_explore,
      iconName: Icon(Icons.explore),
      color: Colors.black,
      body: ExploreScreen(),
      id: 2,
    ),
    BottomModel(
      name: str_favourite,
      iconName: Icon(Icons.favorite_outline),
      color: Colors.black,
      body: FavouriteScreen(),
      id: 3
    ),
  ];
}