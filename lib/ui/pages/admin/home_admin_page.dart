import 'package:flutter/material.dart';
import 'package:menuapp/ui/general/colors.dart';
import 'package:menuapp/ui/pages/admin/dashboard_page.dart';
import 'package:menuapp/ui/pages/admin/order_admin_page.dart';
import 'package:menuapp/ui/widgets/general_widget.dart';
import 'package:menuapp/ui/widgets/item_admin_menu_widget.dart';
import 'package:menuapp/ui/widgets/text_custom_widget.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({Key? key}) : super(key: key);

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
                  text: "Panel Administrativo",
                ),
                H6(
                  text: "Opciones generales para la gestión de la empresa",
                  color: kBrandSecondaryColor.withOpacity(0.60),
                ),
                spacing20,
                ItemAdminMenuWidget(
                  title: "Ordenes",
                  subtitle: "Listado de ordenes actuales",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderAdminPage()));
                  },
                ),
                ItemAdminMenuWidget(
                  title: "Gestión de categorías",
                  subtitle: "Gestión de los datos de las categorías",
                  onTap: (){

                  },
                ),
                ItemAdminMenuWidget(
                  title: "Gestión de productos",
                  subtitle: "Gestión de los datos de los productos",
                  onTap: (){

                  },
                ),
                ItemAdminMenuWidget(
                  title: "Reportes",
                  subtitle: "Reportes generales de la empresa",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DashboardPage()));
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