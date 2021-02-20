
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

  set (int totalQuantity) {
    this.quantity = totalQuantity;
  }

  int totalPrice() => quantity * int.parse(price);

  @override
  List<Object> get props => [this.name, this.image, this.description, this.category];

}