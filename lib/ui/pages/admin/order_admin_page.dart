

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menuapp/providers/order_admin_provider.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/text_custom_widget.dart';
import 'package:provider/provider.dart';

class OrderAdminPage extends StatefulWidget {
  @override
  State<OrderAdminPage> createState() => _OrderAdminPageState();
}

class _OrderAdminPageState extends State<OrderAdminPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      OrderAdminProvider orderAdminProvider = Provider.of<OrderAdminProvider>(context, listen: false);
      orderAdminProvider.getOrderData();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                H1(
                  text: "Listado de ordenes",
                ),
                H6(
                  text: "Ordenes actuales por revisar",
                  color: kBrandSecondaryColor.withOpacity(0.60),
                ),
                spacing20,
                Consumer<OrderAdminProvider>(
                  builder: (context, provider, _){
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: provider.orders.length,
                      itemBuilder: (context, index){
                        return Text(provider.orders[index].toJson().toString());
                      },
                    );
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}