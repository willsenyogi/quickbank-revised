import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';

// ignore: must_be_immutable
class UsergopayItemWidget extends StatelessWidget {
  const UsergopayItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.h,
        vertical: 12.v,
      ),
      decoration: AppDecoration.gradientBlackToBlack900.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      width: 112.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgFaiconbrandpaypal,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(left: 4.h),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 4.h,
              top: 3.v,
            ),
            child: Text(
              "Gopay",
              style: theme.textTheme.labelLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 4.h,
              top: 4.v,
            ),
            child: Text(
              "Rp. 120,000.00",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 4.h,
              top: 1.v,
            ),
            child: Text(
              "0896-3725-9168",
              style: CustomTextStyles.bodySmallGray600,
            ),
          ),
        ],
      ),
    );
  }
}
