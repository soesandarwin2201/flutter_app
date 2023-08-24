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
  late int size;
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
    image = data[IMAGE];
    name = data[NAME];
    category = data[CATEGORY];
    details = data[DETAILS];
    size = data[SIZE];
    ingredients = data[INGREDIENTS];
    price = data[PRICE] ?? "0"; // Initialize with "0" if it's null
  }
}
