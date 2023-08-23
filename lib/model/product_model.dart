class ProductModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const CATEGORY = "category"; // Use uppercase for constant names
  static const PRICE = "price";
  static const SIZE = "size"; // Use uppercase for constant names
  static const DETAILS = "details";
  static const INGREDIENTS = "ingredients";
  static const INGREDIENT1 = "ingredient1"; // Use uppercase for constant names
  static const INGREDIENT2 = "ingredient2"; // Use uppercase for constant names
  static const INGREDIENT3 = "ingredient3"; // Use uppercase for constant names
  static const INGREDIENT4 = "ingredient4"; // Use uppercase for constant names

  String id;
  String image;
  String name;
  String category;
  double price; // Use double instead of Int
  int size;
  String ingredients;
  String ingredient1;
  String ingredient2;
  String ingredient3;
  String ingredient4;
  String details;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.category,
    required this.details,
    required this.ingredient1,
    required this.ingredient2,
    required this.ingredient3,
    required this.ingredient4,
    required this.ingredients,
    required this.size,
  });

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    category = data[CATEGORY];
    details = data[DETAILS];
    size = data[SIZE];
    ingredients = data[INGREDIENTS];
    ingredient1 = data[INGREDIENT1];
    ingredient2 = data[INGREDIENT2];
    ingredient3 = data[INGREDIENT3];
    ingredient4 = data[INGREDIENT4];
    price = data[PRICE].toDouble();
  }
}
