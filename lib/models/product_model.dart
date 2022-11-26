class ProductModel {

  String? id;
  String title;
  String description;
  String image;
  int rate;
  double price;
  List<String> ingredients;
  bool status;
  String category;

  ProductModel({
    this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.rate,
    required this.price,
    required this.ingredients,
    required this.status,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json)=>
      ProductModel(
        title: json["title"],
        description: json["description"],
        image: json["image"],
        rate: json["rate"].toInt(),
        price: json["price"].toDouble(),
        ingredients: List<String>.from(json["ingredients"].map((e) => e),),
        status: json["status"],
        category: json["category"],
      );

  Map<String, dynamic> toJson()=> {
    "title": title,
    "rate": rate,
    "category": category,
  };

}