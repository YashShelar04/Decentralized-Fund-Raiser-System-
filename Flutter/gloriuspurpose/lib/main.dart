import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gloriuspurpose/colors.dart';
import 'package:gloriuspurpose/screens/auth/signupscreen.dart';
import 'package:get/get.dart';
import 'package:gloriuspurpose/screens/navigationscreen.dart';
import 'package:gloriuspurpose/services/infomanager.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Infomanager.initializePrefs();
  await Firebase.initializeApp();
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