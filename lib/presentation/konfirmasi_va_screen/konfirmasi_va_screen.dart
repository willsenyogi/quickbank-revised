import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';

class KonfirmasiVaScreen extends StatelessWidget {
  KonfirmasiVaScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController transactionidController = TextEditingController();

  TextEditingController transactiontypeController = TextEditingController();

  TextEditingController rpCounterController = TextEditingController();

  TextEditingController contentconatineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: 768.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgWavebackground,
                height: 768.v,
                width: 375.h,
                radius: BorderRadius.circular(
                  36.h,
                ),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    height: 620.v,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(bottom: 141.v),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.h,
                              vertical: 18.v,
                            ),
                            decoration: AppDecoration.fillGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder36,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(height: 15.v),
                                Text(
                                  "Detail Transfer",
                                  style: theme.textTheme.titleLarge,
                                ),
                                SizedBox(height: 16.v),
                                CustomTextFormField(
                                  controller: transactionidController,
                                  hintText: "70001089637259168",
                                ),
                                SizedBox(height: 16.v),
                                CustomTextFormField(
                                  controller: transactiontypeController,
                                  hintText: "Transaksi",
                                ),
                                SizedBox(height: 16.v),
                                CustomTextFormField(
                                  controller: rpCounterController,
                                  hintText: "Rp. 100,000.00",
                                ),
                                SizedBox(height: 15.v),
                                Text(
                                  "Catatan",
                                  style: CustomTextStyles.titleMediumGray100,
                                ),
                                SizedBox(height: 15.v),
                                CustomTextFormField(
                                  controller: contentconatineController,
                                  hintText: "Go-Jek",
                                  textInputAction: TextInputAction.done,
                                ),
                                SizedBox(height: 28.v),
                                CustomOutlinedButton(
                                  text: "Transfer",
                                  buttonStyle:
                                      CustomButtonStyles.outlineOnPrimaryTL241,
                                ),
                              ],
                            ),
                          ),
                        ),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
