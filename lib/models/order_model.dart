import 'package:menuapp/models/product_order_model.dart';

class OrderModel {
  String? id;
  String consumer;
  String date;
  String time;
  double total;
  String status;
  List<ProductOrderModel> products;

  OrderModel(
      {this.id,
      required this.consumer,
      required this.date,
      required this.time,
      required this.total,
      required this.status,
      required this.products});

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        consumer: json["consumer"],
        date: json["date"],
        time: json["time"],
        total: json["total"],
        status: json["status"],
        products: List<ProductOrderModel>.from(json["products"].map((e)=> ProductOrderModel.fromJson(e))),
      );

  Map<String, dynamic> toJson()=> {
    "id": id,
    "consumer": consumer,
    "date": date,
    "time": time,
    "total": total,
    "status": status,
    "products": List<dynamic>.from(products.map((e) => e.toJson())),
  };


}
