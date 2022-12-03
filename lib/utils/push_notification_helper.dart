
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationHelper{

  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static initApp() async{
    String token = await messaging.getToken() ?? "";
    print(token);
    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);
  }
   static Future _onMessage(RemoteMessage message) async{
      print("CASE 1");
      if(message.notification != null){
        print(message.notification!.title);
        print(message.notification!.body);
      }
   }
   static Future _onBackgroundMessage(RemoteMessage message) async{
     print("CASE 2");
     if(message.notification != null){
       print(message.notification!.title);
       print(message.notification!.body);
     }
   }
   static Future _onMessageOpenedApp(RemoteMessage message) async{
     print("CASE 3");
     if(message.notification != null){
       print(message.notification!.title);
       print(message.notification!.body);
     }
   }


}