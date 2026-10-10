import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../rightSide/bottom_right_hover_image.dart';
import 'thumbnails_row_images_tablet_ui.dart';
import 'top_left_tag_image.dart';

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
    final activeIndex = selectedIndex < imageList.length ? selectedIndex : 0;
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
              TopLeftTagImage(tag: tag),
              BottomRightHoverImage(),
            ],
          ),
        ),

        const Gap(16),

        // Thumbnails Row
        ThumbnailsRowImagesTabletUi(
          thumbnailList: thumbnailList,
          activeIndex: activeIndex,
          onSelectImage: onSelectImage,
        ),
      ],
    );
  }
}
