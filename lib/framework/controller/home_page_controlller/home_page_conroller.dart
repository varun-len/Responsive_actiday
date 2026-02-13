import 'package:flutter/services.dart';

import '../../repository/base_bottom_navbar/models/home_model.dart';

Home? home;
List<Banner> modelBanner = [];
List<Category> modelCategory = [];
List<TopClass> modelTopClass = [];

Future<void> loadHomeJson() async {
  final String response = await rootBundle.loadString(
    'assets/json/home.json',
  );

  final data = homeFromJson(response);
  home = data;
  modelBanner = home?.banner ?? [];
  modelCategory = home?.categories ?? [];
  modelTopClass = home?.topClass ?? [];
}