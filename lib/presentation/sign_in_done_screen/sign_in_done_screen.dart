import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';

class SignInDoneScreen extends StatelessWidget {
  SignInDoneScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController phonenumberoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController kodeloginController = TextEditingController();

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
          height: 56.v,
          leadingWidth: 52.h,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgFaiconsolidarrowleft,
            margin: EdgeInsets.only(
              left: 24.h,
              top: 10.v,
              bottom: 17.v,
            ),
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "QUICK\nBANK",
          ),
        ),
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
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
              padding: EdgeInsets.only(
                left: 24.h,
                top: 122.v,
                right: 24.h,
              ),
              child: Column(
                children: [
                  Text(
                    "Log In",
                    style: theme.textTheme.headlineLarge,
                  ),
                  SizedBox(height: 25.v),
                  CustomTextFormField(
                    controller: phonenumberoneController,
                    hintText: "Nomor Telepon",
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(12.h, 25.v, 1.h, 11.v),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgCaret,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: 60.v,
                    ),
                    contentPadding: EdgeInsets.only(
                      top: 22.v,
                      right: 12.h,
                      bottom: 22.v,
                    ),
                    style: TextStyle(fontSize: 60.0),
                  ),
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: "Password",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(12.h, 25.v, 1.h, 11.v),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgCaret,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: 60.v,
                    ),
                    obscureText: true,
                    contentPadding: EdgeInsets.only(
                      top: 22.v,
                      right: 12.h,
                      bottom: 22.v,
                    ),
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                    controller: kodeloginController,
                    hintText: "Kode Log-in",
                    prefix: Container(
                      margin: EdgeInsets.fromLTRB(12.h, 25.v, 1.h, 11.v),
                      child: CustomImageView(
                        svgPath: ImageConstant.imgCaret,
                      ),
                    ),
                    prefixConstraints: BoxConstraints(
                      maxHeight: 60.v,
                    ),
                    contentPadding: EdgeInsets.only(
                      top: 22.v,
                      right: 12.h,
                      bottom: 22.v,
                    ),
                    style: TextStyle(fontSize: 30.0),
                  ),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomOutlinedButton(
          text: "Login",
          margin: EdgeInsets.only(
            left: 24.h,
            right: 24.h,
            bottom: 44.v,
          ),
          buttonTextStyle: TextStyle(color: Colors.white),
          borderColor: Colors.white,
        ),
      ),
    );
  }
}
