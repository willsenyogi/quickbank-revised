import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/presentation/main_screen/main_screen.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';

class VerifikasiScreen extends StatefulWidget {
  VerifikasiScreen({Key? key}) : super(key: key);

  @override
  State<VerifikasiScreen> createState() => _VerifikasiScreenState();
}

class _VerifikasiScreenState extends State<VerifikasiScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.sendEmailVerification();

    setState(() => canResendEmail = false);
    await Future.delayed(Duration(seconds: 5));
    setState(() => canResendEmail = true);
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? MainScreen()
      : Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            height: 90.v,
            leadingWidth: 52.h,
            leading: AppbarIconbutton(
              svgPath: ImageConstant.imgFaiconsolidarrowleft,
              margin: EdgeInsets.only(
                left: 24.h,
                top: 10.v,
                bottom: 17.v,
              ),
              onTap: () {
                onTapBack(context);
              },
            ),
            centerTitle: true,
            title: AppbarTitle(
              text: "QUICK\nBANK",
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: appTheme.black900,
              image: DecorationImage(
                image: AssetImage(
                  ImageConstant.imgWavebackground,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Icon(
                    Icons.email_outlined,
                    size: 200,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Verify Your Email Address",
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 20.v),
                  Text(
                    "We have just sent an email verification link to your email. Please check your email and click on that link to verify your email address.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      height: 1.50,
                    ),
                  ),
                  SizedBox(height: 30.v),
                  ElevatedButton(
                    onPressed:
                        canResendEmail ? () => sendVerificationEmail() : null,
                    child: Text(
                      'Resend Email Link',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.biodataScreen);
  }
}
