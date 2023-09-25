import '../page_kedua_screen/widgets/userprofilebox_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/custom_icon_button.dart';

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
                          height: 797.v,
                          width: 375.h,
                          radius: BorderRadius.circular(36.h),
                          alignment: Alignment.center),
                      SizedBox(
                          width: double.maxFinite,
                          child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24.h, vertical: 49.v),
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
                                        Expanded(
                                            child: GridView.builder(
                                                shrinkWrap: true,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        mainAxisExtent: 99.v,
                                                        crossAxisCount: 2,
                                                        mainAxisSpacing: 16.h,
                                                        crossAxisSpacing: 16.h),
                                                physics:
                                                    BouncingScrollPhysics(),
                                                itemCount: 6,
                                                itemBuilder: (context, index) {
                                                  return UserprofileboxItemWidget();
                                                })),
                                        SizedBox(height: 180.v),
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
                                                          .gradientBlackToPrimary,
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
                                                          .imgFaiconsolidl))
                                            ])
                                      ]))))
                    ])))));
  }

  /// Navigates to the pagePertamaScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the pagePertamaScreen.
  onTapBtnFaiconsolidl(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pagePertamaScreen);
  }

  /// Navigates to the pageKetigaScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the pageKetigaScreen.
  onTapBtnFaiconsolidl1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pageKetigaScreen);
  }
}
