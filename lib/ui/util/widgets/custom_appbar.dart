import 'package:actiday/framework/controller/base_bottom_navbar/bottom_navbar_controller.dart';
import 'package:actiday/ui/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar customAppBar(BuildContext context ) {
  int selectedIndex = BottomController.selectedIndex;
  return AppBar(
    title: (BottomController.bottomList[selectedIndex].name == str_home)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on_outlined, size: 18),
              Text(
                str_AppbarTitle,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          )
        : Text(
            BottomController.bottomList[selectedIndex].name ?? '',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.4,
            ),
          ),
    leading: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Builder(
        builder: (context) {
          return InkWell(
            onTap: (){
              Scaffold.of(context).openDrawer();
            },
            child: SizedBox(
              height: 10,
              width: 10,
              child: SvgPicture.asset(
                "assets/svg/dashboard.svg",
                color: Colors.black,
                fit: BoxFit.cover,
              ),
            ),
          );
        }
      ),
    ),
    actions: [
      Visibility(
        visible: (BottomController.bottomList[selectedIndex].name == "home"),
          child: Icon(Icons.notification_add_outlined)),
      SizedBox(width: 20),
    ],
  );
}
