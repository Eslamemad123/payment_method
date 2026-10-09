import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductTabletHeroImageCard extends StatelessWidget {
  final List<String> images;
  final String fallbackImage;
  final String tag;
  final int selectedIndex;
  final ValueChanged<int> onSelectImage;

  const ProductTabletHeroImageCard({
    super.key,
    required this.images,
    required this.fallbackImage,
    this.tag = 'GEN-4 SENSOR MATRIX',
    required this.selectedIndex,
    required this.onSelectImage,
  });

  @override
  Widget build(BuildContext context) {
    final imageList = images.isNotEmpty ? images : [fallbackImage];
    final activeIndex =
        selectedIndex < imageList.length ? selectedIndex : 0;
    final currentImage = imageList[activeIndex];

    // Ensure we have at least 3 displayable thumbnails
    final thumbnailList = imageList.length >= 3
        ? imageList.sublist(0, 3)
        : imageList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Main Hero Card
        Container(
          height: 380,
          decoration: BoxDecoration(
            color: const Color(0xFFE2E8F0),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            children: [
              // Main Image
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Image.asset(
                      currentImage,
                      key: ValueKey<String>(currentImage),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.image_outlined,
                            size: 80,
                            color: Color(0xFF94A3B8),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // Top-Left Tag Badge
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xFF4338CA),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Gap(6),
                      Text(
                        tag.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1E293B),
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom-Right "Hover to inspect" Badge
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.search,
                        size: 14,
                        color: Color(0xFF475569),
                      ),
                      Gap(4),
                      Text(
                        'Hover to inspect',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const Gap(16),

        // Thumbnails Row
        Row(
          children: List.generate(thumbnailList.length, (index) {
            final isSelected = index == activeIndex;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: index < thumbnailList.length - 1 ? 12.0 : 0.0,
                ),
                child: InkWell(
                  onTap: () => onSelectImage(index),
                  borderRadius: BorderRadius.circular(16),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 96,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF4338CA)
                            : const Color(0xFFE2E8F0),
                        width: isSelected ? 2.2 : 1.2,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: const Color(0xFF4338CA).withValues(alpha: 0.15),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        thumbnailList[index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.image_outlined,
                              size: 28,
                              color: Color(0xFF94A3B8),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
