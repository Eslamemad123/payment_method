import 'package:flutter/material.dart';

class QuantityControlButton extends StatelessWidget {
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  const QuantityControlButton({
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isPrimary
                ? const Color(0xFF4338CA)
                : const Color(0xFFEEF2F6),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 18,
            color: isPrimary ? Colors.white : const Color(0xFF0F172A),
          ),
        ),
      ),
    );
  }
}
