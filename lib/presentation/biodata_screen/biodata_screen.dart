import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class BiodataScreen extends StatelessWidget {
  BiodataScreen({Key? key}) : super(key: key);

  TextEditingController fullnameoneController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phonenumberoneController = TextEditingController();

  TextEditingController homeaddressoneController = TextEditingController();

  TextEditingController dayoneController = TextEditingController();

  TextEditingController monthoneController = TextEditingController();

  TextEditingController yearoneController = TextEditingController();

  TextEditingController birthplaceoneController = TextEditingController();

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
                height: 60.v,
                leadingWidth: 52.h,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgFaiconsolidarrowleft,
                    margin:
                        EdgeInsets.only(left: 24.h, top: 10.v, bottom: 17.v)),
                centerTitle: true,
                title: AppbarTitle(text: "QUICK\nBANK")),
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    color: appTheme.black900,
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgWavebackground),
                        fit: BoxFit.cover)),
                child: Form(
                    key: _formKey,
                    child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.h, vertical: 8.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Biodata",
                                  style: theme.textTheme.titleLarge),
                              SizedBox(height: 16.v),
                              CustomTextFormField(
                                  controller: fullnameoneController,
                                  hintText: "Nama Lengkap"),
                              SizedBox(height: 16.v),
                              Text("E-Mail & Nomor Telepon",
                                  style: CustomTextStyles.titleMediumGray100),
                              SizedBox(height: 14.v),
                              CustomTextFormField(
                                  controller: emailController,
                                  hintText: "Email",
                                  textInputType: TextInputType.emailAddress),
                              SizedBox(height: 16.v),
                              CustomTextFormField(
                                  controller: phonenumberoneController,
                                  hintText: "Nomor Telepon"),
                              SizedBox(height: 15.v),
                              Text("Alamat",
                                  style: CustomTextStyles.titleMediumGray100),
                              SizedBox(height: 15.v),
                              CustomTextFormField(
                                  controller: homeaddressoneController,
                                  hintText: "Alamat Tempat Tinggal"),
                              SizedBox(height: 16.v),
                              Text("Tempat & Tanggal Lahir",
                                  style: CustomTextStyles.titleMediumGray100),
                              SizedBox(height: 14.v),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextFormField(
                                        width: 88.h,
                                        controller: dayoneController,
                                        hintText: "Hari"),
                                    CustomTextFormField(
                                        width: 88.h,
                                        controller: monthoneController,
                                        hintText: "Bulan"),
                                    CustomTextFormField(
                                        width: 119.h,
                                        controller: yearoneController,
                                        hintText: "Tahun")
                                  ]),
                              CustomTextFormField(
                                  controller: birthplaceoneController,
                                  margin: EdgeInsets.only(
                                      top: 16.v, right: 8.h, bottom: 5.v),
                                  hintText: "Tempat Lahir",
                                  textInputAction: TextInputAction.done)
                            ])))),
            bottomNavigationBar: Opacity(
                opacity: 0.2,
                child: CustomOutlinedButton(
                  text: "Selanjutnya",
                  margin:
                      EdgeInsets.only(left: 24.h, right: 24.h, bottom: 40.v),
                  onTap: () {
                    onTapSelanjutnya(context);
                  },
                  isDisabled: true,
                  borderColor: Colors.white,
                ))));
  }

  /// Navigates to the verifikasiScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the verifikasiScreen.
  onTapSelanjutnya(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.verifikasiScreen);
  }
}
