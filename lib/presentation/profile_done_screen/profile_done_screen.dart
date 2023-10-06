import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/utils/image_constant.dart';
import 'package:quickbank_revised/core/utils/size_utils.dart';
import 'package:quickbank_revised/theme/app_decoration.dart';
import 'package:quickbank_revised/theme/custom_text_style.dart';
import 'package:quickbank_revised/theme/theme_helper.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_image_view.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';

class ProfilDoneScreen extends StatelessWidget {
  ProfilDoneScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController firstnameoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    var imgImage;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: 819.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgWavebackground,
                height: 812.v,
                width: 375.h,
                radius: BorderRadius.circular(
                  36.h,
                ),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25.v),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 26.v),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            height: 661.v,
                            width: double.maxFinite,
                            margin: EdgeInsets.only(bottom: 100.v),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 25.h),
                                    decoration:
                                        AppDecoration.fillOnPrimary.copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.customBorderBL24,
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.imgImage,
                                          height: 80.adaptSize,
                                          width: 80.adaptSize,
                                          radius: BorderRadius.circular(
                                            40.h,
                                          ),
                                        ),
                                        SizedBox(height: 18.v),
                                        CustomTextFormField(
                                          controller: firstnameoneController,
                                          hintText: "Nama Depan",
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
                                        ),
                                        SizedBox(height: 27.v),
                                        Container(
                                          width: 325.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.h,
                                            vertical: 11.v,
                                          ),
                                          decoration: AppDecoration
                                              .outlineErrorContainer
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Nama Belakang",
                                                style:
                                                    theme.textTheme.bodySmall,
                                              ),
                                              CustomImageView(
                                                svgPath: ImageConstant.imgCaret,
                                                height: 23.v,
                                                width: 1.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 27.v),
                                        Container(
                                          width: 325.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.h,
                                            vertical: 11.v,
                                          ),
                                          decoration: AppDecoration
                                              .outlineErrorContainer
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Nomor Telepon",
                                                style:
                                                    theme.textTheme.bodySmall,
                                              ),
                                              CustomImageView(
                                                svgPath: ImageConstant.imgCaret,
                                                height: 23.v,
                                                width: 1.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 27.v),
                                        Container(
                                          width: 325.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.h,
                                            vertical: 10.v,
                                          ),
                                          decoration: AppDecoration
                                              .outlineErrorContainer
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "E-Mail",
                                                style:
                                                    theme.textTheme.bodySmall,
                                              ),
                                              CustomImageView(
                                                svgPath: ImageConstant.imgCaret,
                                                height: 23.v,
                                                width: 1.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 26.v),
                                        Text(
                                          "Alamat",
                                          style: CustomTextStyles
                                              .titleMediumGray100,
                                        ),
                                        SizedBox(height: 26.v),
                                        Container(
                                          width: 325.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12.h,
                                            vertical: 10.v,
                                          ),
                                          decoration: AppDecoration
                                              .outlineErrorContainer
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder8,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Alamat Rumah",
                                                style:
                                                    theme.textTheme.bodySmall,
                                              ),
                                              CustomImageView(
                                                svgPath: ImageConstant.imgCaret,
                                                height: 23.v,
                                                width: 1.h,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 52.v),
                                    child: Text(
                                      "Profil",
                                      style: theme.textTheme.titleLarge,
                                    ),
                                  ),
                                ),
                                CustomAppBar(
                                  height: 28.v,
                                  leadingWidth: double.maxFinite,
                                  leading: AppbarIconbutton(
                                    svgPath:
                                        ImageConstant.imgFaiconsolidarrowleft,
                                    margin: EdgeInsets.only(
                                      left: 19.h,
                                      right: 328.h,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
          text: "Simpan",
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
