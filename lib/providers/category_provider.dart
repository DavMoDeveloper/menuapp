

import 'package:flutter/material.dart';
import 'package:menuapp/models/category_model.dart';
import 'package:menuapp/services/firestore_service.dart';

class CategoryProvider extends ChangeNotifier{

  List<CategoryModel> categories = [];
  String categorySelected = "";
  bool isLoading = true;
  final MyFirestoreService _myFirestoreService = MyFirestoreService(collection: "categories");

  Future<void> getCategoryData() async{
    categories = await _myFirestoreService.getCategories();
    CategoryModel categoryModel = CategoryModel(description: "Todos", status: true, id: "-");
    categories.insert(0, categoryModel);
    categorySelected = categories.first.id!;
    isLoading = false;
    notifyListeners();
  }

  void changeCategorySelected(String value){
    categorySelected = value;
    notifyListeners();
  }


}
