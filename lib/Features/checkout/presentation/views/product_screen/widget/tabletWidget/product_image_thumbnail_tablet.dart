import 'package:flutter/material.dart';

class ProductImageThumbnail extends StatelessWidget {
  final String imagePath;
  final String? badge;
  final Color? badgeColor;
  final double? width;
  final double? height;
  final double? size;
  final BoxFit fit;

  const ProductImageThumbnail({
    super.key,
    required this.imagePath,
    this.badge,
    this.badgeColor,
    this.width,
    this.height,
    this.size,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final double? effectiveWidth = width ?? size;
    final double? effectiveHeight = height ?? size;

    return Container(
      width: effectiveWidth,
      height: effectiveHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xFFF1F5F9),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          fit: (effectiveWidth == null && effectiveHeight == null)
              ? StackFit.expand
              : StackFit.loose,
          children: [
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: fit,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFF1F5F9),
                    child: const Center(
                      child: Icon(
                        Icons.image_outlined,
                        color: Color(0xFF94A3B8),
                        size: 32,
                      ),
                    ),
                  );
                },
              ),
            ),
            if (badge != null && badge!.isNotEmpty)
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
      ),
    );
  }
}

