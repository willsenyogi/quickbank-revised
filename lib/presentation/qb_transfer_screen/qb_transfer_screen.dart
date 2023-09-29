import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';
import 'package:quickbank_revised/main.dart';

class QbTransferScreen extends StatelessWidget {
  QbTransferScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController qbNumberController = TextEditingController();
  TextEditingController nominalQbController = TextEditingController();
  TextEditingController notesQbController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
        mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: 90.v,
          leadingWidth: 52.h,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgFaiconsolidarrowleft,
            margin: EdgeInsets.only(
              left: 24.h,
              top: 10.v,
              bottom: 17.v,
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
        body: Container(
          width: mediaQueryData.size.width,
          height: mediaQueryData.size.height,
          decoration: BoxDecoration(
            color: appTheme.black900,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgWavebackground,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
              child: Column(
                children: [
                  SizedBox(height: 140.v),
                  Text(
                    "QB Transfer",
                    style: theme.textTheme.headlineLarge,
                  ),
                  SizedBox(height: 25.v),
                  CustomTextFormField(
                    controller: qbNumberController,
                    hintText: "Nomor Rekening",
                    textInputType: TextInputType.number,
                    validator: (qbNumberController) {
                      if (qbNumberController == null || qbNumberController.isEmpty) {
                        return 'Nomor Rekening Salah';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                    controller: nominalQbController,
                    hintText: "Jumlah Transfer",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                    validator: (nominalQbController) {
                    if (nominalQbController == null || nominalQbController.isEmpty) {
                        return 'Jumlah minimal transfer adalah Rp 10.000,00';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                    controller: notesQbController,
                    hintText: "Catatan",
                  ),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomOutlinedButton(
          text: "Transfer",
          buttonTextStyle: TextStyle(
            color: Colors.white,
            ),
            onTap: () {
             if (_formKey.currentState?.validate() == true) {
              onTapConfirmQb(context);
              qbValue = qbNumberController.text;
              nominalQbValue = nominalQbController.text;
              notesQbValue = notesQbController.text;
              }
            },
          borderColor: Colors.white,
        ),
      ),
    );
  }
  onTapConfirmQb(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.konfirmasiQbScreen);
  }

  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homepageDoneContainerScreen);
  }
}