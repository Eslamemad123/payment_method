import 'package:flutter/material.dart';

class ProductImageThumbnail extends StatelessWidget {
  final String imagePath;
  final String? badge;
  final Color? badgeColor;

  const ProductImageThumbnail({
    required this.imagePath,
    this.badge,
    this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      height: 96,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFFF1F5F9),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                width: 96,
                height: 96,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFF1F5F9),
                    child: const Icon(
                      Icons.image_outlined,
                      color: Color(0xFF94A3B8),
                      size: 32,
                    ),
                  );
                },
              ),
            ),
          ),
          if (badge != null)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 2.5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.95),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Text(
                  badge!,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: badgeColor ?? const Color(0xFF4338CA),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
