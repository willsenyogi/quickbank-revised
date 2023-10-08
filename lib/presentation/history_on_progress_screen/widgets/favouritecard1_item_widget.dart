import 'package:flutter/material.dart';
import 'package:quickbank_revised/core/app_export.dart';

class TransactionCardWidget extends StatelessWidget {
  final String accountNumber;
  final double amount;
  final String transactionType;

  const TransactionCardWidget({
    Key? key,
    required this.accountNumber,
    required this.amount,
    required this.transactionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color amountColor =
        transactionType == "Transfer" ? Colors.red : Colors.green;

    final textStyle = TextStyle(
      fontFamily: CustomTextStyles.bodySmallGray700.fontFamily,
      fontSize: 16.0,
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.outlineOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transactionType, style: CustomTextStyles.bodySmallGray700),
              SizedBox(height: 2.v),
              Text(
                accountNumber,
                style: TextStyle(
                  fontFamily: CustomTextStyles.bodySmallGray700.fontFamily,
                  fontSize: 16.0,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
          Spacer(), // Spacer untuk memberikan jarak antara teks dan ikon
          Text(
            "Rp ${amount.toStringAsFixed(2)}",
            style: TextStyle(
              fontFamily: CustomTextStyles.bodySmallGray700.fontFamily,
              fontSize: 16.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.arrow_downward,
            color: Colors.white,
            size: 24.0,
          ),
        ],
      ),
    );
  }
}
