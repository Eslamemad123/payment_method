import 'package:flutter/material.dart';

class ProductDescriptionBox extends StatelessWidget {
  final String description;

  const ProductDescriptionBox({
    super.key,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5FD),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        description,
        style: const TextStyle(
          fontSize: 13,
          height: 1.45,
          color: Color(0xFF475569),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
