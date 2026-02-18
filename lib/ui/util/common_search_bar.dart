import 'package:actiday/ui/util/Themes/app_colors.dart';
import 'package:actiday/ui/util/app_constants.dart';
import 'package:flutter/material.dart';

class SearchBarDemo extends StatelessWidget {
  const SearchBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey[700]),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              str_searchString,
              style: TextStyle(color: Colors.grey[700], fontSize: 12),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Clear action
            },
            child: Icon(Icons.close, color: clrGrey),
          ),
        ],
      ),
    );
  }
}
