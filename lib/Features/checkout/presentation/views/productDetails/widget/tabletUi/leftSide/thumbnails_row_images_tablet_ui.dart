import 'package:flutter/material.dart';

class ThumbnailsRowImagesTabletUi extends StatelessWidget {
  const new({
    super.key,
    required this.thumbnailList,
    required this.activeIndex,
    required this.onSelectImage,
  });

  final List<String> thumbnailList;
  final int activeIndex;
  final ValueChanged<int> onSelectImage;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                            color: const Color(0xFF4338CA)
                                .withValues(alpha: 0.15),
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
    );
  }
}
