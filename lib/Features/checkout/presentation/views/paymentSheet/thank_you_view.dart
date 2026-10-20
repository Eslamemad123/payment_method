import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/presentation/views/paymentSheet/thank_you_view_body.dart';
import 'package:payment_method/core/widgets/cutom_app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key, required this.amount});
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: ThankYouViewBody(amount: amount),
      ),
    );
  }
}
