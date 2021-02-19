import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {

  final IconData icon;
  final Function onTap;

  const CircleButton({Key key, @required this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      fillColor: Colors.grey[100],
      child: Icon(
        icon,
        size: 28.0,
        color: Colors.grey[600],
      ),
      padding: EdgeInsets.all(8.0),
      shape: CircleBorder(),
    );
  }

}