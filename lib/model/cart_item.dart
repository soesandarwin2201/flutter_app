class CartItemModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const Name = "name";
  static const QUANTITY = "quantity";
  static const COST = "cost";
  static const PRICE = "price";
  static const PRODUCT_ID = "productId";

  String id;
  String image;
  String name;
  int quantity;
  double cost;
  String productId;
  double price;

  CartItemModel(
      {required this.productId,
      required this.id,
      required this.image,
      required this.name,
      required this.quantity,
      required this.cost,
      required this.price});

  Map toJson() => {
        ID: id,
        PRODUCT_ID: productId,
        IMAGE: image,
        NAME: name,
        QUANTITY: quantity,
        COST: price * quantity,
        PRICE: price
      };
}
