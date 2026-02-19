import 'package:actiday/ui/booking/booking.dart';
import 'package:actiday/ui/dashboard/home.dart';
import 'package:actiday/ui/explore/explore.dart';
import 'package:actiday/ui/favourite/favourite.dart';
import 'package:actiday/ui/util/app_constants.dart';
import 'package:actiday/ui/util/widgets/custom_appbar.dart';
import 'package:actiday/ui/util/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../framework/controller/base_bottom_navbar/bottom_navbar_controller.dart';
import '../../Login/login.dart';
import '../../util/Themes/app_colors.dart';
import '../../util/widgets/logout_dialog.dart';

class BaseMobile extends StatefulWidget {
  const BaseMobile({super.key});

  @override
  State<BaseMobile> createState() => _BaseMobileState();
}

class _BaseMobileState extends State<BaseMobile> {
  int index = BottomController.selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      drawer:Drawer(
        child:SizedBox(
          height: 700,
          child: ListView(
            children: [
              DrawerHeader(
                  child: CustomText(text:str_Welocme)
              ),
              Spacer(),
              ListTile(
                onTap: (){
                  Navigator.pop(context);
                  showDialog(
                     context:context, builder: (context) {
                       return LogoutDialog();
                  },
                  );


                },
                leading:Icon(Icons.logout_rounded),
                title:CustomText(text: str_Logout) ,
                trailing: CustomText(text: "👋"),
              )
            ],
          ),
        ),
      ),
      body:BottomController.bottomList[index].body,
      bottomNavigationBar:BottomNavigationBar(
        selectedItemColor:Colors.black,
        unselectedItemColor: clrBlack45,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: clrGreenAccent),
        showUnselectedLabels: true,
        currentIndex:index,
        onTap: (val) {
          index = val;
          BottomController.selectedIndex=index;
          for(int i=0;i<BottomController.bottomList.length;i++){
            BottomController.bottomList[i].isSelected=index==i;
          }
          setState(() {});
        },
        items: BottomController.bottomList.map((value){
          return BottomNavigationBarItem(icon: value.iconName,label: value.name);
        }).toList(),
      )
    );
  }
}
