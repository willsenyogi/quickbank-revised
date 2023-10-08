import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/main.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';

class KartuKuningScreen extends StatelessWidget {
  KartuKuningScreen({Key? key})
      : super(
          key: key,
        );

  final TextEditingController _namadepan = TextEditingController();
  final TextEditingController _namabelakang = TextEditingController();
  final TextEditingController _nomortelp = TextEditingController();
  final TextEditingController _email = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 45.v),
                child: Column(
                  children: [
                    SizedBox(height: 50.v),
                    CustomImageView(
                      imagePath: ImageConstant.qb21,
                      height: 270.v,
                      width: 150.h,
                      radius: BorderRadius.circular(
                        15.h,
                      ),
                    ),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      controller: _namadepan,
                      hintText: "Nama Depan",
                      textInputType: TextInputType.name,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Nama Depan is Empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      controller: _namabelakang,
                      hintText: "Nama Belakang",
                      textInputType: TextInputType.name,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Nama Belakang is Empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      controller: _nomortelp,
                      hintText: "Nomor Telepon",
                      textInputType: TextInputType.number,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Nomor Telepon is Empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.v),
                    CustomTextFormField(
                      controller: _email,
                      hintText: "Alamat Email",
                      textInputType: TextInputType.text,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Alamat Email  is Empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 30.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomOutlinedButton(
          text: "Tambah Kartu",
          margin: EdgeInsets.only(
            left: 24.h,
            right: 24.h,
            bottom: 40.v,
          ),
          buttonStyle: CustomButtonStyles.outlineOnPrimaryTL241,
          borderColor: Colors.transparent,
          onTap: () {
            onTapTambah(context);
          },
        ),
      ),))
    );
  }

  onTapTambah(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.kartuBaruScreen);
      kartuKuning = _namadepan.text + " " + _namabelakang.text;
    }
  }

  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.kartuBaruScreen);
  }
}
