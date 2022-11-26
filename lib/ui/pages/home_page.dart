import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/models/category_model.dart';
import 'package:menuapp/providers/category_provider.dart';
import 'package:menuapp/providers/product_provider.dart';
import 'package:menuapp/services/firestore_service.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/category_widget.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/item_food_widget.dart';
import 'package:menuapp/ui/widgets/text_custom_widget.dart';
import 'package:menuapp/utils/assets_data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      CategoryProvider categoryProvider =
          Provider.of<CategoryProvider>(context, listen: false);

      ProductProvider productProvider =
          Provider.of<ProductProvider>(context, listen: false);

      categoryProvider.getCategoryData();
      productProvider.getProductData();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                H1(text: "Bievenido a"),
                H1(
                  text: "Las espadas de Ramón",
                  color: kBrandPrimaryColor,
                ),
                spacing14,
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 12,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Busca tu plato favorito",
                      hintStyle: TextStyle(
                        fontSize: 13.0,
                        color: kBrandSecondaryColor.withOpacity(0.55),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14.0, vertical: 15.0),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20.0,
                        color: kBrandSecondaryColor.withOpacity(0.55),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                spacing20,
                Consumer<CategoryProvider>(
                  builder: (context, provider, _) {
                    return !provider.isLoading
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            child: Row(
                              children: provider.categories
                                  .map(
                                    (e) => CategoryWidget(
                                      model: e,
                                      isSelected:
                                          provider.categorySelected == e.id,
                                      onTap: () {
                                        provider.changeCategorySelected(e.id!);
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        : const CircularProgressIndicator();
                  },
                ),
                spacing20,
                Consumer<ProductProvider>(
                  builder: (context, provider, _) {
                    return !provider.isLoading ? Column(
                      children: provider.products
                          .map(
                            (e) => ItemFoodWidget(productModel: e),
                          )
                          .toList(),
                    ) : const Center(child: CircularProgressIndicator(),);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}