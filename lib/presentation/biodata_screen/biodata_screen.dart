import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/main.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_iconbutton.dart';
import 'package:quickbank_revised/widgets/app_bar/appbar_title.dart';
import 'package:quickbank_revised/widgets/app_bar/custom_app_bar.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';
import 'package:quickbank_revised/widgets/custom_text_form_field.dart';

class BiodataScreen extends StatefulWidget {
  BiodataScreen({Key? key})
      : super(
          key: key,
        );

  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _kodelogin = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future addUserDetails(
      String namaLengkap, String email, int nomorTelepon) async {
    await FirebaseFirestore.instance.collection('user').add({
      'nama lengkap': namaLengkap,
      'email': email,
      'nomor telepon': nomorTelepon,
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          height: 90.v,
          leadingWidth: 52.h,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgFaiconsolidarrowleft,
            margin: EdgeInsets.only(left: 24.h, top: 10.v, bottom: 17.v),
            onTap: () {
              onTapBack(context);
            },
          ),
          centerTitle: true,
          title: AppbarTitle(text: "QUICK\nBANK"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: appTheme.black900,
            image: DecorationImage(
              image: AssetImage(ImageConstant.imgWavebackground),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60.v),
                    Text("Biodata", style: theme.textTheme.titleLarge),
                    SizedBox(height: 16.v),
                    CustomTextFormField(
                      autofocus: false,
                      controller: _fullname,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Nama Lengkap is empty';
                        }
                        return null;
                      },
                      hintText: "Nama Lengkap",
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(height: 16.v),
                    Text("E-Mail & Nomor Telepon",
                        style: CustomTextStyles.titleMediumGray100),
                    SizedBox(height: 14.v),
                    CustomTextFormField(
                      controller: _email,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Email is empty';
                        }
                        return null;
                      },
                      hintText: "Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16.v),
                    CustomTextFormField(
                      controller: _phonenumber,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Nomor Telepon is empty';
                        }
                        return null;
                      },
                      hintText: "Nomor Telepon",
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(height: 16.v),
                    Text("Password",
                        style: CustomTextStyles.titleMediumGray100),
                    SizedBox(height: 14.v),
                    CustomTextFormField(
                      controller: _password,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Password is empty';
                        }
                        return null;
                      },
                      hintText: "Password",
                      obscureText: true,
                    ),
                    SizedBox(height: 15.v),
                    Text(
                      "Kode Log-In",
                      style: CustomTextStyles.titleMediumGray100,
                    ),
                    SizedBox(height: 14.v),
                    CustomTextFormField(
                      controller: _kodelogin,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Mohon masukkan kode login';
                        }
                        return null;
                      },
                      hintText: "6 Karakter",
                      textInputAction: TextInputAction.done,
                    ),
                    SizedBox(height: 40.v),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomOutlinedButton(
          text: "Selanjutnya",
          margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 40.v),
          buttonStyle: CustomButtonStyles.outlineOnPrimaryTL241,
          borderColor: Colors.transparent,
          onTap: () {
            onTapSelanjutnya(context);
            pinCode = _kodelogin.text;
          },
        ),
      ),
    );
  }

  onTapSelanjutnya(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );

        addUserDetails(
          _fullname.text,
          _email.text,
          int.parse(_phonenumber.text),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("The password provided is too weak."),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          return ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("The account already exists for that email."),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        print(e);
      }
      Navigator.pushNamed(context, AppRoutes.verifikasiScreen);
    }
  }

  onTapBack(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.pageKetigaScreen);
  }
}
