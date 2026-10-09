import 'package:flutter/material.dart';

class QuantityControlButton extends StatelessWidget {
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;
  final double size;

  const QuantityControlButton({
    super.key,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: isPrimary
                ? const Color(0xFF4338CA)
                : const Color(0xFFEEF2F6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: size * 0.5,
            color: isPrimary ? Colors.white : const Color(0xFF0F172A),
          ),
        ),
      ),
    );
  }
}

