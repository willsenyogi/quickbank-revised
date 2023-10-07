import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/presentation/main_screen/main_screen.dart';
import 'package:quickbank_revised/presentation/page_ketiga_screen/page_ketiga_screen.dart';
import 'package:quickbank_revised/presentation/page_pertama_screen/page_pertama_screen.dart';
import 'package:quickbank_revised/presentation/sign_in_done_screen/sign_in_done_screen.dart';

class AuthenticationPage extends StatelessWidget {
  AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //User sudah login
          if (snapshot.hasData) {
            return MainScreen();
          }
          //User belum daftar sama sekali
          else {
            return PagePertamaScreen();
          }
        },
      ),
    );
  }
}
