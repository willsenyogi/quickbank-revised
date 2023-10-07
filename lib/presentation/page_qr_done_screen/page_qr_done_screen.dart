import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/presentation/main_screen/main_screen.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_icon_button.dart';
class PageQrDoneScreen extends StatefulWidget {
  PageQrDoneScreen({Key? key}) : super(key: key);

  @override
  State<PageQrDoneScreen> createState() => _PageQrDoneScreenState();
}

class _PageQrDoneScreenState extends State<PageQrDoneScreen> {
  State<PageQrDoneScreen> createState() => _PageQrDoneScreenState();
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if(Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              height: 90.v,
              leadingWidth: 52.h,
              leading: AppbarIconbutton(
                svgPath: ImageConstant.imgFaiconsolidarrowleft,
                margin: EdgeInsets.only(
                  left: 24.h,
                  top: 11.v,
                  bottom: 11.v,
                ),
                onTap: () {
                  // Navigate to HomepageDonePage when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
                },
              ),
              centerTitle: true,
              title: AppbarTitle(
                text: "QUICK\nBANK",
              ),
            ),
            body: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                buildQrView(context),
                Align(
                  child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(
                      horizontal: 50.h,
                      vertical: 60.v,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Spacer(),
                        Text(
                          "QR Scan\n",
                          style: CustomTextStyles.titleMediumOnPrimaryContainer,
                        ),
                        Positioned(child: buildResult()),
                        SizedBox(height: 12.v),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomIconButton(
                              height: 60.adaptSize,
                              width: 60.adaptSize,
                              padding: EdgeInsets.all(14.h),
                              decoration: IconButtonStyleHelper
                                  .outlineOnPrimaryContainer,
                              child: CustomImageView(
                                svgPath: ImageConstant.imgFaiconsolidcamera,
                              ),
                            ),
                            CustomIconButton(
                              height: 60.adaptSize,
                              width: 60.adaptSize,
                              padding: EdgeInsets.all(14.h),
                              decoration: IconButtonStyleHelper
                                  .outlineOnPrimaryContainer,
                              child: CustomImageView(
                                imagePath: ImageConstant.imgGaleri,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      );
    } catch (e) {
      return const SizedBox();
    }
  }
  Widget buildQrView(BuildContext context) => QRView(
    key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      cutOutSize: MediaQuery.of(context).size.width * 0.8,
      cutOutBottomOffset: 65.h,
      borderColor: Colors.green,
      borderRadius: 12.h,
      borderLength: 20.h,
      borderWidth: 7.h,
      ),
    );
  
  Widget buildResult() => Container(
    child: Text(
      barcode != null ? 'Result : ${barcode!.code}' : 'Scan a code!',
      maxLines: 3,
      style: TextStyle(color: Colors.white),
    ),
  );

  void onQRViewCreated(QRViewController controller){
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen((barcode) => setState(() => this.barcode = barcode));
  }
}
