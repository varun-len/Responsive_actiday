import 'package:flutter/material.dart';

class TextHelper extends StatefulWidget {
  String text;
  bool isBold;
  bool isNormal;
  Color color;
  TextHelper({super.key,required this.text,required this.isBold,this.isNormal=false,this.color=Colors.black});

  @override
  State<TextHelper> createState() => _TextHelperState(text: text,isBold:isBold,isNormal: isNormal,color: color);
}

class _TextHelperState extends State<TextHelper> {

  String text;
  bool isBold;
  bool isNormal;
  Color color;
  _TextHelperState({required this.text,required this.isBold,required this.isNormal,required this.color});

  TextStyle isBoldStyle([Color? color ]){
    return TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      color: color,
    );
  }
  TextStyle isCustomStyle([Color? color]){
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:(isBold)?isBoldStyle():(isNormal)?isCustomStyle():TextStyle(),
    );
  }
}
