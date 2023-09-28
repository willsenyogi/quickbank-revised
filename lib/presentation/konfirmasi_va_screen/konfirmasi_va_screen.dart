import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/main.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';

class KonfirmasiVaScreen extends StatelessWidget {
  KonfirmasiVaScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController transactionidController = TextEditingController();

  TextEditingController transactiontypeController = TextEditingController();

  TextEditingController rpCounterController = TextEditingController();

  TextEditingController contentconatineController = TextEditingController();

  final formatNominal = NumberFormat('#,##0.00', 'ID');

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
                              vertical: 120.v,
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
                                Text("Virtual account : $vaValue",
                                style: theme.textTheme.bodyLarge,
                                ),

                                SizedBox(height: 16.v),
                                CustomTextFormField(
                                  hintText: "Transaksi",
                                  textInputAction: TextInputAction.none,
                                  textInputType: TextInputType.none,
                                ),

                                SizedBox(height: 16.v),
                                CustomTextFormField(
                                  hintText: nominalFormatter(int.parse(nominalValue)),
                                  textInputAction: TextInputAction.none,
                                  textInputType: TextInputType.none,
                                ),

                                SizedBox(height: 15.v),
                                Text(
                                  "Catatan",
                                  style: CustomTextStyles.titleMediumGray100,
                                ),

                                SizedBox(height: 15.v),
                                CustomTextFormField(
                                  hintText: "$notesValue",
                                  textInputAction: TextInputAction.none,
                                  textInputType: TextInputType.none,
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
              SizedBox(height: 50.v),
                Positioned(
                bottom: 25.v,
                left: 24.h,
                right: 24.h,
                child: CustomOutlinedButton(
                  text: "Transfer",
                  buttonStyle: CustomButtonStyles.outlineOnPrimaryTL241,
                  onTap: () {
                    backHome(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static String nominalFormatter(int val){
    NumberFormat formatToIdr = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 2,
    );
    return formatToIdr.format(val);
  }

  backHome(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.homepageDonePage);
  }
}