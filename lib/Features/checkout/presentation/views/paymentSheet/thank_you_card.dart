import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/paymentSheet/card_info_widget.dart';
import 'package:payment_method/Features/checkout/presentation/views/paymentSheet/payment_info_item.dart';
import 'package:payment_method/Features/checkout/presentation/views/paymentSheet/total_price_widget.dart';
import 'package:payment_method/core/utils/styles.dart';
import 'package:intl/intl.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key, required this.amount});
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            const SizedBox(height: 42),
            PaymentItemInfo(
              title: 'Date',
              value: DateFormat('MM/dd/yyyy').format(DateTime.now()),
            ),
            const SizedBox(height: 20),
            PaymentItemInfo(
              title: 'Time',
              value: DateFormat('hh:mm a').format(DateTime.now()),
            ),
            const SizedBox(height: 20),
            const PaymentItemInfo(title: 'To', value: 'Eslam '),
            const Divider(height: 60, thickness: 2),
            TotalPrice(title: 'Total', value: '\$${amount}'),
            const SizedBox(height: 30),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.abc_outlined, size: 64),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.50,
                        color: Color(0xFF34A853),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.style24.copyWith(
                        color: const Color(0xff34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
