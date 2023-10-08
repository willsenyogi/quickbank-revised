import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/main.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class KonfirmasiBankLainScreen extends StatelessWidget {
  KonfirmasiBankLainScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController pinController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
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
                                    hintText: "$selectedBank",
                                    autofocus: false,
                                    textInputAction: TextInputAction.none,
                                  ),
                                  SizedBox(height: 16.v),
                                  CustomTextFormField(
                                    hintText: valueBL,
                                    textInputAction: TextInputAction.none,
                                    autofocus: false,
                                  ),
                                  SizedBox(height: 16.v),
                                  CustomTextFormField(
                                    hintText: nominalFormatter(
                                        int.parse(nominalBLValue)),
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
                                    hintText: "$notesBLValue",
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
                               onTap: () {
                                onTapBack(context);
                              },
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
                      color: Colors.black,
                    ),
                    text: "Transfer",
                    margin: EdgeInsets.only(
                      left: 24.h,
                      right: 24.h,
                      bottom: 46.v,
                    ),
                    buttonStyle: CustomButtonStyles.outlineOnPrimaryTL241,
                    borderColor: Colors.transparent,
                    onTap: () {
                      Alert(
                      context: context,
                      title: "Masukkan Kode Login",
                      content: Column(
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: CustomTextFormField(
                              hintText: "Kode Log In",
                              textInputType: TextInputType.number,
                              obscureText: true,
                              controller: pinController,
                              validator: (pinController) {
                                if(pinController != pinCode){
                                  return "Kode Login Salah!";
                                }
                                return null;
                                
                              },
                            ) 
                          )
                          
                        ],
                      ),
                    buttons: [
                      DialogButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            accountBalance = accountBalance - int.parse(nominalBLValue);
                            backHome(context);
                          }
                        },
                        child: Text(
                          "Ok",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ]).show();
                    },
                    
                  ),
                )
              ],
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

  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.transferBankLainScreen);
  }

  backHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainScreen);
  }
}

