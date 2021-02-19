import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pharmacy_product/ui/model/product_item.dart';

class BagItem extends StatefulWidget {
  final ProductItem productItem;

  const BagItem({Key key, this.productItem}) : super(key: key);

  @override
  _BagItemState createState() => _BagItemState();
}

class _BagItemState extends State<BagItem> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Column(
        children: [
          InkWell(
            splashColor: Colors.white,
            onTap: (){
              setState(() => isExpanded = !isExpanded);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Image.asset(widget.productItem.image),
                  radius: 28.0,
                ),
                SizedBox(width: 10.0),
                Text("1x", style: TextStyle(color: Colors.white)),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.productItem.name,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700)),
                      Text(widget.productItem.category,
                          style: TextStyle(color: Colors.white, fontSize: 12.0)),
                    ],
                  ),
                ),
                Text("₦${widget.productItem.price}",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0))
              ],
            ),
          ),
          isExpanded ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(icon: Icon(MdiIcons.deleteOutline, color: Colors.white, size: 30.0), onPressed: (){}, padding: EdgeInsets.symmetric(vertical: 30.0)),
              Expanded(child: SizedBox()),
              CircleAvatar(backgroundColor: Colors.white, child: IconButton(icon: Icon(MdiIcons.minus), color: Colors.white, onPressed: null)),
              SizedBox(width: 12.0),
              Text("2", style: TextStyle(color: Colors.white)),
              SizedBox(width: 12.0),
              CircleAvatar(backgroundColor: Colors.white, child: IconButton(icon: Icon(MdiIcons.plus), color: Colors.white, onPressed: null)),
            ],
          ): SizedBox()
        ],
      ),
    );
  }
}
