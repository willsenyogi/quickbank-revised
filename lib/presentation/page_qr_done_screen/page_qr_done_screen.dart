import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/presentation/homepage_done_page/homepage_done_page.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_icon_button.dart';

class PageQrDoneScreen extends StatelessWidget {
  const PageQrDoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          height: 90.v,
          leadingWidth: 52.h,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgFaiconsolidarrowleft,
            margin: EdgeInsets.only(
              left: 24.h,
              top: 11.v,
              bottom: 11.v,
            ),
            onTap: () {
              // Navigate to HomepageDonePage when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomepageDoneScreen()),
              );
            },
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "QUICK\nBANK",
          ),
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 50.h,
            vertical: 60.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Text(
                "QR Scan",
                style: CustomTextStyles.titleMediumOnPrimaryContainer,
              ),
              SizedBox(height: 12.v),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    height: 60.adaptSize,
                    width: 60.adaptSize,
                    padding: EdgeInsets.all(14.h),
                    decoration: IconButtonStyleHelper.outlineOnPrimaryContainer,
                    child: CustomImageView(
                      svgPath: ImageConstant.imgFaiconsolidcamera,
                    ),
                  ),
                  CustomIconButton(
                    height: 60.adaptSize,
                    width: 60.adaptSize,
                    padding: EdgeInsets.all(14.h),
                    decoration: IconButtonStyleHelper.outlineOnPrimaryContainer,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgGaleri,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
