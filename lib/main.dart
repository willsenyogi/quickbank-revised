import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:quickbank_revised/theme/theme_helper.dart';
import 'package:quickbank_revised/routes/app_routes.dart';

int accountBalance = 10000000; // Initial balance

var vaValue = "";
var nominalValue = "";
var notesValue = "";

void updateBalanceOut(int balanceOut) {
  accountBalance = accountBalance - balanceOut;
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: AppRoutes.homepageDoneContainerScreen,
      routes: AppRoutes.routes,
    );
  }
}
