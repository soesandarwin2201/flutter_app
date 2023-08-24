class ProductModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const CATEGORY = "category";
  static const PRICE = "price";
  static const SIZE = "size";
  static const DETAILS = "details";
  static const INGREDIENTS = "ingredients";
  static const INGREDIENT1 = "ingredient1";
  static const INGREDIENT2 = "ingredient2";

  late String id;
  late String image;
  late String name;
  late String category;
  late double price; // Change this to String
  late String size;
  late String ingredients;
  late String ingredient1;
  late String ingredient2;
  late String details;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.category,
    required this.details,
    required this.ingredients,
    required this.ingredient1,
    required this.ingredient2,
    required this.size,
  });

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE] ?? "0";
    name = data[NAME] ?? "ALNA SkinCare Products";
    category = data[CATEGORY] ?? "Skincare";
    details = data[DETAILS] ?? "SKincare Routunine";
    size = data[SIZE] ?? "500";
    ingredients = data[INGREDIENTS] ?? "Honey";
    ingredient1 = data[INGREDIENT1] ?? "Jojoba";
    ingredient2 = data[INGREDIENT2] ?? "Gluta";
    price = (data[PRICE] ?? 0.0).toDouble(); // Initialize with "0" if it's null
  }
}
