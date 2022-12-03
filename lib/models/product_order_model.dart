class ProductOrderModel {
  String id;
  String title;
  double price;
  String image;
  int quantity;

  ProductOrderModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
  });

  factory ProductOrderModel.fromJson(Map<String, dynamic> json) =>
      ProductOrderModel(
        id: json["id"] ?? "",
        title: json["title"],
        price: json["price"],
        image: json["image"] ?? "",
        quantity: json["quantity"] ?? 0,
      );

  Map<String, dynamic> toJson()=>{
    "id": id,
    "title": title,
    "price": price,
    "image": image,
    "quantity": quantity,
  };

}