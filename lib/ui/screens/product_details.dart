import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pharmacy_product/ui/config/palette.dart';
import 'package:pharmacy_product/ui/model/product_item.dart';
import 'package:pharmacy_product/ui/widgets/widgets.dart';

class ProductDetails extends StatelessWidget {

  final ProductItem productItem;

  const ProductDetails(this.productItem);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back), onTap: (){Navigator.pop(context);},),
        actions: [
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/icons/shopping_bag.png", height: 20.0, width: 20.0, color: Colors.white),
                SizedBox(width: 8.0),
                Text("3")
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Palette.darkPurple
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(child: Image.asset(productItem.image, height: 200), alignment: Alignment.center),
                    SizedBox(height: 24.0),
                    Text(productItem.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 20.0)),
                    Text(productItem.category, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.0)),
                    SizedBox(height: 24.0),
                    Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset(productItem.image),
                          radius: 24.0,
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("SOLD BY", style: TextStyle(color: Colors.grey[300], fontSize: 16.0)),
                            Text(productItem.company, style: TextStyle(color: Palette.darkGreen,  fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.0),
                            border: Border.all(color: Colors.grey[500])
                          ),
                          child: Row(
                            children: [
                              IconButton(icon: Icon(MdiIcons.minus, size: 30.0), onPressed: null),
                              SizedBox(width: 18.0),
                              Text("1", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                              SizedBox(width: 12.0),
                              IconButton(icon: Icon(MdiIcons.plus, size: 30.0), onPressed: null),
                            ],
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text("Pack(s)"),
                        Expanded(child: SizedBox()),
                        Text("₦${productItem.price}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0))
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Text("PRODUCT DETAILS", style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w500, fontSize: 16.0)),
                    SizedBox(height: 25.0),
                    Row(
                      children: [
                        customListTile("assets/icons/multicapsule.png", "PACK SIZE", productItem.packSize),
                        SizedBox(width: 70),
                        customListTile("assets/icons/qr_code.png", "PRODUCT IN", productItem.productId),
                      ],
                    ),
                    SizedBox(height: 25),
                    customListTile("assets/icons/capsule.png", "CONSTITUENTS", productItem.constituent),
                    SizedBox(height: 25),
                    customListTile("assets/icons/dispense.png", "DISPENSE IN", productItem.dispenseType),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(onPressed: (){},
              color: Palette.darkPurple,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100),
              icon: Image.asset("assets/icons/shopping_bag.png", height: 20.0, width: 20.0, color: Colors.white),
              label: Text("Add to bag", style: TextStyle(color: Colors.white)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          )
        ],
      ),
    );
  }


}