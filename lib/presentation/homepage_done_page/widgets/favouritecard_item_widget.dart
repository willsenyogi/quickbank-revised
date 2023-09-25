import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';

// ignore: must_be_immutable
class FavouritecardItemWidget extends StatelessWidget {
  const FavouritecardItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "GoPay",
                style: CustomTextStyles.bodySmallGray700,
              ),
              SizedBox(height: 2.v),
              Text(
                "0896-3725-9168",
                style: CustomTextStyles.labelLarge12,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 17.h,
              top: 6.v,
              bottom: 5.v,
            ),
            child: Text(
              "100.00",
              style: CustomTextStyles.titleMediumOnPrimaryContainer,
            ),
          ),
          Spacer(),
          Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.all(0),
            color: theme.colorScheme.primaryContainer,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: appTheme.gray600,
                width: 1.h,
              ),
              borderRadius: BorderRadiusStyle.roundedBorder15,
            ),
            child: Container(
              height: 32.adaptSize,
              width: 32.adaptSize,
              padding: EdgeInsets.all(4.h),
              decoration: AppDecoration.outlineGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder15,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgGlobe,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    alignment: Alignment.bottomRight,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "IM",
                      style: CustomTextStyles.labelLargePrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            svgPath: ImageConstant.imgFaiconbrandbitcoin,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(
              left: 8.h,
              top: 4.v,
              bottom: 4.v,
            ),
          ),
        ],
      ),
    );
  }
}
