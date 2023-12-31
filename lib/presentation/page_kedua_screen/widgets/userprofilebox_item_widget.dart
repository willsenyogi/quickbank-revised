import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';

class UserprofileboxItemWidget extends StatelessWidget {
  final String imagePath;
  final String text;

  UserprofileboxItemWidget({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.h),
      decoration: AppDecoration.gradientBlackToBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: imagePath,
            height: 40.adaptSize,
            width: 40.adaptSize,
          ),
          SizedBox(height: 3.v),
          Text(
            text,
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 8.v),
          SizedBox(
            height: 6.v,
            width: 131.h,
            child: ClipRRect(
              child: LinearProgressIndicator(
                value: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
