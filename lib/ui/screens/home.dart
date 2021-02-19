import 'package:flutter/material.dart';
import 'package:pharmacy_product/data/dart.dart';
import 'package:pharmacy_product/ui/screens/screens.dart';
import 'package:pharmacy_product/ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.arrow_back),
              title: Text(
                "124 item(s)",
                style: TextStyle(color: Colors.black, fontSize: 14.0),
              ),
              centerTitle: true,
            ),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: true,
                  centerTitle: true,
                  floating: true,
                  title: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleButton(icon: Icons.compare_arrows),
                          CircleButton(icon: MdiIcons.filterOutline),
                          CircleButton(icon: Icons.search),
                        ],
                      )),
                ),
                SliverToBoxAdapter(
                  child: CustomSearchBar(
                    updateSearchQuery: (query) {},
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 4.0,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = products[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ProductCard(productItem: item),
                    );
                  }, childCount: products.length),
                ),
              ],
            ),
          ),
          ProductBagScreen()
        ],
      ),
    );
  }
}
