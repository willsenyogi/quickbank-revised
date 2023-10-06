import 'package:quickbank_revised/presentation/page_qr_done_screen/page_qr_done_screen.dart';
import '../homepage_done_page/widgets/favouritecard_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/custom_floating_text_field.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/main.dart';
import 'package:intl/intl.dart';

class HomepageDoneScreen extends StatefulWidget {
  HomepageDoneScreen({Key? key}) : super(key: key);

  @override
  _HomepageDoneScreenState createState() => _HomepageDoneScreenState();
}

class _HomepageDoneScreenState extends State<HomepageDoneScreen> {
  int _selectedIndex = 1;
  FocusNode qbCounterFocusNode = FocusNode();
  FocusNode qbCounter1FocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: AppDecoration.fillBlack,
          child: SingleChildScrollView(
            child: Container(
              height: 1150.v,
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: mediaQueryData.size.height,
                      width: 374.h,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgWavebackground,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        "QUICK\nBANK",
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.titleSmall!
                                            .copyWith(height: 1.20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.v),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: CustomImageView(
                                            imagePath:
                                                ImageConstant.imgLocation,
                                            height: 48.adaptSize,
                                            width: 48.adaptSize,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8.h,
                                              top: 10.v,
                                              bottom: 12.v),
                                          child: Text(
                                            "Carina Adelaine",
                                            style: theme.textTheme.titleLarge,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 70.v),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CustomImageView(
                                            svgPath:
                                                ImageConstant.imgFaiconregular,
                                            height: 16.adaptSize,
                                            width: 16.adaptSize,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 2.h),
                                            child: Text(
                                              "IDR",
                                              style: theme.textTheme.labelLarge,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 3.v),
                                      SizedBox(
                                        width: 56.h,
                                        child: Divider(
                                          color: appTheme.limeA200,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 7.v),
                                  Center(
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: nominalFormatter(
                                                accountBalance),
                                            style: theme.textTheme.displaySmall,
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  SizedBox(height: 16.v),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: SizedBox(
                                      height: 45.adaptSize,
                                      width: 45.adaptSize,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.h),
                                              child: Text(
                                                "QR Scan",
                                                style: CustomTextStyles
                                                    .labelMediumGray100,
                                              ),
                                            ),
                                          ),
                                          CustomImageView(
                                            imagePath: ImageConstant.imgQr,
                                            height: 45.adaptSize,
                                            width: 45.adaptSize,
                                            alignment: Alignment.center,
                                            onTap: () {
                                              onTapImgQrone(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 750.v,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.h, vertical: 35.v),
                      decoration: AppDecoration.outlineBlack900.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL24,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 316.v,
                            width: 341.h,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    height: 238.v,
                                    width: 189.h,
                                    child: Stack(
                                      alignment: Alignment.bottomLeft,
                                      children: [
                                        CustomImageView(
                                          imagePath: ImageConstant.img12,
                                          height: 220.v,
                                          width: 173.h,
                                          radius: BorderRadius.circular(15.h),
                                          alignment: Alignment.topRight,
                                        ),
                                        CustomImageView(
                                          imagePath: ImageConstant.img21,
                                          height: 220.v,
                                          width: 173.h,
                                          radius: BorderRadius.circular(15.h),
                                          alignment: Alignment.bottomLeft,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Informasi Kartu",
                                          style: CustomTextStyles
                                              .titleLargeOnPrimaryContainer,
                                        ),
                                      ),
                                      SizedBox(height: 53.v),
                                      CustomFloatingTextField(
                                        width: 140.h,
                                        labelText: "QB 1\n$kartuKuning",
                                        labelStyle: theme.textTheme.labelLarge!,
                                        textInputAction: TextInputAction.done,
                                        focusNode: qbCounterFocusNode,
                                        autofocus: false,
                                        enabled: false,
                                      ),
                                      SizedBox(height: 45.v),
                                      CustomFloatingTextField(
                                        width: 140.h,
                                        labelText: "QB 2\n$kartuBiru",
                                        labelStyle: theme.textTheme.labelLarge!,
                                        textInputAction: TextInputAction.done,
                                        focusNode: qbCounter1FocusNode,
                                        autofocus: false,
                                        enabled: false,
                                      ),
                                      SizedBox(height: 45.v),
                                      CustomOutlinedButton(
                                          height: 28.v,
                                          text: "Tambah Kartu",
                                          buttonStyle: CustomButtonStyles
                                              .outlinePrimaryContainerTL14,
                                          buttonTextStyle:
                                              theme.textTheme.labelLarge!,
                                          borderColor: Color(0xFF262626),
                                          onTap: () {
                                            onTapTambahKartu(context);
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 100.v),
                          Text(
                            "Histori Transaksi",
                            style:
                                CustomTextStyles.titleLargeOnPrimaryContainer,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 14.h, top: 24.v, right: 14.h),
                            child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 16.v);
                              },
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                return FavouritecardItemWidget();
                              },
                            ),
                          ),
                          CustomOutlinedButton(
                            height: 28.v,
                            text: "Lihat Histori",
                            margin: EdgeInsets.symmetric(
                                horizontal: 22.h, vertical: 16.v),
                            buttonStyle:
                                CustomButtonStyles.outlinePrimaryContainerTL14,
                            buttonTextStyle: theme.textTheme.labelLarge!,
                            borderColor: Color(0xFF262626),
                            onTap: () {
                              onTapLihathistori(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          backgroundColor: Colors.transparent,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: Color(0xFFF2FF53),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.phone_android_outlined,
              ),
              label: 'cardless?',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_sharp,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money_rounded,
              ),
              label: 'Transfer',
            ),
          ],
          onTap: _onTabTapped,
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      //blm ada (mungkin diganti profil)
    } else if (index == 2) {
      onTapTransfer(context);
    }
  }

  onTapImgQrone(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageQrDoneScreen(),
      ),
    );
  }

  onTapLihathistori(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.historyOnProgressScreen);
  }

  onTapTambahKartu(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.kartuBaruScreen);
  }

  static String nominalFormatter(int accountBalance) {
    NumberFormat formatToIdr = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 2,
    );
    return formatToIdr.format(accountBalance);
  }

  onTapTransfer(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pilihanTransferScreen);
  }
}
