import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'animated_container_images_details_products.dart';

class ProductHeroImageCard extends StatefulWidget {
  final List<String> images;

  const ProductHeroImageCard({super.key, required this.images});

  @override
  State<ProductHeroImageCard> createState() => _ProductHeroImageCardState();
}

class _ProductHeroImageCardState extends State<ProductHeroImageCard> {
  int _currentImageIndex = 0;
  PageController pageControler = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: const Color(0xFFEBEFF5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageControler,
              itemCount: widget.images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15)),

                      child: SizedBox.expand(
                        child: Image.asset(
                          widget.images[index],
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_outlined,
                              size: 64,
                              color: Color(0xFF94A3B8),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          AnimatedContainerImagesDetailsProducts(
            widget: widget,
            currentImageIndex: _currentImageIndex,
          ),
          Gap(10),
        ],
      ),
    );
  }
}
