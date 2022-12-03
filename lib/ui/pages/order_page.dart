import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/models/order_model.dart';
import 'package:menuapp/models/product_order_model.dart';
import 'package:menuapp/providers/order_provider.dart';
import 'package:menuapp/services/firestore_service.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/text_custom_widget.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {

  MyFirestoreService orderService = MyFirestoreService(collection: "orders");

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    OrderProvider orderProvider =
        Provider.of<OrderProvider>(context, listen: true);

    // _order.get().then((value){
    //   QueryDocumentSnapshot doc = value.docs.first;
    //   print(OrderModel.fromJson(doc.data() as Map<String, dynamic>));
    // });

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H1(
                      text: "Mis Ordenes",
                    ),
                    ...orderProvider.orders.map(
                      (ProductOrderModel e) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 7.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(14.0),
                              child: Image.network(
                                e.image,
                                width: 80,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            spacingWidth10,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  H5(
                                    text: e.title,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  spacing3,
                                  H6(text: "Cant. ${e.quantity}"),
                                  spacing3,
                                  InkWell(
                                    onTap: () {
                                      orderProvider.removeProduct(e);
                                    },
                                    child: H6(text: "Eliminar"),
                                  ),
                                ],
                              ),
                            ),
                            H5(
                              text: "S/ ${e.price.toStringAsFixed(2)}",
                              fontWeight: FontWeight.w600,
                              color: kBrandSecondaryColor.withOpacity(0.75),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.07),
                  blurRadius: 20,
                  offset: const Offset(0, -4),
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28.0),
                topRight: Radius.circular(28.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    H3(
                      text: " Total:",
                    ),
                    H3(text: "S/ ${orderProvider.total.toStringAsFixed(2)} "),
                  ],
                ),
                spacing10,
                Container(
                  height: 54.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 0.0),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {

                      OrderModel orderModel = OrderModel(
                        consumer: "David Moreno",
                        date: "2022-12-12",
                        time: "16:22",
                        total: 140.21,
                        status: "Pendiente",
                        products: orderProvider.orders,
                      );


                      orderService.registerOrder(orderModel);


                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBrandPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: H4(
                      text: "Realizar pedido",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}