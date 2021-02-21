
class ProductItem {
  final String name;
  final String image;
  final String price;
  final String description;
  final String category;
  final String company;
  final String packSize;
  final String constituent;
  int quantity = 1;
  final String dispenseType;
  final String productId;

  ProductItem({this.name, this.image, this.price, this.description, this.category, this.company, this.packSize, this.constituent, this.dispenseType, this.productId});

  int totalPrice() => quantity * int.parse(price);

  @override
  String toString() {
    return 'ProductItem{name: $name, image: $image, price: $price, description: $description, category: $category, company: $company, packSize: $packSize, constituent: $constituent, quantity: $quantity, dispenseType: $dispenseType, productId: $productId}';
  }
}