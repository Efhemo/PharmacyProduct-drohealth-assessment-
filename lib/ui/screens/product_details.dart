import 'package:flutter/material.dart';
import 'package:pharmacy_product/ui/config/palette.dart';
import 'package:pharmacy_product/ui/model/product_item.dart';
import 'package:pharmacy_product/ui/widgets/set_amount_packs.dart';
import 'package:pharmacy_product/ui/widgets/widgets.dart';
import 'package:pharmacy_product/viewmodels/product_viewmodel.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductItem productItem;

  const ProductDetails(this.productItem);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int totalQuantity;

  @override
  void initState() {
    Provider.of<ProductViewModel>(context, listen: false)
        .setCurrentProduct(widget.productItem.productId);
    totalQuantity = widget.productItem.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/icons/shopping_bag.png",
                    height: 20.0, width: 20.0, color: Colors.white),
                SizedBox(width: 8.0),
                Consumer<ProductViewModel>(builder: (context, provider, child) {
                  return Text(provider.productsInBag.length.toString());
                })
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Palette.darkPurple),
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
                    Align(
                        child:
                            Image.asset(widget.productItem.image, height: 200),
                        alignment: Alignment.center),
                    SizedBox(height: 24.0),
                    Text(widget.productItem.name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0)),
                    Text(widget.productItem.category,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0)),
                    SizedBox(height: 24.0),
                    Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset(widget.productItem.image),
                          radius: 24.0,
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("SOLD BY",
                                style: TextStyle(
                                    color: Colors.grey[300], fontSize: 16.0)),
                            Text(widget.productItem.company,
                                style: TextStyle(
                                    color: Palette.darkGreen,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 24.0),
                    Consumer<ProductViewModel>(
                        builder: (context, provider, child) {
                      return AmountPacks(
                        quantity: provider.currentProduct.quantity,
                        initPrice: int.parse(widget.productItem.price),
                        onChangeTotalQuantity: (quantity) {
                          totalQuantity = quantity;
                        },
                      );
                    }),
                    SizedBox(height: 40.0),
                    Text("PRODUCT DETAILS",
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0)),
                    SizedBox(height: 25.0),
                    Row(
                      children: [
                        customListTile("assets/icons/multicapsule.png",
                            "PACK SIZE", widget.productItem.packSize),
                        SizedBox(width: 70),
                        customListTile("assets/icons/qr_code.png", "PRODUCT IN",
                            widget.productItem.productId),
                      ],
                    ),
                    SizedBox(height: 25),
                    customListTile("assets/icons/capsule.png", "CONSTITUENTS",
                        widget.productItem.constituent),
                    SizedBox(height: 25),
                    customListTile("assets/icons/dispense.png", "DISPENSE IN",
                        widget.productItem.dispenseType),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: () {
              Provider.of<ProductViewModel>(context, listen: false)
                  .addToBag(totalQuantity, (productName) {
                showConfirmDialog(context, productName);
              });
            },
            color: Palette.darkPurple,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100),
            icon: Image.asset("assets/icons/shopping_bag.png",
                height: 20.0, width: 20.0, color: Colors.white),
            label: Text("Add to bag", style: TextStyle(color: Colors.white)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          )
        ],
      ),
    );
  }

  void showConfirmDialog(BuildContext context, String productName) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: productName,
            onDoneClick: (onDone) {
              if (onDone) {
                Navigator.pop(context);
              } else {
                Navigator.popUntil(context, (route) => route.isFirst);
              }
            },
          );
        });
  }
}
