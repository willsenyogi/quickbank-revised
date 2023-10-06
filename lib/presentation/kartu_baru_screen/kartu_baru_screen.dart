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
                                "\n\nTambah Kartu Baru",
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
                                  ),
                                  CustomOutlinedButton(
                                    height: 60.v,
                                    width: 150.h,
                                    text: "QB 2",
                                    margin: EdgeInsets.only(left: 29.h),
                                    borderColor: Colors.orange.shade300,
                                    buttonTextStyle: TextStyle(
                                      color: Colors.white,
                                      ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
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
                    ],
                  ),
                ),
                
              ),
              SizedBox(height: 50.v),
                Positioned(
                  bottom: 10.v,
                  left: 24.h,
                  right: 24.h,
                  child: CustomOutlinedButton(
                    buttonTextStyle: TextStyle(
                      color: Colors.white,
                      ),
                      text: "+ Tambah Kartu",
                      borderColor: Colors.white,
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}