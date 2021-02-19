import 'package:flutter/material.dart';
import 'package:pharmacy_product/ui/config/palette.dart';

Widget customListTile (String avatar, String title, String subtitle){
  return Row(
    children: [
      Image.asset(avatar, height: 26.0, width: 26.0),
      SizedBox(width: 12.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[500], fontSize: 12.0)),
          Text(subtitle, style: TextStyle(color: Palette.darkGreen,  fontWeight: FontWeight.bold)),
        ],
      ),
    ],
  );
}