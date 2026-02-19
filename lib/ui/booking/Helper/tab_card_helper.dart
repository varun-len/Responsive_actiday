import 'package:actiday/ui/util/widgets/custom_text.dart';
import 'package:flutter/material.dart';


class TabCardHelper extends StatefulWidget {
  final double width;
  final double height;
  final bool isUpcoming;
  final bool isPast;
  final String text ;
  final Color color;
  const TabCardHelper({super.key,required this.color, required this.width,required this.height,required this.isUpcoming,required this.isPast,required this.text});
  @override
  State<TabCardHelper> createState() => _TabCardHelperState();
}

class _TabCardHelperState extends State<TabCardHelper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Center(
          child: CustomText(
            text: widget.text,
            fontWeight: FontWeight.w800,
            color: widget.color,
          ),
        ),
        Spacer(),
        Center(
          child: Visibility(
            visible: (widget.color==Colors.pinkAccent),
            child: Container(
              height: 3,
              width: 50,
              color: widget.color,
            ),
          ),
        ),
      ],
    );
  }
}
