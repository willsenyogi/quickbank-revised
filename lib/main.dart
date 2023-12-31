import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';
import 'package:quickbank_revised/theme/theme_helper.dart';
import 'package:quickbank_revised/routes/app_routes.dart';

int accountBalance = 10000000; // Initial balance

//PIN value
var pinCode = "123456";

//virtual account transfer value temp
var vaValue = "";
var nominalVaValue = "";

//qb transfer value temp
var qbValue = "";
var nominalQbValue = "";
var notesQbValue = "";

//Transfer Bank Lain value temp
String? selectedBank;
var valueBL = "";
var nominalBLValue = "";
var notesBLValue = "";

//kartu value
var kartuKuning = "";
var kartuBiru = "";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'QuickBank',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.routes,
    );
  }
}
