class ProductModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const CATEGORY = "category";
  static const PRICE = "price";
  static const SIZE = "size";
  static const DETAILS = "details";
  static const INGREDIENTS = "ingredients";

  late String id;
  late String image;
  late String name;
  late String category;
  late String price; // Change this to String
  late String size;
  late String ingredients;
  late String details;

  ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.category,
    required this.details,
    required this.ingredients,
    required this.size,
  });

  ProductModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE] ?? "0";
    name = data[NAME] ?? "0";
    category = data[CATEGORY] ?? "0";
    details = data[DETAILS] ?? "0";
    size = data[SIZE] ?? "0";
    ingredients = data[INGREDIENTS] ?? "0";
    price = data[PRICE] ?? "0"; // Initialize with "0" if it's null
  }
}
