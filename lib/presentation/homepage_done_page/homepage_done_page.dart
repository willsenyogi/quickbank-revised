import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickbank_revised/presentation/history_on_progress_screen/widgets/favouritecard1_item_widget.dart';
import 'package:quickbank_revised/presentation/page_qr_done_screen/page_qr_done_screen.dart';
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

class UserProfile {
  final String fullName;
  final String profilePictureURL;

  UserProfile({required this.fullName, required this.profilePictureURL});
}

class Transaction {
  final String accountNumber;
  final double amount;
  final String transactionType;

  Transaction({
    required this.accountNumber,
    required this.amount,
    required this.transactionType,
  });
}

class _HomepageDoneScreenState extends State<HomepageDoneScreen> {
  FocusNode qbCounterFocusNode = FocusNode();
  FocusNode qbCounter1FocusNode = FocusNode();

  final currentUser = FirebaseAuth.instance.currentUser!;
  final usersCollection = FirebaseFirestore.instance.collection("user");
  List<Transaction> transactionHistory = [];

  @override
  void initState() {
    super.initState();
    fetchTransactionHistory();
  }

  void fetchTransactionHistory() {
    FirebaseFirestore.instance
        .collection('transactions')
        .orderBy('timestamp',
            descending: false) // Urutkan berdasarkan timestamp
        .get()
        .then((querySnapshot) {
      final transactions = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Transaction(
          accountNumber: data['accountNumber'] ?? '',
          amount: data['amount'] ?? 0.0,
          transactionType: data['transactionType'] ?? '',
        );
      }).toList();

      setState(() {
        transactionHistory = transactions;
      });
    }).catchError((error) {
      print("Error fetching transactions: $error");
    });
  }

  Future<UserProfile> getUserProfile() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('user')
            .doc(currentUser.email)
            .get();

        String firstName = userData['nama depan'] ?? '';
        String lastName = userData['nama belakang'] ?? '';
        String fullName = '$firstName $lastName';
        String profilePictureURL = userData['profile_picture'] ?? '';

        return UserProfile(
            fullName: fullName, profilePictureURL: profilePictureURL);
      } else {
        return UserProfile(fullName: '', profilePictureURL: '');
      }
    } catch (e) {
      print('Error fetching user profile: $e');
      return UserProfile(fullName: '', profilePictureURL: '');
    }
  }

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
                                    child: FutureBuilder<UserProfile>(
                                      future: getUserProfile(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        } else if (snapshot.hasError) {
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        } else {
                                          if (snapshot.data != null) {
                                            UserProfile userData =
                                                snapshot.data!;
                                            String imageURL =
                                                userData.profilePictureURL;
                                            String displayName =
                                                userData.fullName;

                                            return Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  child: CircleAvatar(
                                                    radius: 24.0,
                                                    backgroundImage:
                                                        NetworkImage(imageURL),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8.h,
                                                      top: 10.v,
                                                      bottom: 12.v),
                                                  child: Text(
                                                    displayName,
                                                    style: theme
                                                        .textTheme.titleLarge,
                                                  ),
                                                )
                                              ],
                                            );
                                          } else {
                                            return Text('Data tidak ditemukan');
                                          }
                                        }
                                      },
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
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 320.v,
                              width: MediaQuery.of(context).size.width,
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
                                          labelStyle:
                                              theme.textTheme.labelLarge!,
                                          textInputAction: TextInputAction.done,
                                          focusNode: qbCounterFocusNode,
                                          autofocus: false,
                                          enabled: false,
                                        ),
                                        SizedBox(height: 45.v),
                                        CustomFloatingTextField(
                                          width: 140.h,
                                          labelText: "QB 2\n$kartuBiru",
                                          labelStyle:
                                              theme.textTheme.labelLarge!,
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
                          ),
                          SizedBox(height: 80.v),
                          Text(
                            "Histori Transaksi",
                            style:
                                CustomTextStyles.titleLargeOnPrimaryContainer,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 8.h, top: 24.v, right: 8.h),
                            child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 16.v);
                              },
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                if (transactionHistory.isEmpty) {
                                  return Text("Tidak ada transaksi.");
                                }

                                if (index >= 0 &&
                                    index < transactionHistory.length) {
                                  // Mengambil 2 item terakhir dari daftar transaksi
                                  final reversedIndex =
                                      transactionHistory.length - 1 - index;
                                  final transaction =
                                      transactionHistory[reversedIndex];

                                  return TransactionCardWidget(
                                    accountNumber: transaction.accountNumber,
                                    amount: transaction.amount,
                                    transactionType:
                                        transaction.transactionType,
                                  );
                                } else {
                                  return Text("Indeks tidak valid.");
                                }
                              },
                            ),
                          ),
                          CustomOutlinedButton(
                            height: 28.v,
                            text: "Lihat Histori",
                            margin: EdgeInsets.symmetric(
                                horizontal: 9.h, vertical: 12.v),
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
      ),
    );
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
