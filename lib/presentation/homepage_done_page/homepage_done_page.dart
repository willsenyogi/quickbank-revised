import '../homepage_done_page/widgets/favouritecard_item_widget.dart';
import '../homepage_done_page/widgets/usergopay_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/custom_floating_text_field.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class HomepageDonePage extends StatelessWidget {
  HomepageDonePage({Key? key}) : super(key: key);

  TextEditingController qbCounterController = TextEditingController();

  TextEditingController qbCounterController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillBlack,
                child: SingleChildScrollView(
                    child: Container(
                        height: 1569.v,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(bottom: 5.v),
                        child:
                            Stack(alignment: Alignment.bottomCenter, children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
                                  height: mediaQueryData.size.height,
                                  width: 374.h,
                                  child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        CustomImageView(
                                            imagePath: ImageConstant
                                                .imgWavebackground812x374,
                                            height: 812.v,
                                            width: 374.h,
                                            radius: BorderRadius.circular(36.h),
                                            alignment: Alignment.center),
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 23.h, top: 54.v),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      SizedBox(
                                                          width: 50.h,
                                                          child: Text(
                                                              "QUICK\nBANK",
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: theme
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                      height:
                                                                          1.20))),
                                                      SizedBox(height: 20.v),
                                                      Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Row(children: [
                                                            CustomImageView(
                                                                imagePath:
                                                                    ImageConstant
                                                                        .imgLocation,
                                                                height: 48
                                                                    .adaptSize,
                                                                width: 48
                                                                    .adaptSize),
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            8.h,
                                                                        top: 10
                                                                            .v,
                                                                        bottom: 12
                                                                            .v),
                                                                child: Text(
                                                                    "Carina Adelaine",
                                                                    style: theme
                                                                        .textTheme
                                                                        .titleLarge))
                                                          ])),
                                                      SizedBox(height: 38.v),
                                                      Column(children: [
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              CustomImageView(
                                                                  svgPath:
                                                                      ImageConstant
                                                                          .imgFaiconregular,
                                                                  height: 16
                                                                      .adaptSize,
                                                                  width: 16
                                                                      .adaptSize),
                                                              Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          left: 2
                                                                              .h),
                                                                  child: Text(
                                                                      "IDR",
                                                                      style: theme
                                                                          .textTheme
                                                                          .labelLarge))
                                                            ]),
                                                        SizedBox(height: 3.v),
                                                        SizedBox(
                                                            width: 56.h,
                                                            child: Divider(
                                                                color: appTheme
                                                                    .limeA200))
                                                      ]),
                                                      SizedBox(height: 7.v),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        "Rp. 4,200,000.",
                                                                    style: theme
                                                                        .textTheme
                                                                        .displaySmall),
                                                                TextSpan(
                                                                    text: "00",
                                                                    style: CustomTextStyles
                                                                        .headlineMediumGray100Regular)
                                                              ]),
                                                          textAlign:
                                                              TextAlign.left),
                                                      SizedBox(height: 16.v),
                                                      SizedBox(
                                                          height: 45.adaptSize,
                                                          width: 45.adaptSize,
                                                          child: Stack(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              children: [
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Padding(
                                                                        padding: EdgeInsets.only(
                                                                            left: 1
                                                                                .h),
                                                                        child: Text(
                                                                            "QR Scan",
                                                                            style:
                                                                                CustomTextStyles.labelMediumGray100))),
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgQr,
                                                                    height: 45
                                                                        .adaptSize,
                                                                    width: 45
                                                                        .adaptSize,
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    onTap: () {
                                                                      onTapImgQrone(
                                                                          context);
                                                                    })
                                                              ]))
                                                    ])))
                                      ]))),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 9.h, vertical: 25.v),
                                  decoration: AppDecoration.outlineBlack900
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .customBorderTL24),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("Nabung",
                                            style: CustomTextStyles
                                                .titleLargeOnPrimaryContainer),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 14.h,
                                                top: 17.v,
                                                right: 14.h),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 8.h),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12.h),
                                                          decoration: AppDecoration
                                                              .gradientBlackToBlack
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder8),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgCoininhand1,
                                                                    height: 40
                                                                        .adaptSize,
                                                                    width: 40
                                                                        .adaptSize),
                                                                SizedBox(
                                                                    height:
                                                                        3.v),
                                                                Text(
                                                                    "Ke Bandung",
                                                                    style: theme
                                                                        .textTheme
                                                                        .labelLarge),
                                                                SizedBox(
                                                                    height:
                                                                        5.v),
                                                                Text(
                                                                    "Rp. 1.000.000",
                                                                    style: CustomTextStyles
                                                                        .bodyLargeGray400),
                                                                SizedBox(
                                                                    height:
                                                                        27.v)
                                                              ]))),
                                                  Expanded(
                                                      child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 8.h,
                                                                  bottom: 14.v),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12.h),
                                                          decoration: AppDecoration
                                                              .gradientBlackToBlack
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .roundedBorder8),
                                                          child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .imgSaly5,
                                                                    height: 40
                                                                        .adaptSize,
                                                                    width: 40
                                                                        .adaptSize),
                                                                SizedBox(
                                                                    height:
                                                                        2.v),
                                                                Text(
                                                                    "Beli Skincare",
                                                                    style: theme
                                                                        .textTheme
                                                                        .labelLarge),
                                                                SizedBox(
                                                                    height:
                                                                        5.v),
                                                                Text(
                                                                    "Rp. 300.000",
                                                                    style: CustomTextStyles
                                                                        .bodyLargeGray400),
                                                                SizedBox(
                                                                    height:
                                                                        14.v)
                                                              ])))
                                                ])),
                                        CustomOutlinedButton(
                                            height: 28.v,
                                            text: "Tambah Target",
                                            margin: EdgeInsets.only(
                                                left: 22.h,
                                                top: 12.v,
                                                right: 22.h),
                                            buttonStyle: CustomButtonStyles
                                                .outlinePrimaryContainerTL14,
                                            buttonTextStyle:
                                                theme.textTheme.labelLarge!),
                                        SizedBox(height: 69.v),
                                        SizedBox(
                                            height: 316.v,
                                            width: 341.h,
                                            child: Stack(
                                                alignment: Alignment.centerLeft,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: SizedBox(
                                                          height: 238.v,
                                                          width: 189.h,
                                                          child: Stack(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              children: [
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .img12,
                                                                    height:
                                                                        220.v,
                                                                    width:
                                                                        173.h,
                                                                    radius: BorderRadius
                                                                        .circular(15
                                                                            .h),
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight),
                                                                CustomImageView(
                                                                    imagePath:
                                                                        ImageConstant
                                                                            .img21,
                                                                    height:
                                                                        220.v,
                                                                    width:
                                                                        173.h,
                                                                    radius: BorderRadius
                                                                        .circular(15
                                                                            .h),
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomLeft)
                                                              ]))),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                    "Informasi Kartu",
                                                                    style: CustomTextStyles
                                                                        .titleLargeOnPrimaryContainer)),
                                                            SizedBox(
                                                                height: 53.v),
                                                            CustomFloatingTextField(
                                                                width: 140.h,
                                                                controller:
                                                                    qbCounterController,
                                                                labelText:
                                                                    "QB 1",
                                                                labelStyle: theme
                                                                    .textTheme
                                                                    .labelLarge!,
                                                                hintText:
                                                                    "QB 1"),
                                                            SizedBox(
                                                                height: 45.v),
                                                            CustomFloatingTextField(
                                                                width: 140.h,
                                                                controller:
                                                                    qbCounterController1,
                                                                labelText:
                                                                    "QB 2",
                                                                labelStyle: theme
                                                                    .textTheme
                                                                    .labelLarge!,
                                                                hintText:
                                                                    "QB 2",
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .done),
                                                            SizedBox(
                                                                height: 45.v),
                                                            CustomOutlinedButton(
                                                                height: 28.v,
                                                                text:
                                                                    "Tambah Kartu",
                                                                buttonStyle:
                                                                    CustomButtonStyles
                                                                        .outlinePrimaryContainerTL14,
                                                                buttonTextStyle: theme
                                                                    .textTheme
                                                                    .labelLarge!)
                                                          ]))
                                                ])),
                                        SizedBox(height: 61.v),
                                        Text("Histori Transaksi",
                                            style: CustomTextStyles
                                                .titleLargeOnPrimaryContainer),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 14.h,
                                                top: 24.v,
                                                right: 14.h),
                                            child: ListView.separated(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(height: 16.v);
                                                },
                                                itemCount: 2,
                                                itemBuilder: (context, index) {
                                                  return FavouritecardItemWidget();
                                                })),
                                        CustomOutlinedButton(
                                            height: 28.v,
                                            text: "Lihat Histori",
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 22.h,
                                                vertical: 16.v),
                                            buttonStyle: CustomButtonStyles
                                                .outlinePrimaryContainerTL14,
                                            buttonTextStyle:
                                                theme.textTheme.labelLarge!,
                                            onTap: () {
                                              onTapLihathistori(context);
                                            })
                                      ]))),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 20.v),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("E-Wallets",
                                            style: CustomTextStyles
                                                .titleLargeOnPrimaryContainer),
                                        SizedBox(height: 23.v),
                                        SizedBox(
                                            height: 103.v,
                                            child: ListView.separated(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                separatorBuilder:
                                                    (context, index) {
                                                  return SizedBox(width: 12.h);
                                                },
                                                itemCount: 3,
                                                itemBuilder: (context, index) {
                                                  return UsergopayItemWidget();
                                                })),
                                        CustomOutlinedButton(
                                            height: 28.v,
                                            text: "Tambah E-Wallet",
                                            margin: EdgeInsets.only(
                                                top: 20.v, right: 33.h),
                                            buttonStyle: CustomButtonStyles
                                                .outlinePrimaryContainerTL14,
                                            buttonTextStyle:
                                                theme.textTheme.labelLarge!)
                                      ])))
                        ]))))));
  }

  /// Navigates to the pageQrDoneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the pageQrDoneScreen.
  onTapImgQrone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pageQrDoneScreen);
  }

  /// Navigates to the historyOnProgressScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the historyOnProgressScreen.
  onTapLihathistori(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.historyOnProgressScreen);
  }
}
