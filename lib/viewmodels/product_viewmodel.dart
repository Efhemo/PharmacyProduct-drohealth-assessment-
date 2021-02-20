import 'package:pharmacy_product/ui/model/product_item.dart';
import 'package:pharmacy_product/viewmodels/base_viewmodel.dart';

class ProductViewModel extends BaseViewModel<ProductItem> {
  List<ProductItem> products;
  Map<String, ProductItem> productsInBag = Map();
  ProductItem currentProduct;

  void setCurrentProduct(String productId) {
    currentProduct = products.firstWhere((element) => productId == element.productId);
  }

  bool isShowSearchBar = false;

  ProductViewModel(this.products) {
    notifyListeners();
  }

  void toggleShowSearchbar() {
    isShowSearchBar = !isShowSearchBar;
    notifyListeners();
  }

  void addToBag(int totalQuantity) {
    currentProduct.quantity = totalQuantity;
    productsInBag[currentProduct.productId] = currentProduct;
    notifyListeners();
  }

  void modifyItemInBag(bool shouldIncrease, String productId) {
    productsInBag.update(productId, (value) {
      final quantity = value.quantity;
      if (shouldIncrease) {
        value.quantity = quantity + 1;
      } else {
        if (value.quantity > 1) {
          value.quantity = quantity - 1;
        }
      }
      return value;
    });
    notifyListeners();
  }

  void removeFromBag(String productId){
    productsInBag.removeWhere((key, value) => productId == key);
    notifyListeners();
  }

}
