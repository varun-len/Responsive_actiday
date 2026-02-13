import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar customAppBar(){
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.location_on_outlined,size: 18,),
        Text("Abu Dhabi,UAE",style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,letterSpacing: 0.4),),
      ],
    ),
    leading:Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(height:10,width:10,child: SvgPicture.asset("assets/svg/dashboard.svg",color: Colors.black,fit: BoxFit.cover,)),
    ),
    actions: [
      Icon(Icons.notification_add_outlined),
      SizedBox(
        width: 20,
      )
    ],
  );
}
