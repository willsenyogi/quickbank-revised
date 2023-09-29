import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/main.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';

class KonfirmasiQbScreen extends StatelessWidget {
  KonfirmasiQbScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController paymentmethodController = TextEditingController();

  TextEditingController accountnumberController = TextEditingController();

  TextEditingController rpCounterController = TextEditingController();

  TextEditingController contentconatineController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgWavebackground,
                  height: double.maxFinite,
                  width: double.maxFinite,
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
                                    hintText: "QB",
                                    autofocus: false,
                                    textInputAction: TextInputAction.none,
                                  ),
                                  SizedBox(height: 16.v),
                                  CustomTextFormField(
                                    hintText: qbValue,
                                    textInputAction: TextInputAction.none,
                                    autofocus: false,
                                  ),
                                  SizedBox(height: 16.v),
                                  CustomTextFormField(
                                    hintText: nominalFormatter(int.parse(nominalQbValue)),
                                    textInputAction: TextInputAction.none,
                                    autofocus: false,
                                  ),
                                  SizedBox(height: 15.v),
                                  Text(
                                    "Catatan",
                                    style: CustomTextStyles.titleMediumGray100,
                                  ),
                                  SizedBox(height: 15.v),
                                  CustomTextFormField(
                                    hintText: "$notesQbValue",
                                    textInputAction: TextInputAction.none,
                                    autofocus: false,
                                  ),
                                  SizedBox(height: 28.v),
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
                SizedBox(height: 50.v),
                Positioned(
                  bottom: 25.v,
                  left: 24.h,
                  right: 24.h,
                  child: CustomOutlinedButton(
                     buttonTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                    text: "Transfer",
                    onTap: () {
                      accountBalance = accountBalance - int.parse(nominalQbValue);
                      backHome(context);
                    },
                    borderColor: Colors.white,
                  ),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static String nominalFormatter(int accountBalance) {
    NumberFormat formatToIdr = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 2,
    );
    return formatToIdr.format(accountBalance);
  }
  
  backHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homepageDoneContainerScreen);
  }
}
