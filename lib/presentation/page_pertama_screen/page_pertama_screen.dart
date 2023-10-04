import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/custom_floating_button.dart';

class PagePertamaScreen extends StatelessWidget {
  const PagePertamaScreen({Key? key})
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
                  height: 950.v,
                  width: 375.h,
                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Text(
                      "QUICK\nB A N K",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.displayLargeOnPrimaryContainer
                          .copyWith(
                        height: 1.20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: CustomFloatingButton(
            height: 48,
            width: 47,
            backgroundColor: theme.colorScheme.primary,
            child: CustomImageView(
              svgPath: ImageConstant.imgFaiconsolidl,
              height: 24.0.v,
              width: 23.5.h,
            ),
            onTap: () {
              onTapNext(context);
            }),
      ),
    );
  }

  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pageKeduaScreen);
  }
}
