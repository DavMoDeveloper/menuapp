import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menuapp/providers/category_provider.dart';
import 'package:menuapp/providers/order_admin_provider.dart';
import 'package:menuapp/providers/order_provider.dart';
import 'package:menuapp/providers/product_detail_provider.dart';
import 'package:menuapp/providers/product_provider.dart';
import 'package:menuapp/ui/pages/admin/home_admin_page.dart';
import 'package:menuapp/ui/pages/init_page.dart';
import 'package:menuapp/utils/push_notification_helper.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await PushNotificationHelper.initApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context)=> CategoryProvider()),
        ChangeNotifierProvider(create: (BuildContext context)=> ProductProvider()),
        ChangeNotifierProvider(create: (BuildContext context)=> ProductDetailProvider()),
        ChangeNotifierProvider(create: (BuildContext context)=> OrderProvider()),
        ChangeNotifierProvider(create: (BuildContext context)=> OrderAdminProvider()),
      ],
      child: MaterialApp(
        title: "MenuApp",
        theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(),
        ),
        home: HomeAdminPage(),
      ),
    );
  }
}