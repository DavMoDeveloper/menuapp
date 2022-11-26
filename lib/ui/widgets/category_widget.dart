import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:menuapp/models/category_model.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/text_custom_widget.dart';
import 'package:menuapp/utils/assets_data.dart';

class CategoryWidget extends StatelessWidget {

  CategoryModel model;
  bool isSelected;
  Function onTap;

  CategoryWidget({
    required this.model,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        margin: const EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          color: isSelected ? kBrandPrimaryColor :  kBrandSecondaryColor.withOpacity(0.07),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SvgPicture.asset(
            //   AssetData.iconFavorite,
            //   height: 20.0,
            //   color: kBrandSecondaryColor.withOpacity(0.90),
            // ),
            // spacingWidth6,
            H5(
              text: model.description,
              color: isSelected ? Colors.white : kBrandSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}