import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';

class VerifikasiScreen extends StatelessWidget {
  VerifikasiScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController verifNotelpController = TextEditingController();
  TextEditingController verifEmailController = TextEditingController();
  TextEditingController kodeLoginController = TextEditingController();

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
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 24.h,
              vertical: 35.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verifikasi Nomor Telepon",
                  style: theme.textTheme.titleLarge,
                ),
                Container(
                  width: 315.h,
                  margin: EdgeInsets.only(
                    top: 10.v,
                    right: 11.h,
                  ),
                  child: Text(
                    "Masukan Kode 6 Digit yang sudah di kirim ke nomor telepon anda",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
                SizedBox(height: 8.v),
                CustomTextFormField(
                  controller: verifNotelpController,
                  hintText: "Ex : QBX-150",
                  textInputAction: TextInputAction.done,
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
                ),
                SizedBox(height: 21.v),
                Text(
                  "Verifikasi Email",
                  style: theme.textTheme.titleLarge,
                ),
                Container(
                  width: 313.h,
                  margin: EdgeInsets.only(
                    top: 12.v,
                    right: 13.h,
                  ),
                  child: Text(
                    "Masukan kode 6 Digit yang sudah di kirim ke Email anda",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge!.copyWith(
                      height: 1.50,
                    ),
                  ),
                ),
                SizedBox(height: 11.v),
                CustomTextFormField(
                  controller: verifEmailController,
                  hintText: "Ex : QBX-150",
                  textInputAction: TextInputAction.done,
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
                ),
                SizedBox(height: 30.v),
                Text(
                  "Kode Log-In",
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(height: 7.v),
                CustomTextFormField(
                  controller: kodeLoginController,
                  hintText: "6 Karakter",
                  textInputAction: TextInputAction.done,
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
                ),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomOutlinedButton(
          text: "Daftar",
          margin: EdgeInsets.only(
            left: 24.h,
            right: 24.h,
            bottom: 44.v,
          ),
          borderColor: Colors.white,
          buttonTextStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
