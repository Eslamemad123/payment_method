import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductWarrantyRow extends StatelessWidget {
  const ProductWarrantyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.verified_user_outlined,
              size: 16,
              color: Color(0xFF4338CA),
            ),
            Gap(6),
            Text(
              '2-Year Official Warranty',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.sync_rounded, size: 16, color: Color(0xFF4338CA)),
            Gap(6),
            Text(
              '30-Day Hassle Returns',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
