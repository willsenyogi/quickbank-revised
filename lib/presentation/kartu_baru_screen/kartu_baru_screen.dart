import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';

class KartuBaruScreen extends StatelessWidget {
  const KartuBaruScreen({Key? key})
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
        body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgWavebackground,
                height: double.maxFinite,
                width: double.maxFinite,
                alignment: Alignment.center,
              ),
              SingleChildScrollView(
                child: Container(
                  height: 463.v,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(bottom: 314.v),
                  padding: EdgeInsets.symmetric(horizontal: 19.h),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SizedBox(height: 20.v),
                      Text(
                        "\n\n\nTambah Kartu Baru",
                        style: theme.textTheme.titleLarge,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 3.h,
                            right: 4.h,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.qb21,
                                    height: 270.v,
                                    width: 150.h,
                                    radius: BorderRadius.circular(
                                      15.h,
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath: ImageConstant.qb12,
                                    height: 270.v,
                                    width: 150.h,
                                    radius: BorderRadius.circular(
                                      15.h,
                                    ),
                                    margin: EdgeInsets.only(left: 30.h),
                                  ),
                                ],
                              ),
                              SizedBox(height: 22.v),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomOutlinedButton(
                                      height: 60.v,
                                      width: 151.h,
                                      text: "QB 1",
                                      borderColor: Colors.orange.shade300,
                                      buttonTextStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      onTap: () {
                                        onTapKuning(context);
                                      }),
                                  CustomOutlinedButton(
                                      height: 60.v,
                                      width: 150.h,
                                      text: "QB 2",
                                      margin: EdgeInsets.only(left: 29.h),
                                      borderColor: Colors.orange.shade300,
                                      buttonTextStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      onTap: () {
                                        onTapBiru(context);
                                      }),
                                ],
                              ),
                            ],
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
      ),
    );
  }

  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homepageDoneScreen);
  }

  onTapKuning(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.kartuKuningScreen);
  }

  onTapBiru(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.kartuBiruScreen);
  }
}
