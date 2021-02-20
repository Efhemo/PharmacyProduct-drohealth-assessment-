import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AmountPacks extends StatefulWidget {

  final int initPrice;
  final int quantity;
  final Function(int quantity) onChangeTotalQuantity;

  AmountPacks( {@required this.initPrice, @required this.quantity, this.onChangeTotalQuantity});

  @override
  _AmountPacksState createState() => _AmountPacksState();
}

class _AmountPacksState extends State<AmountPacks> {

  var totalQuantity = 1;
  int totalPrice;

  @override
  void initState() {
    totalQuantity = widget.quantity;
    totalPrice = widget.initPrice * totalQuantity;
    widget.onChangeTotalQuantity(totalQuantity);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13.0),
              border: Border.all(color: Colors.grey[500])
          ),
          child: Row(
            children: [
              IconButton(icon: Icon(MdiIcons.minus, size: 30.0), onPressed: () => modifyPrice(false)),
              SizedBox(width: 18.0),
              Text(totalQuantity.toString(), style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(width: 12.0),
              IconButton(icon: Icon(MdiIcons.plus, size: 30.0), onPressed: () => modifyPrice(true)),
            ],
          ),
        ),
        SizedBox(width: 10.0),
        Text("Pack(s)"),
        Expanded(child: SizedBox()),
        Text("₦$totalPrice", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0))
      ],
    );
  }

  void modifyPrice(bool isIncrease){
    if(isIncrease){
      totalQuantity = totalQuantity + 1;
    }else {
      if(totalQuantity > 1){
        totalQuantity = totalQuantity - 1;
      }
    }
    setState(() {
      totalPrice = widget.initPrice * totalQuantity;
      widget.onChangeTotalQuantity(totalQuantity);
    });
  }
}