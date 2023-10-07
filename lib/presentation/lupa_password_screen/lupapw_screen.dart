import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';

class ForgotPassScreen extends StatefulWidget {
  ForgotPassScreen({Key? key})
      : super(
          key: key,
        );
  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final _email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
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
            back(context);
          },
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restart_alt_outlined, size: 120, color: Colors.white),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                  'Enter Your Email and we will send you a password reset link',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CustomTextFormField(
                controller: _email,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Email is empty';
                  }
                  return null;
                },
                hintText: "Email",
                textInputType: TextInputType.emailAddress,
                autofocus: false,
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: passwordReset,
              child: Text(
                'Reset Password',
                style: theme.textTheme.displayMedium,
              ),
              color: Color(0xFFD6D3FF),
            ),
          ],
        ),
      ),
    );
  }

  back(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInDoneScreen);
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text);
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              "The password reset link has been sent, please check your email!"),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
