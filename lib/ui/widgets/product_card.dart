import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_product/ui/config/palette.dart';
import 'package:pharmacy_product/ui/model/product_item.dart';

class ProductCard extends StatelessWidget {

  final ProductItem productItem;
  final Function(ProductItem) onTap;

  ProductCard({Key key, this.productItem, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap(productItem);
      },
      child: Card(
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 120.0,
                width: double.infinity,
                child: Image.asset(
                  productItem.image,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 8.0),
              Text(productItem.name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(productItem.category, style: TextStyle(fontSize: 12.0)),
              Text(productItem.description, style: TextStyle(fontSize: 12.0)),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                        color: Palette.grey,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "₦${productItem.price}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
