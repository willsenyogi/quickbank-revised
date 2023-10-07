import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/presentation/homepage_done_page/homepage_done_page.dart';
import 'package:quickbank_revised/presentation/main_screen/main_screen.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_icon_button.dart';
import 'package:quickbank_revised/presentation/main_screen/main_screen.dart';

class PageQrDoneScreen extends StatefulWidget {
  PageQrDoneScreen({Key? key}) : super(key: key);

  @override
  State<PageQrDoneScreen> createState() => _PageQrDoneScreenState();
}

class _PageQrDoneScreenState extends State<PageQrDoneScreen> {
  State<PageQrDoneScreen> createState() => _PageQrDoneScreenState();
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
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
              children: [
                CameraPreview(cameraController),
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
                          "QR Scan",
                          style: CustomTextStyles.titleMediumOnPrimaryContainer,
                        ),
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
                )
              ],
            )),
      );
    } catch (e) {
      return const SizedBox();
    }
  }
}
