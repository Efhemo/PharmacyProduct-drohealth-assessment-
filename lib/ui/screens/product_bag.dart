import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_product/ui/config/palette.dart';

class ProductBagScreen extends StatefulWidget {

  @override
  _ProductBagScreenState createState() => _ProductBagScreenState();
}

class _ProductBagScreenState extends State<ProductBagScreen> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableActuator(
      child: DraggableScrollableSheet(
        initialChildSize: 0.085,
        minChildSize: 0.085,
        maxChildSize: 1,
        builder: (BuildContext context, scrollController) {
          return Container(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: Palette.darkPurple,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0)
                        )
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white
                          ),
                          height: 3.0,
                          width: 40.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12.0),
                          child: Row(
                            children: [
                              Image.asset("assets/icons/shopping_bag.png", height: 25.0, width: 25.0,color: Colors.white,),
                              SizedBox(width: 10.0),
                              Text("Bag", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold )),
                              Expanded(child: SizedBox()),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                  child: Text("3", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12.0),
                          padding: EdgeInsets.symmetric(vertical:4.0, horizontal: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Text("Tap on an item for add, delete, options")
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Palette.darkPurple,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      itemCount: 25,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            title: Text('Bag $index', style: TextStyle(color: Colors.black54),));
                      },
                    ),
                  ),
                  Container(
                      color: Palette.darkPurple,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
                          Text("₦6230", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),)
                        ],
                      ),
                      SizedBox(height: 12.0),
                      RawMaterialButton(
                        onPressed: (){},
                        fillColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 100.0),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        child: Text("Checkout", style: TextStyle(fontWeight: FontWeight.bold, ),),
                      )
                    ],
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}