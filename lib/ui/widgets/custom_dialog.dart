import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_product/ui/config/palette.dart';

class CustomDialogBox extends StatelessWidget {

  final String title;
  final Function(bool) onDoneClick;

  const CustomDialogBox({Key key, this.title, this.onDoneClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 25.0,top:45.0, right: 25.0, bottom: 20.0),
          margin: EdgeInsets.only(top: 45.0),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Successful',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    '$title has been added to your bag',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 20),
              MaterialButton(
                elevation: 0.0,
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.0),
                color: Palette.droTurquoise,
                onPressed: () => onDoneClick(false),
                child: Text(
                  'View Bag',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white
                  ),
                ),
              ),
              MaterialButton(
                elevation: 0.0,
                minWidth: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8.0),
                color:  Palette.droTurquoise,
                onPressed: () => onDoneClick(true),
                child: Text(
                  'Done',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          )
        ),
        Positioned(
          left: 24.0,
          right: 24.0,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 45,
            child: Center(
              child: CircleAvatar(
                backgroundColor: Palette.droTurquoise,
                radius: 40,
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}