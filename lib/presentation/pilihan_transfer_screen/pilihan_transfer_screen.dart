import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';

class PilihanTransferScreen extends StatelessWidget {
  const PilihanTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.maxFinite,
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        CustomAppBar(
                          height: 90.v,
                          leadingWidth: 52.h,
                          centerTitle: true,
                          title: AppbarTitle(
                            text: "QUICK\nBANK",
                          ),
                        ),
                        SizedBox(height: 25.v),
                        Text(
                          "Transfer",
                          style: CustomTextStyles.titleLargeOnPrimaryContainer,
                        ),
                      ],
                    ),
                    SizedBox(height: 65.v),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(left: 24.h, right: 36.h),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        onTapQb(
                                            context); // Call the onTap function with 'QB' as an identifier
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 22.h),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 29.h,
                                          vertical: 12.v,
                                        ),
                                        decoration: AppDecoration
                                            .gradientBlackToBlack900
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder8,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgUsdcircle2,
                                              height: 32.adaptSize,
                                              width: 32.adaptSize,
                                            ),
                                            SizedBox(height: 17.v),
                                            Text(
                                              "QB Transfer",
                                              style: theme.textTheme.labelLarge,
                                            ),
                                            SizedBox(height: 13.v),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        onTapBank(context);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(left: 22.h),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 37.h,
                                          vertical: 12.v,
                                        ),
                                        decoration: AppDecoration
                                            .gradientBlackToBlack900
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder8,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgLogo40x40,
                                              height: 32.adaptSize,
                                              width: 32.adaptSize,
                                            ),
                                            SizedBox(height: 17.v),
                                            Text(
                                              "Bank Lain",
                                              style: theme.textTheme.labelLarge,
                                            ),
                                            SizedBox(height: 13.v),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        onTapVirtualAccount(context);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            left: 22.h, right: 22.v, top: 22.v),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 29.h,
                                          vertical: 12.v,
                                        ),
                                        decoration: AppDecoration
                                            .gradientBlackToBlack900
                                            .copyWith(
                                          borderRadius:
                                              BorderRadiusStyle.roundedBorder8,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgUsdcircle2,
                                              height: 32.adaptSize,
                                              width: 32.adaptSize,
                                            ),
                                            SizedBox(height: 17.v),
                                            Text(
                                              "Virtual Account",
                                              style: theme.textTheme.labelLarge,
                                            ),
                                            SizedBox(height: 13.v),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Navigates to the transferBankLainScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the transferBankLainScreen.
  onTapBank(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.transferBankLainScreen);
  }

  onTapVirtualAccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.transferVaScreen);
  }

  onTapQb(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.qbTransferScreen);
  }

  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainScreen);
  }
}
