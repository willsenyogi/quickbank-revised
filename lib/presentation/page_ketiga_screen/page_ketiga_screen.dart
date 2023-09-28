import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';

class PageKetigaScreen extends StatelessWidget {
  const PageKetigaScreen({Key? key})
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
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                appTheme.gray500,
                appTheme.black900.withOpacity(0),
              ],
            ),
          ),
          child: SizedBox(
            height: mediaQueryData.size.height,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgWavebackground,
                  height: 900.v,
                  width: 375.h,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.h,
                      vertical: 40.v,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 13.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                endIndent: 3.h,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 3.h),
                                child: Container(
                                  height: 6.v,
                                  width: 160.h,
                                  decoration: BoxDecoration(
                                    color: appTheme.lightGreenA700,
                                    borderRadius: BorderRadius.circular(
                                      3.h,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      3.h,
                                    ),
                                    child: LinearProgressIndicator(
                                      value: 0.63,
                                      backgroundColor: appTheme.lightGreenA700,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        appTheme.lightGreenA700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 90.v),
                        CustomImageView(
                          imagePath: ImageConstant.imgLogo178x195,
                          height: 178.v,
                          width: 195.h,
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "-----------------------------------------------------",
                              style: CustomTextStyles.labelLargeGray100,
                            ),
                            SizedBox(height: 7.v),
                            SizedBox(
                              height: 71.v,
                              width: 327.h,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      width: 263.h,
                                      child: Text(
                                        "Trust QuickBank,\nYour Future is Safe",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: CustomTextStyles
                                            .headlineMediumGray100
                                            .copyWith(
                                          height: 1.20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 1.v),
                                      decoration: AppDecoration.outlineBlack,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [],
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 268.h,
                              margin: EdgeInsets.only(
                                top: 9.v,
                                right: 58.h,
                              ),
                              child: Text(
                                "Persiapkan masa depan yang cerah bersama QuickBank",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  height: 1.50,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 48.v),
                        CustomOutlinedButton(
                          text: "Daftar Sekarang",
                          buttonStyle: CustomButtonStyles.outlineOnPrimaryTL241,
                          borderColor: Colors.white,
                        ),
                        SizedBox(height: 9.v),
                        CustomOutlinedButton(
                          text: "Sudah Memiliki Akun",
                          buttonStyle:
                              CustomButtonStyles.outlinePrimaryContainer,
                          buttonTextStyle:
                              CustomTextStyles.titleMediumOnPrimaryContainer,
                          borderColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
