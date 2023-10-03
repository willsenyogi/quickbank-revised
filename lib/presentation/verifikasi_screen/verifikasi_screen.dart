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

  final TextEditingController verifNotelpController = TextEditingController();
  final TextEditingController verifEmailController = TextEditingController();
  final TextEditingController kodeLoginController = TextEditingController();
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
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 50.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.v),
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
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Mohon masukkan kode verifikasi';
                      }
                      return null;
                    },
                    hintText: "Ex : QBX-150",
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 15.v),
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
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Mohon masukkan kode verifikasi';
                      }
                      return null;
                    },
                    hintText: "Ex : QBX-150",
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 15.v),
                  Text(
                    "Kode Log-In",
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 7.v),
                  CustomTextFormField(
                    controller: kodeLoginController,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Mohon masukkan kode login';
                      }
                      return null;
                    },
                    hintText: "6 Karakter",
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 5.v),
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
          buttonStyle: CustomButtonStyles.outlineOnPrimaryTL241,
          borderColor: Colors.transparent,
          onTap: () {
            onTapMasuk(context);
          },
        ),
      ),
    );
  }

  onTapMasuk(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.homepageDoneContainerScreen);
    }
  }

  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.biodataScreen);
  }
}
