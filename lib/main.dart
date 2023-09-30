import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'quickbank_revised',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.pilihanTransferScreen,
      routes: AppRoutes.routes,
    );
  }
}
