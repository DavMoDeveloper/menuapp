

import 'package:flutter/material.dart';
import 'package:menuapp/models/product_model.dart';
import 'package:menuapp/services/firestore_service.dart';

class ProductProvider extends ChangeNotifier{

  List<ProductModel> products = [];
  bool isLoading = true;
  final MyFirestoreService _productService = MyFirestoreService(collection: "products");

  Future<void> getProductData() async {
    isLoading = true;
    notifyListeners();
    products = await _productService.getProducts();
    isLoading = false;
    notifyListeners();
  }


}