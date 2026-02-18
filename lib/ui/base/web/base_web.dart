import 'package:actiday/ui/profile/profile_web.dart';
import 'package:actiday/ui/util/custom_text.dart';
import 'package:actiday/ui/util/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../framework/controller/base_bottom_navbar/bottom_navbar_controller.dart';
import '../../util/Themes/app_colors.dart';
import '../../util/app_constants.dart';

class BaseWeb extends StatefulWidget {
  const BaseWeb({super.key});

  @override
  State<BaseWeb> createState() => _BaseWebState();
}

class _BaseWebState extends State<BaseWeb> {
  int index = BottomController.selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:clrWhite,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10),
          child: SvgPicture.asset(ic_logoblack),
        ),
        leadingWidth: 220,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: BottomController.bottomList.map((value) {
            return TextButton(
              onPressed: () {
                index = value.id;
                BottomController.selectedIndex = index;
                for (int i = 0; i < BottomController.bottomList.length; i++) {
                  BottomController.bottomList[i].isSelected = index == i;
                }
                setState(() {});
              },
              child: Text(
                value.name ?? '',
                style: TextStyle(
                  color: (value.isSelected) ? Colors.black :clrBlack45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
        ),
        actions: [
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(ic_searchIcon),
          ),
          SizedBox(width: 10),
          SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(ic_notification),
          ),
          SizedBox(width: 10),
          InkWell(
            child: SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(ic_appbarComponent),
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(context: context, builder: (context){
                return LogoutDialog();
              });
            },
            child: Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: BoxBorder.all(color:clrGreenAccent),
              ),
              child: Align(alignment:AlignmentGeometry.center,child: CustomText(text: str_Logout)),
            ),
          ),
          SizedBox(width: 70),
        ],
      ),
      body: BottomController.bottomList[index].body,
    );
  }
}
