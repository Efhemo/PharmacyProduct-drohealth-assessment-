import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_product/ui/config/palette.dart';
import 'package:pharmacy_product/ui/widgets/widgets.dart';
import 'package:pharmacy_product/viewmodels/product_viewmodel.dart';
import 'package:provider/provider.dart';


class ProductBagScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, provider, child) {
        final productsInBag = provider.productsInBag.values.toList();
        return DraggableScrollableActuator(
          child: DraggableScrollableSheet(
            initialChildSize: provider.modalInitSize,
            minChildSize: 0.12,
            maxChildSize: 1,
            builder: (BuildContext context, scrollController) {
              return Container(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
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
                              margin: EdgeInsets.only(top: 20.0),
                              child: Row(
                                children: [
                                  Image.asset("assets/icons/shopping_bag.png", height: 25.0, width: 25.0,color: Colors.white),
                                  SizedBox(width: 10.0),
                                  Text("Bag", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold )),
                                  Expanded(child: SizedBox()),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                      child: Text(productsInBag.length.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold )),
                                  ),
                                ],
                              ),
                            ),
                            productsInBag.isNotEmpty ? Container(
                              margin: EdgeInsets.only(top: 12.0),
                              padding: EdgeInsets.symmetric(vertical:4.0, horizontal: 12.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                                child: Text("Tap on an item for add, delete, options")
                            ) : SizedBox.shrink()
                          ],
                        ),
                      ),
                      Container(
                        color: Palette.darkPurple,
                        height: MediaQuery.of(context).size.height * 0.69,
                        child: ListView.builder(
                          itemCount: productsInBag.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BagItem(productItem: productsInBag[index]),
                            );
                          },
                        ),
                      ),
                      Container(
                          color: Palette.darkPurple,
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
                              Consumer<ProductViewModel>(
                                builder: (context, provider, child) {
                                  return Text("₦${provider.totalPriceOfProductInBag}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0));
                                }
                              )
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
    );
  }

}