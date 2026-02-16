import 'package:actiday/ui/Login/login.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
            return LoginPage();
          }), (Route<dynamic> route)=>false);
        },
        child: SizedBox(
          height: 70,
          width: 300,
          child: Text("Logout "),
        ),
      ),
    );
  }
}