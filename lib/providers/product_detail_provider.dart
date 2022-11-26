

import 'package:flutter/material.dart';

class ProductDetailProvider extends ChangeNotifier{

  int quantity = 1;
  double price = 0;
  double tempPrice = 0;

  void addQuantity(){
    quantity++;
    price = tempPrice * quantity;
    notifyListeners();
  }

  void removeQuantity(){
    quantity--;
    price = tempPrice * quantity;
    notifyListeners();
  }

}