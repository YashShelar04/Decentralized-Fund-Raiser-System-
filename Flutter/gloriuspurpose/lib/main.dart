import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gloriuspurpose/colors.dart';
import 'package:gloriuspurpose/screens/auth/signupscreen.dart';
import 'package:get/get.dart';
import 'package:gloriuspurpose/screens/navigationscreen.dart';
import 'package:gloriuspurpose/services/sharedprefsservice.dart';
import 'package:gloriuspurpose/services/notificationservices/localnotificationservice.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseMessaging.onMessage.listen((RemoteMessage message){
    NotificationService.showLocalNotification(message.notification!.title.toString(), message.notification!.body.toString(), "payload");
  });

  //Initialized Firebase App
  await Firebase.initializeApp();

  //Initializing the SharedPreferences
  await SharedPreferencesServices.initializePrefs();

  //Initializing Local Notification PLugin
  await NotificationService.initNotification();

  //Getting Device Token for Firebase Messaging
  await SharedPreferencesServices.storeDeviceToken();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glorius Purpose',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: myGreen,
            foregroundColor: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: myGreen,
          foregroundColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: auth.currentUser !=null ? NavigationScreen() : SignUpScreen(),
    );
  }
}