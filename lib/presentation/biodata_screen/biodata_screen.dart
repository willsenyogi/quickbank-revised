import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class BiodataScreen extends StatelessWidget {
  BiodataScreen({Key? key}) : super(key: key);

  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController fullnameoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenumberoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: 90.v,
          leadingWidth: 52.h,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgFaiconsolidarrowleft,
            margin: EdgeInsets.only(left: 24.h, top: 10.v, bottom: 17.v),
            onTap: () {
              onTapBack(context);
            },
          ),
          centerTitle: true,
          title: AppbarTitle(text: "QUICK\nBANK"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: appTheme.black900,
            image: DecorationImage(
              image: AssetImage(ImageConstant.imgWavebackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.v),
                  Text("Biodata", style: theme.textTheme.titleLarge),
                  SizedBox(height: 16.v),
                  CustomTextFormField(
                    controller: fullnameoneController,
                    hintText: "Nama Lengkap",
                  ),
                  SizedBox(height: 16.v),
                  Text("E-Mail & Nomor Telepon",
                      style: CustomTextStyles.titleMediumGray100),
                  SizedBox(height: 14.v),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.v),
                  CustomTextFormField(
                    controller: phonenumberoneController,
                    hintText: "Nomor Telepon",
                  ),
                  SizedBox(height: 16.v),
                  Text("Password", style: CustomTextStyles.titleMediumGray100),
                  SizedBox(height: 14.v),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomOutlinedButton(
          text: "Selanjutnya",
          margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 40.v),
          buttonStyle: CustomButtonStyles.outlineOnPrimaryTL241,
          borderColor: Colors.transparent,
          onTap: () {
            onTapSelanjutnya(context);
          },
        ),
      ),
    );
  }

  onTapSelanjutnya(BuildContext context) async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      Navigator.pushNamed(context, AppRoutes.verifikasiScreen);
    }).onError((error, stackTrace) {
      print("Error ${error.toString()}");
    });
  }

  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pageKetigaScreen);
  }
}
