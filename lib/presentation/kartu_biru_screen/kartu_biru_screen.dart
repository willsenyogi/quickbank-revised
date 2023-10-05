import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';

class KartuBiruScreen extends StatelessWidget {
  const KartuBiruScreen({Key? key})
      : super(
          key: key,
        );

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
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
              child: Column(
                children: [
                  SizedBox(height: 50.v,),
                  CustomImageView(
                    imagePath: ImageConstant.qb12,
                    height: 270.v,
                    width: 150.h,
                    radius: BorderRadius.circular(
                      15.h,
                    ),
                  ),
                  SizedBox(height: 25.v),
                  CustomTextFormField(
                    controller: null,
                    hintText: "Nama Depan",
                    textInputType: TextInputType.text,
                    validator: null,
                  ),
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                    controller: null,
                    hintText: "Nama Belakang",
                    textInputType: TextInputType.number,
                    validator: null
                  ),
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                    controller: null,
                    hintText: "Nomor Telepon",
                    textInputType: TextInputType.number,
                    validator: null
                  ),
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                    controller: null,
                    hintText: "Alamat Email",
                    textInputType: TextInputType.text,
                    validator: null
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomOutlinedButton(
          text: "Tambah Kartu",
          buttonTextStyle: TextStyle(
            color: Colors.white,
            ),
          borderColor: Colors.white,
        ),
      ),
    );
  }
  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homepageDoneContainerScreen);
  }
}
