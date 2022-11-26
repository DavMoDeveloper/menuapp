import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:menuapp/models/category_model.dart';
import 'package:menuapp/models/product_model.dart';

class MyFirestoreService {
  String collection;

  MyFirestoreService({
    required this.collection,
  });

  late final CollectionReference _reference =
      FirebaseFirestore.instance.collection(collection);

  Future<List<CategoryModel>> getCategories() async {
    QuerySnapshot collection = await _reference.get();
    List<QueryDocumentSnapshot> docs = collection.docs;
    List<CategoryModel> categories = [];
    for (var item in docs) {
      CategoryModel model =
          CategoryModel.fromJson(item.data() as Map<String, dynamic>);
      model.id = item.id;
      categories.add(model);
    }
    return categories;
  }

  Future<List<ProductModel>> getProducts() async {
    QuerySnapshot collection = await _reference.get();
    List<QueryDocumentSnapshot> docs = collection.docs;
    List<ProductModel> products = [];
    for (var item in docs) {
      ProductModel model =
          ProductModel.fromJson(item.data() as Map<String, dynamic>);
      model.id = item.id;
      products.add(model);
    }
    return products;
  }

}