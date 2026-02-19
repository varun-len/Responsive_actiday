import 'package:actiday/framework/controller/base_bottom_navbar/bottom_navbar_controller.dart';
import 'package:actiday/ui/base/base.dart';
import 'package:actiday/ui/util/app_constants.dart';
import 'package:actiday/ui/util/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: FilledButton(
        onPressed: (){
      for(int i=0;i<BottomController.bottomList.length;i++){
        BottomController.bottomList[i].isSelected=BottomController.selectedIndex==i;
      }
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BaseScreen()));
    }, child: CustomText(text: str_Login)));
  }
}