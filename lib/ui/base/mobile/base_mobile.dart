import 'package:actiday/ui/booking/booking.dart';
import 'package:actiday/ui/dashboard/home.dart';
import 'package:actiday/ui/explore/explore.dart';
import 'package:actiday/ui/favourite/favourite.dart';
import 'package:actiday/ui/util/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../../../framework/controller/base_bottom_navbar/bottom_navbar_controller.dart';

class BaseMobile extends StatefulWidget {
  const BaseMobile({super.key});

  @override
  State<BaseMobile> createState() => _BaseMobileState();
}

class _BaseMobileState extends State<BaseMobile> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: const Drawer(),
      body:BottomController.bottomList[selectedIndex].body,
      bottomNavigationBar:BottomNavigationBar(
        selectedItemColor:Colors.black,
        unselectedItemColor: Colors.black45,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.greenAccent),
        showUnselectedLabels: true,
        currentIndex:selectedIndex,
        onTap: (val) {
          selectedIndex = val;

          setState(() {});
        },
        items: BottomController.bottomList.map((value){
          return BottomNavigationBarItem(icon: value.iconName,label: value.name);
        }).toList(),
      )
    );
  }
}
