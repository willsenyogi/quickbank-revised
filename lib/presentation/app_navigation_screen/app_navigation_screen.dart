import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor:
                theme.colorScheme.onPrimaryContainer.withOpacity(1),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  Container(
                      decoration: AppDecoration.fillOnPrimaryContainer,
                      child: Column(children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.h, vertical: 10.v),
                                child: Text("App Navigation",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: appTheme.black900,
                                        fontSize: 20.fSize,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400)))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 20.h),
                                child: Text(
                                    "Check your app's UI from the below demo screens of your app.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: appTheme.blueGray40001,
                                        fontSize: 16.fSize,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400)))),
                        SizedBox(height: 5.v),
                        Divider(
                            height: 1.v,
                            thickness: 1.v,
                            color: appTheme.black900)
                      ])),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              decoration: AppDecoration.fillOnPrimaryContainer,
                              child: Column(children: [
                                GestureDetector(
                                    onTap: () {
                                      onTapPagePertama(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text("Page Pertama",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapBiodata(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text("Biodata",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapVerifikasi(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text("Verifikasi",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapPageKedua(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text("Page Kedua",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapPageKetiga(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text("Page Ketiga",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapSignIndone(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text("Sign In (done)",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapHomepagedoneContainer(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text(
                                                      "Homepage (done) - Container",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapHistoryonprogress(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text(
                                                      "History (on progress)",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapPageQRdone(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text("Page QR (done)",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapQBTransfer(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text("QB Transfer",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapKonfirmasiQB(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text("Konfirmasi QB",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapPilihanTransfer(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text(
                                                      "Pilihan Transfer",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapTransferBankLain(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text(
                                                      "Transfer Bank Lain",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapKonfirmasiBankLain(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text(
                                                      "Konfirmasi Bank Lain",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapTransferVA(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text("Transfer VA",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ]))),
                                GestureDetector(
                                    onTap: () {
                                      onTapKonfirmasiVA(context);
                                    },
                                    child: Container(
                                        decoration: AppDecoration
                                            .fillOnPrimaryContainer,
                                        child: Column(children: [
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20.h,
                                                      vertical: 10.v),
                                                  child: Text("Konfirmasi VA",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              appTheme.black900,
                                                          fontSize: 20.fSize,
                                                          fontFamily: 'Roboto',
                                                          fontWeight: FontWeight
                                                              .w400)))),
                                          SizedBox(height: 5.v),
                                          Divider(
                                              height: 1.v,
                                              thickness: 1.v,
                                              color: appTheme.blueGray40001)
                                        ])))
                              ]))))
                ]))));
  }

  /// Navigates to the pagePertamaScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the pagePertamaScreen.
  onTapPagePertama(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pagePertamaScreen);
  }

  /// Navigates to the biodataScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the biodataScreen.
  onTapBiodata(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.biodataScreen);
  }

  /// Navigates to the verifikasiScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the verifikasiScreen.
  onTapVerifikasi(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.verifikasiScreen);
  }

  /// Navigates to the pageKeduaScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the pageKeduaScreen.
  onTapPageKedua(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pageKeduaScreen);
  }

  /// Navigates to the pageKetigaScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the pageKetigaScreen.
  onTapPageKetiga(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pageKetigaScreen);
  }

  /// Navigates to the signInDoneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the signInDoneScreen.
  onTapSignIndone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInDoneScreen);
  }

  /// Navigates to the homepageDoneContainerScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the homepageDoneContainerScreen.
  onTapHomepagedoneContainer(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainScreen);
  }

  /// Navigates to the historyOnProgressScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the historyOnProgressScreen.
  onTapHistoryonprogress(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.historyOnProgressScreen);
  }

  /// Navigates to the pageQrDoneScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the pageQrDoneScreen.
  onTapPageQRdone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pageQrDoneScreen);
  }

  /// Navigates to the qbTransferScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the qbTransferScreen.
  onTapQBTransfer(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.qbTransferScreen);
  }

  /// Navigates to the konfirmasiQbScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the konfirmasiQbScreen.
  onTapKonfirmasiQB(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.konfirmasiQbScreen);
  }

  /// Navigates to the pilihanTransferScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the pilihanTransferScreen.
  onTapPilihanTransfer(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pilihanTransferScreen);
  }

  /// Navigates to the transferBankLainScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the transferBankLainScreen.
  onTapTransferBankLain(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.transferBankLainScreen);
  }

  /// Navigates to the konfirmasiBankLainScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the konfirmasiBankLainScreen.
  onTapKonfirmasiBankLain(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.konfirmasiBankLainScreen);
  }

  /// Navigates to the transferVaScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the transferVaScreen.
  onTapTransferVA(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.transferVaScreen);
  }

  /// Navigates to the konfirmasiVaScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the konfirmasiVaScreen.
  onTapKonfirmasiVA(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.konfirmasiVaScreen);
  }
}
