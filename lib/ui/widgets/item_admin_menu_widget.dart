import 'package:flutter/material.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/text_custom_widget.dart';

class ItemAdminMenuWidget extends StatelessWidget {
  String title;
  String subtitle;
  Function onTap;

  ItemAdminMenuWidget({
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: kBrandSecondaryColor.withOpacity(0.2),
          width: 0.9,
        ),
      ),
      child: ListTile(
        onTap: (){
          onTap();
        },
        title: H5(
          text: title,
        ),
        subtitle: H6(
          text: subtitle,
          color: kBrandSecondaryColor.withOpacity(0.60),
        ),
        trailing: const Icon(
          Icons.chevron_right,
        ),
      ),
    );
  }
}