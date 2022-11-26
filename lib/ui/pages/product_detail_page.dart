import 'package:flutter/material.dart';
import 'package:menuapp/models/product_model.dart';
import 'package:menuapp/models/product_order_model.dart';
import 'package:menuapp/providers/category_provider.dart';
import 'package:menuapp/providers/order_provider.dart';
import 'package:menuapp/providers/product_detail_provider.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/text_custom_widget.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  ProductModel model;

  String categoryTemp = '';

  ProductDetailPage({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    CategoryProvider categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    ProductDetailProvider productDetailProvider =
        Provider.of<ProductDetailProvider>(context, listen: false);
    categoryTemp = categoryProvider.categories
        .where((element) => element.id == model.category)
        .toList()
        .first
        .description;

    productDetailProvider.price = model.price;
    productDetailProvider.quantity = 1;
    productDetailProvider.tempPrice = model.price;

    return Scaffold(
      body: Stack(
        children: [
          //Fondo
          Column(
            children: [
              Image.network(
                model.image,
                height: height * 0.40,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
          //
          Column(
            children: [
              SizedBox(
                height: height * 0.35,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(38.0),
                      topLeft: Radius.circular(38.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ],
                      ),
                      spacing30,
                      H2(
                        text: model.title,
                        fontWeight: FontWeight.w600,
                      ),
                      spacing6,
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 9.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: kBrandPrimaryColor,
                            ),
                            child: H6(
                              text: categoryTemp,
                              color: Colors.white,
                            ),
                          ),
                          spacingWidth6,
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18.0,
                          ),
                          H5(text: model.rate.toDouble().toString()),
                        ],
                      ),
                      spacing14,
                      H5(
                        text: model.description,
                        height: 1.48,
                        color: kBrandSecondaryColor.withOpacity(0.65),
                      ),
                      spacing10,
                      H4(
                        text: "Ingredientes",
                        fontWeight: FontWeight.w600,
                      ),
                      spacing10,
                      Wrap(
                        runSpacing: 0,
                        spacing: 12.0,
                        children: model.ingredients
                            .map(
                              (e) => Chip(
                                label: Text(e),
                                backgroundColor:
                                    Colors.black12.withOpacity(0.06),
                              ),
                            )
                            .toList(),
                      ),
                      spacing14,
                      Consumer<ProductDetailProvider>(
                        builder: (context, provider, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              H2(
                                // text: "S/ ${model.price.toStringAsFixed(2)}",
                                text: "S/ ${provider.price.toStringAsFixed(2)}",
                                fontWeight: FontWeight.w600,
                                color: kBrandPrimaryColor,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Colors.black12.withOpacity(0.06),
                                    borderRadius: BorderRadius.circular(30.0)),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: provider.quantity > 1
                                          ? () {
                                              provider.removeQuantity();
                                            }
                                          : null,
                                      child: Container(
                                        padding: const EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: provider.quantity > 1
                                              ? Colors.black87
                                              : Colors.black12,
                                        ),
                                        child: Icon(
                                          Icons.remove,
                                          size: 16.0,
                                          color: provider.quantity > 1
                                              ? Colors.white
                                              : Colors.black87,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      alignment: Alignment.center,
                                      child: H5(
                                        text: provider.quantity.toString(),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        provider.addQuantity();
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(4.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black87,
                                        ),
                                        child: const Icon(Icons.add,
                                            size: 16.0, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 54.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    ProductOrderModel product = ProductOrderModel(
                      id: model.id!,
                      title: model.title,
                      price: productDetailProvider.price,
                      image: model.image,
                      quantity: productDetailProvider.quantity,
                    );
                    OrderProvider _orderProvider =
                        Provider.of<OrderProvider>(context, listen: false);
                    _orderProvider.addProduct(product);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kBrandPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  child: H4(text: "Agregar orden")),
            ),
          )
        ],
      ),
    );
  }
}
