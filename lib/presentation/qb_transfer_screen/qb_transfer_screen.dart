import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'package:quickbank_revised/main.dart';

class QbTransferScreen extends StatefulWidget {
  QbTransferScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<QbTransferScreen> createState() => _QbTransferScreenState();
}

class _QbTransferScreenState extends State<QbTransferScreen> {
  TextEditingController qbNumberController = TextEditingController();
  TextEditingController nominalQbController = TextEditingController();
  TextEditingController notesQbController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Method untuk mengirim data transaksi ke Firebase Firestore
  void performBankTransaction(
      String accountNumber, String transferAmount, String transactionType) {
    // Mendapatkan referensi koleksi 'transactions'
    CollectionReference transactions =
        FirebaseFirestore.instance.collection('transactions');

    // Menambahkan data transaksi ke koleksi 'transactions'
    transactions.add({
      'accountNumber': accountNumber,
      'amount': double.parse(transferAmount),
      'transactionType': transactionType,
      'timestamp': FieldValue.serverTimestamp(), // Menambahkan timestamp
    }).then((value) {
      // Transaksi berhasil ditambahkan ke Firebase Firestore
      print("Transaksi berhasil ditambahkan.");
    }).catchError((error) {
      // Terjadi kesalahan saat menambahkan transaksi
      print("Error: $error");
    });
  }

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
                    autofocus: false,
                    controller: qbNumberController,
                    hintText: "Nomor Rekening",
                    textInputType: TextInputType.number,
                    validator: (qbNumberController) {
                      if (qbNumberController == null ||
                          qbNumberController.isEmpty) {
                        return 'Nomor Rekening Salah';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                    autofocus: false,
                    controller: nominalQbController,
                    hintText: "Jumlah Transfer",
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.number,
                    validator: (nominalQbController) {
                      if (nominalQbController == null ||
                          nominalQbController.isEmpty ||
                          int.parse(nominalQbController) > accountBalance ||
                          int.parse(nominalQbController) < 10000) {
                        return 'Jumlah minimal transfer adalah Rp 10.000,00';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.v),
                  CustomTextFormField(
                    autofocus: false,
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
          margin: EdgeInsets.only(
            left: 24.h,
            right: 24.h,
            bottom: 46.v,
          ),
          buttonStyle: CustomButtonStyles.outlineOnPrimaryTL241,
          borderColor: Colors.transparent,
          onTap: () {
            if (_formKey.currentState?.validate() == true) {
              final currentUser = FirebaseAuth.instance.currentUser;
              if (currentUser != null) {
                final userEmail = currentUser.email;
                if (userEmail != null) {
                  // Panggil metode performBankTransaction dengan email pengguna
                  performBankTransaction(
                    qbNumberController.text,
                    nominalQbController.text,
                    "QB", // Sesuaikan dengan jenis transaksi yang diinginkan
                  );
                }
              }
              qbValue = qbNumberController.text;
              nominalQbValue = nominalQbController.text;
              notesQbValue = notesQbController.text;
              Navigator.pushNamed(context, AppRoutes.konfirmasiQbScreen);
            }
          },
        ),
      ),
    );
  }

  onTapConfirmQb(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.konfirmasiQbScreen);
  }

  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pilihanTransferScreen);
  }
}
