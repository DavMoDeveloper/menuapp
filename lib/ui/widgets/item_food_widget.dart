import 'package:flutter/material.dart';
import 'package:menuapp/models/product_model.dart';
import 'package:menuapp/providers/category_provider.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/pages/product_detail_page.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/text_custom_widget.dart';
import 'package:provider/provider.dart';

class ItemFoodWidget extends StatefulWidget {
  ProductModel productModel;
  ItemFoodWidget({
    required this.productModel,
  });
  @override
  State<ItemFoodWidget> createState() => _ItemFoodWidgetState();
}

class _ItemFoodWidgetState extends State<ItemFoodWidget> {

  String categoryTemp = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    CategoryProvider categoryProvider =
    Provider.of<CategoryProvider>(context, listen: false);
    categoryTemp = categoryProvider.categories
        .where((element) => element.id == widget.productModel.category)
        .toList()
        .first
        .description;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(model: widget.productModel),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                widget.productModel.image,
                width: width * 0.22,
                height: height * 0.14,
                fit: BoxFit.cover,
              ),
            ),
            spacingWidth10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  spacing6,
                  H4(
                    text: widget.productModel.title,
                    fontWeight: FontWeight.w600,
                  ),
                  spacing3,
                  H6(
                    text: widget.productModel.description,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  spacing6,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 18.0,
                            color: Colors.amber,
                          ),
                          spacingWidth6,
                          H6(
                            text: widget.productModel.rate.toDouble().toString(),
                            color: kBrandSecondaryColor.withOpacity(0.70),
                          ),
                        ],
                      ),
                      H4(
                        text: "S/ ${widget.productModel.price.toStringAsFixed(2)}",
                        fontWeight: FontWeight.w600,
                        color: kBrandPrimaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}