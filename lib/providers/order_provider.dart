import 'package:flutter/cupertino.dart';
import 'package:menuapp/models/product_order_model.dart';

class OrderProvider extends ChangeNotifier{
  
  List<ProductOrderModel> orders = [];
  double total = 0;

  addProduct(ProductOrderModel model){
    orders.add(model);
    notifyListeners();
  }

  removeProduct(ProductOrderModel model){
    orders.remove(model);
    notifyListeners();
  }
}