import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:menuapp/models/category_model.dart';
import 'package:menuapp/models/order_model.dart';
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
    for(var item in docs){
      ProductModel productModel = ProductModel.fromJson(item.data() as Map<String, dynamic>);
      productModel.id = item.id;
      products.add(productModel);
    }
    return products;
  }

  registerOrder(OrderModel model) async{
    DocumentReference doc = await _reference.add(model.toJson());
    print(doc.id);
  }

  Future<List<OrderModel>> getOrders() async{
    QuerySnapshot collection = await _reference.get();
    List<QueryDocumentSnapshot> docs = collection.docs;
    List<OrderModel> orders = [];
    for(var item in docs){
      OrderModel orderMoldel = OrderModel.fromJson(item.data() as Map<String, dynamic>);
      orders.add(orderMoldel);
    }
    return orders;
  }




}