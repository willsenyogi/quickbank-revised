import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/presentation/main_screen/main_screen.dart';
import 'package:quickbank_revised/presentation/page_pertama_screen/page_pertama_screen.dart';
import 'package:quickbank_revised/theme/custom_text_style.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Tambahkan penanganan penundaan di sini
    Future.delayed(Duration(seconds: 2), () {
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => PagePertamaScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Center(
            child: Text(
              'QUICK\nB A N K',
              style: CustomTextStyles.displayLargeOnPrimaryContainer.copyWith(
                height: 1.30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
