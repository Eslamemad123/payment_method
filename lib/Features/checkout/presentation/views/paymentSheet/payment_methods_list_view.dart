import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_method/Features/checkout/presentation/views/manger/cubit/stripe_payment_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/paymentSheet/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    'assets/images/stripe.svg',
    'assets/images/paypal.svg',
    'assets/images/paymob.svg',
    'assets/images/payTaps.svg',
    'assets/images/kashier.svg',
  ];

  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        itemCount: paymentMethodsItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: BlocBuilder<PaymentCubit, PaymentState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    activeIndex = index;
                    setState(() {
                      context.read<PaymentCubit>().paymentMethod = activeIndex;
                    });
                  },
                  child: PaymentMethodItem(
                    isActive: activeIndex == index,
                    image: paymentMethodsItems[index],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
