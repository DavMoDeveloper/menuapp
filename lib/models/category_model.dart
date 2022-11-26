class CategoryModel {

  String? id;
  String description;
  bool status;

  CategoryModel({
    this.id,
    required this.description,
    required this.status,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json)=>
      CategoryModel(
        id: json["id"] ?? "",
        description: json["description"],
        status: json["status"],
      );

  Map<String, dynamic> toJson()=> {
    "id": id,
    "description": description,
    "status": status,
  };

}