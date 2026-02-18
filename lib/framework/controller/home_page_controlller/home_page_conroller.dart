import 'package:actiday/framework/controller/favourite_controller/favourite_controller.dart';
import 'package:actiday/ui/util/app_constants.dart';
import 'package:flutter/services.dart';

import '../../repository/base_bottom_navbar/models/home_model.dart';

Home? home;
List<Banner> modelBanner = [];
List<Category> modelCategory = [];
List<TopClass> modelTopClass = [];

Future<void> loadHomeJson() async {
  if(FavouriteController.favourite.isNotEmpty) return;

  final String response = await rootBundle.loadString(
    jsonHome,
  );

  final data = homeFromJson(response);
  home = data;
  modelBanner = home?.banner ?? [];
  modelCategory = home?.categories ?? [];
  modelTopClass = home?.topClass ?? [];
}