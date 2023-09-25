import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';

class TransferBankLainScreen extends StatelessWidget {
  TransferBankLainScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController notetwooneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: 768.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgWavebackground,
                height: 768.v,
                width: 375.h,
                radius: BorderRadius.circular(
                  36.h,
                ),
                alignment: Alignment.center,
              ),
              SingleChildScrollView(
                child: Container(
                  height: 596.v,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(bottom: 165.v),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.h),
                          decoration: AppDecoration.fillOnPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.customBorderBL24,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Bank Lain",
                                  style: theme.textTheme.headlineLarge,
                                ),
                              ),
                              SizedBox(height: 29.v),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.h,
                                  vertical: 10.v,
                                ),
                                decoration: AppDecoration.outlineErrorContainer
                                    .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 4.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Pilih Bank Tujuan",
                                            style: theme.textTheme.bodySmall,
                                          ),
                                          SizedBox(height: 2.v),
                                          Text(
                                            "Pilih Bank Yang Ingin Dituju",
                                            style: CustomTextStyles
                                                .bodyLargeOnPrimaryContainer,
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath: ImageConstant.imgSaly5,
                                      height: 39.v,
                                      width: 32.h,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30.v),
                              Container(
                                width: 327.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.h,
                                  vertical: 11.v,
                                ),
                                decoration: AppDecoration.outlineErrorContainer
                                    .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nomor Rekening",
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgCaret,
                                      height: 23.v,
                                      width: 1.h,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30.v),
                              Container(
                                width: 327.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.h,
                                  vertical: 10.v,
                                ),
                                decoration: AppDecoration.outlineErrorContainer
                                    .copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder8,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Jumlah Transfer",
                                      style: theme.textTheme.bodySmall,
                                    ),
                                    CustomImageView(
                                      svgPath: ImageConstant.imgCaret,
                                      height: 23.v,
                                      width: 1.h,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 29.v),
                              Text(
                                "Catatan",
                                style: CustomTextStyles.titleMediumGray100,
                              ),
                              SizedBox(height: 29.v),
                              CustomTextFormField(
                                controller: notetwooneController,
                                hintText: "Catatan",
                                textInputAction: TextInputAction.done,
                                prefix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      12.h, 25.v, -1.h, 11.v),
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
                            ],
                          ),
                        ),
                      ),
                      CustomAppBar(
                        leadingWidth: 47.h,
                        leading: AppbarIconbutton(
                          svgPath: ImageConstant.imgFaiconsolidarrowleft,
                          margin: EdgeInsets.only(
                            left: 19.h,
                            bottom: 7.v,
                          ),
                        ),
                        centerTitle: true,
                        title: AppbarTitle(
                          text: "QUICK\nBANK",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomOutlinedButton(
          text: "Selanjutnya",
          margin: EdgeInsets.only(
            left: 24.h,
            right: 24.h,
            bottom: 25.v,
          ),
        ),
      ),
    );
  }
}
