import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';
import 'package:quickbank_revised/main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class TransferBankLainScreen extends StatefulWidget {
  TransferBankLainScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<TransferBankLainScreen> createState() => _TransferBankLainScreenState();
}

class _TransferBankLainScreenState extends State<TransferBankLainScreen> {
  TextEditingController rekeningController = TextEditingController();

  TextEditingController nominalBLController = TextEditingController();

  TextEditingController catatanController = TextEditingController();

  TextEditingController bankController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> bankList = [
  'Bank Central Asia (BCA)',
  'Bank Negara Indonesia (BNI)',
  'Bank Rakyat Indonesia (BRI)',
  'Bank Mandiri',
  'Bank DBS',
  'Bank Jago',
  'United Overseas Bank (UOB)',
  'Bank CIMB Niaga',
  'Bank Danamon',
  'Bank HSBC Indonesia',
  'Panin Bank',
  ];

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
                  SizedBox(height: 90.v),
                  Text(
                    "Bank Lain",
                    style: theme.textTheme.headlineLarge,
                  ),
                  SizedBox(height: 50.v),
                  Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          'Pilih Bank Tujuan',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        items: bankList
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedBank,
                        onChanged: (String? value) {
                          setState(() {
                            selectedBank = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          height: 60,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.h),
                            border: Border.all(
                              color: theme.colorScheme.primaryContainer,
                            ),
                            color: theme.colorScheme.onPrimary.withOpacity(1),
                          ),
                          elevation: 2,
                        ),

                        dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 343,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.h),
                          color: theme.colorScheme.onPrimary.withOpacity(1),
                        ),
                        offset: const Offset(0, 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                    controller: rekeningController,
                    hintText: "Nomor Rekening",
                    textInputType: TextInputType.number,
                    validator: (rekeningController) {
                      if (rekeningController == null || rekeningController.isEmpty) {
                        return 'Nomor Rekening Kosong';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                    controller: nominalBLController,
                    hintText: "Jumlah Transfer",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                    validator: (nominalBLController) {
                    if (nominalBLController == null || nominalBLController.isEmpty || int.parse(nominalBLController) > accountBalance || int.parse(nominalBLController) < 10000) {
                        return 'Jumlah minimal transfer adalah Rp 10.000,00';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                    controller: catatanController,
                    hintText: "Catatan",
                    textInputAction: TextInputAction.done,
                    validator: null,
                  ),
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
              valueBL = rekeningController.text;
              nominalBLValue = nominalBLController.text;
              notesBLValue = catatanController.text;
              onTapConfirmVa(context);
              
              }
            },
          borderColor: Colors.white,
        ),
      ),
    );
  }

  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pilihanTransferScreen);
  }

  onTapConfirmVa(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.konfirmasiBankLainScreen);
  }
}
