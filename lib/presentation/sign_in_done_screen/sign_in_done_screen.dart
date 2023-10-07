import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';

class SignInDoneScreen extends StatefulWidget {
  SignInDoneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<SignInDoneScreen> createState() => _SignInDoneScreenState();
}

class _SignInDoneScreenState extends State<SignInDoneScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
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
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
              child: Column(
                children: [
                  SizedBox(height: 60.v),
                  Text(
                    "Log In",
                    style: theme.textTheme.headlineLarge,
                  ),
                  SizedBox(height: 25.v),
                  CustomTextFormField(
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
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                      controller: _password,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Password is empty';
                        }
                        return null;
                      },
                      hintText: "Password",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                      autofocus: false),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomOutlinedButton(
          text: "Masuk",
          margin: EdgeInsets.only(
            left: 24.h,
            right: 24.h,
            bottom: 44.v,
          ),
          onTap: () {
            onTapSelanjutnya();
          },
          buttonStyle: CustomButtonStyles.outlineOnPrimaryTL241,
          borderColor: Colors.transparent,
        ),
      ),
    );
  }

  onTapSelanjutnya() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          return ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Email not found / Wrong password provided"),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        print(e);
      }
      Navigator.pushNamed(context, AppRoutes.mainScreen);
    }
  }

  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pageKetigaScreen);
  }
}
