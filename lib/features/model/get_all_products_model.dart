
class GetAllProductsModel {
  final int id;
  final String title;
  final double price;
  final String? description;
  // final Category category;
  final String image;
  // final Rating? rating;

  GetAllProductsModel({
    required this.id,
    required this.title,
    required this.price,
    this.description,
    //  required this.category,
    required this.image,
    //  this.rating,
  });

  factory GetAllProductsModel.fromJson(Map<String, dynamic> json) =>
      GetAllProductsModel(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        description: json["description"],
        //  category: categoryValues.map[json["category"]]!,
        image: json["image"],
        // rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );
}
