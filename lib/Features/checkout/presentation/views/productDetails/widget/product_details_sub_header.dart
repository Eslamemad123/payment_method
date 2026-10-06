import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductDetailsSubHeader extends StatefulWidget {
  const ProductDetailsSubHeader({super.key});

  @override
  State<ProductDetailsSubHeader> createState() =>
      _ProductDetailsSubHeaderState();
}

class _ProductDetailsSubHeaderState extends State<ProductDetailsSubHeader> {
  bool isFavorit = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF0F172A),
                size: 20,
              ),
            ),
          ),
        ),
        const Spacer(),
        // IN STOCK Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: const Color(0xFFE0F2FE),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF0284C7),
                  shape: BoxShape.circle,
                ),
              ),
              const Gap(6),
              const Text(
                'IN STOCK',
                style: TextStyle(
                  color: Color(0xFF0284C7),
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        const Gap(10),
        // Favorite Button
        Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () {
              isFavorit = !isFavorit;
              setState(() {});
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Icon(
                isFavorit ? Icons.favorite : Icons.favorite_border_rounded,
                color: isFavorit
                    ? const Color(0xFFEF4444)
                    : const Color(0xFF0F172A),
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
