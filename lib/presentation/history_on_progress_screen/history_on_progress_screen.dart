import '../history_on_progress_screen/widgets/favouritecard1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';

class HistoryOnProgressScreen extends StatelessWidget {
  const HistoryOnProgressScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF262626),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 1.v),
          child: Column(
            children: [
              SizedBox(
                height: 140.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgCutbackground1,
                      height: 140.v,
                      width: 375.h,
                      alignment: Alignment.center,
                    ),
                    Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 12.v,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 50.h,
                                child: Text(
                                  "QUICK\nBANK",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: theme.textTheme.titleSmall!.copyWith(
                                    height: 1.20,
                                  ),
                                ),
                              ),
                              SizedBox(height: 35.v),
                              Text(
                                "Histori Transaksi",
                                style: CustomTextStyles
                                    .titleLargeOnPrimaryContainer,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.maxFinite,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(23.h, 14.v, 23.h, 5.v),
                    decoration: AppDecoration.fillOnPrimary.copyWith(),
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (
                        context,
                        index,
                      ) {
                        return SizedBox(
                          height: 18.v,
                        );
                      },
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Favouritecard1ItemWidget();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomOutlinedButton(
          text: "Kembali",
          margin: EdgeInsets.only(
            left: 24.h,
            right: 24.h,
            bottom: 46.v,
          ),
          buttonStyle: CustomButtonStyles.outlineOnPrimaryTL241,
          borderColor: Colors.transparent,
        ),
      ),
    );
  }
}
