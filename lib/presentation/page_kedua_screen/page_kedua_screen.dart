import '../page_kedua_screen/widgets/userprofilebox_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/custom_icon_button.dart';
import 'package:quickbank_revised/widgets/custom_floating_button.dart';

class PageKeduaScreen extends StatelessWidget {
  const PageKeduaScreen({Key? key}) : super(key: key);

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
                      appTheme.black900.withOpacity(0)
                    ])),
                child: SizedBox(
                    height: mediaQueryData.size.height,
                    width: double.maxFinite,
                    child: Stack(alignment: Alignment.center, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgWavebackground,
                          height: 900.v,
                          width: 375.h,
                          alignment: Alignment.center),
                      SizedBox(
                          width: double.maxFinite,
                          child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15.h, vertical: 15.v),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 4.v),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 3.h),
                                                      child: Container(
                                                          height: 6.v,
                                                          width: 160.h,
                                                          decoration: BoxDecoration(
                                                              color: appTheme
                                                                  .lightGreenA700,
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      3.h)),
                                                          child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      3.h),
                                                              child: LinearProgressIndicator(
                                                                  value: 0.63,
                                                                  backgroundColor:
                                                                      appTheme
                                                                          .lightGreenA700,
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<Color>(appTheme.lightGreenA700)))))),
                                              Expanded(
                                                  child: Divider(indent: 3.h))
                                            ]),
                                        SizedBox(height: 116.v),
                                        Column(
                                          children: [
                                            Row(mainAxisAlignment:
                                               MainAxisAlignment.spaceBetween,
                                               children: [
                                              UserprofileboxItemWidget(
                                               imagePath: ImageConstant.imgLogo, // Ganti ini dengan path gambar yang Anda inginkan
                                               text: "Nabung", // Ganti ini dengan teks yang Anda inginkan
                                            ),
                                            UserprofileboxItemWidget(
                                               imagePath: ImageConstant.imgLogo1, // Ganti ini dengan path gambar yang Anda inginkan
                                               text: "Transfer", // Ganti ini dengan teks yang Anda inginkan
                                            ),
                                        ]),
                                            Row(mainAxisAlignment:
                                               MainAxisAlignment.spaceBetween,
                                               children: [
                                              UserprofileboxItemWidget(
                                               imagePath: ImageConstant.imgLogo2, // Ganti ini dengan path gambar yang Anda inginkan
                                               text: "E-Wallet", // Ganti ini dengan teks yang Anda inginkan
                                            ),
                                            UserprofileboxItemWidget(
                                               imagePath: ImageConstant.imgLogo3, // Ganti ini dengan path gambar yang Anda inginkan
                                               text: "Statistik", // Ganti ini dengan teks yang Anda inginkan
                                            ),
                                        ]),
                                            Row(mainAxisAlignment:
                                               MainAxisAlignment.spaceBetween,
                                               children: [
                                              UserprofileboxItemWidget(
                                               imagePath: ImageConstant.imgLogo40x40, // Ganti ini dengan path gambar yang Anda inginkan
                                               text: "Terpercaya", // Ganti ini dengan teks yang Anda inginkan
                                            ),
                                            UserprofileboxItemWidget(
                                               imagePath: ImageConstant.imgSaly5, // Ganti ini dengan path gambar yang Anda inginkan
                                               text: "User Friendly", // Ganti ini dengan teks yang Anda inginkan
                                            ),
                                        ]),


                                          ],

                                        ),
                                        SizedBox(height: 295.v),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CustomIconButton(
                                                  height: 48.v,
                                                  width: 47.h,
                                                  padding: EdgeInsets.all(11.h),
                                                  decoration:
                                                      IconButtonStyleHelper
                                                          .outlineOnPrimary,
                                                  onTap: () {
                                                    onTapBtnFaiconsolidl(
                                                        context);
                                                  },
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgFaiconsolidlOnprimarycontainer)),
                                              CustomIconButton(
                                                  height: 48.v,
                                                  width: 47.h,
                                                  padding: EdgeInsets.all(11.h),
                                                  decoration:
                                                      IconButtonStyleHelper
                                                          .outlineOnPrimary,
                                                  onTap: () {
                                                    onTapBtnFaiconsolidl1(
                                                        context);
                                                  },
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgFaiconsolidl)),
                                            ])
                                      ]))))
                    ])))));
  }

  onTapBtnFaiconsolidl(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pagePertamaScreen);
  }

  onTapBtnFaiconsolidl1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pageKetigaScreen);
  }
}
