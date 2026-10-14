import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsMethodSupportedPayment extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.lock_outline_rounded,
          size: 14,
          color: Color(0xFF4338CA),
        ),
        const Gap(6),
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 11.5, color: Color(0xFF64748B)),
            children: [
              TextSpan(text: 'Supports '),
              TextSpan(
                text: 'PayPal',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF334155),
                ),
              ),
              TextSpan(text: ', '),
              TextSpan(
                text: 'Stripe',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF334155),
                ),
              ),
              TextSpan(text: ', and '),
              TextSpan(
                text: 'PayTabs',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF334155),
                ),
              ),
              TextSpan(text: ' at checkout'),
            ],
          ),
        ),
      ],
    );
  }
}
