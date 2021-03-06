import 'package:flutter/material.dart';
import 'package:pharmacy_product/ui/screens/screens.dart';
import 'package:pharmacy_product/ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pharmacy_product/viewmodels/product_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Consumer<ProductViewModel>(builder: (context, provider, child) {
            final pharmacyProducts = provider.searchedProducts;
            return Scaffold(
              appBar: AppBar(
                leading: Icon(Icons.arrow_back),
                title: Text(
                  "${pharmacyProducts.length} item(s)",
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
                            CircleButton(
                                icon: Icons.search,
                                onTap: () => provider.toggleShowSearchbar()),
                          ],
                        )),
                  ),
                  SliverToBoxAdapter(
                    child: provider.isShowSearchBar
                        ? CustomSearchBar(
                            updateSearchQuery: (query) {
                              provider.searchQuery(query);
                            },
                          )
                        : SizedBox.shrink(),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      mainAxisSpacing: 4.0,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = pharmacyProducts[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ProductCard(
                            productItem: item,
                            onTap: (product) => Navigator.pushNamed(
                                context, "/productDetails",
                                arguments: product)),
                      );
                    }, childCount: pharmacyProducts.length),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 85),
                  )
                ],
              ),
            );
          }),
          ProductBagScreen()
        ],
      ),
    );
  }
}
