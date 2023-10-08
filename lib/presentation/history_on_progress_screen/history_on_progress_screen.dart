import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quickbank_revised/core/app_export.dart';
import 'package:quickbank_revised/presentation/history_on_progress_screen/widgets/favouritecard1_item_widget.dart';
import 'package:quickbank_revised/widgets/custom_outlined_button.dart';

class HistoryOnProgressScreen extends StatefulWidget {
  const HistoryOnProgressScreen({Key? key}) : super(key: key);

  @override
  State<HistoryOnProgressScreen> createState() =>
      _HistoryOnProgressScreenState();
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

class _HistoryOnProgressScreenState extends State<HistoryOnProgressScreen> {
  List<Transaction> transactionHistory = [];

  @override
  void initState() {
    super.initState();
    fetchTransactionHistory();
  }

  // Metode untuk mengambil data transaksi dari Firestore
  void fetchTransactionHistory() {
    FirebaseFirestore.instance
        .collection('transactions')
        .orderBy('timestamp', descending: false)
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF262626),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 140,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgCutbackground1,
                      height: 140,
                      width: double.infinity,
                      alignment: Alignment.center,
                    ),
                    Center(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 12,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 50,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    "QUICK\nBANK",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.titleSmall!.copyWith(
                                      height: 1.20,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 35),
                              Text(
                                "Histori Transaksi",
                                style: CustomTextStyles
                                    .titleLargeOnPrimaryContainer,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  margin: EdgeInsets.fromLTRB(23, 14, 23, 5),
                  decoration: AppDecoration.fillOnPrimary.copyWith(),
                  child: transactionHistory.isEmpty
                      ? Center(
                          child: Text(
                            "Tidak ada data transaksi.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: transactionHistory.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 8.0);
                          },
                          itemBuilder: (context, index) {
                            return TransactionCardWidget(
                              accountNumber:
                                  transactionHistory[index].accountNumber,
                              amount: transactionHistory[index].amount,
                              transactionType:
                                  transactionHistory[index].transactionType,
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomOutlinedButton(
          text: "Kembali",
          margin: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 46,
          ),
          buttonStyle: CustomButtonStyles.outlineOnPrimaryTL241,
          borderColor: Colors.transparent,
          onTap: () {
            onTapKembali(context);
          },
        ),
      ),
    );
  }

  onTapKembali(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.mainScreen);
  }
}
