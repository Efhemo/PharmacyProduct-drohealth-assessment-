import 'package:pharmacy_product/model/product_item.dart';
import 'package:pharmacy_product/viewmodels/base_viewmodel.dart';

class ProductViewModel extends BaseViewModel<ProductItem> {
  List<ProductItem> products;
  List<ProductItem> searchedProducts = List.empty(growable: true);

  Map<String, ProductItem> productsInBag = Map();
  ProductItem currentProduct;
  int totalPriceOfProductInBag = 0;
  double modalInitSize = 0.12;

  void setCurrentProduct(String productId) {
    currentProduct = products.firstWhere((element) => productId == element.productId);
    modalInitSize = 0.12;
  }

  bool isShowSearchBar = false;

  ProductViewModel(this.products) {
    searchedProducts = products;
    notifyListeners();
  }
  
  void searchQuery(String query){
    searchedProducts = products.where((element){
      if (query.isNotEmpty){
      return element.name.toLowerCase().contains(query.toLowerCase()) ||
          element.category.toLowerCase().contains(query.toLowerCase()) ||
          element.constituent.toLowerCase().contains(query.toLowerCase());
      } else {
        searchedProducts = products;
        return true;
      }
    }).toList();
    notifyListeners();
  }

  void toggleShowSearchbar() {
    isShowSearchBar = !isShowSearchBar;
    if(!isShowSearchBar){searchQuery("");}
    notifyListeners();
  }

  void setModalInitSize(){
    modalInitSize = 1;
    notifyListeners();
  }

  void addToBag(int totalQuantity, Function(String) showConfirmDialog ) {
    currentProduct.quantity = totalQuantity;
    productsInBag[currentProduct.productId] = currentProduct;
    _calculateTotalPriceInBag();
    notifyListeners();
    showConfirmDialog(currentProduct.name);
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
    _calculateTotalPriceInBag();
    notifyListeners();
  }

  void removeFromBag(String productId){
    productsInBag.removeWhere((key, value) => productId == key);
    _calculateTotalPriceInBag();
    notifyListeners();
  }

  void _calculateTotalPriceInBag() {
    totalPriceOfProductInBag = 0;
    productsInBag.values.forEach((e) {
      totalPriceOfProductInBag += e.totalPrice();
    });
  }
}
