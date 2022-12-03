

import 'package:flutter/material.dart';
import 'package:menuapp/models/order_model.dart';
import 'package:menuapp/services/firestore_service.dart';

class OrderAdminProvider extends ChangeNotifier{

  List<OrderModel> orders = [];
  bool isLoading = true;
  final MyFirestoreService _orderService = MyFirestoreService(collection: "orders");

  Future<void> getOrderData() async{
    isLoading = true;
    notifyListeners();
    orders = await _orderService.getOrders();
    isLoading = false;
    notifyListeners();
  }

}