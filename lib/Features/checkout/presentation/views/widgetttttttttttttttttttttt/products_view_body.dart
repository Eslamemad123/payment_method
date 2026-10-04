import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/presentation/views/product_details_view.dart';
import 'package:payment_method/core/const/app_assets.dart';

import 'cart_item.dart';
import 'header_mobaile_screen.dart';
import 'header_two_prouducts_mobaile_screen.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  static const List<ProductItemModel> products = [
    ProductItemModel(
      title: 'Horizon Wireless ANC',
      category: 'FLAGSHIP AUDIO',
      tag: 'TITANIUM - SPATIAL AUDIO',
      rating: '4.8 (2,310)',
      description: 'Premium hybrid active noise cancelling with spatial audio.',
      longDescription:
          'Engineered with precision acoustic drivers and next-generation hybrid active noise cancellation. Features ultra-soft memory foam earcups, multi-point Bluetooth pairing, and up to 45 hours of immersive playtime on a single charge.',
      price: '249',
      originalPrice: '299',
      image: AppAssets.headPhone,
      images: [
        AppAssets.headPhone,
        AppAssets.headPhone2,
        AppAssets.headPhone3,
        AppAssets.headPhone4,
      ],
      badge: 'Pro',
      badgeColor: Color(0xFF4338CA),
      quantity: 2,
      highlights: [
        TechnicalHighlight(
          icon: Icons.headphones_outlined,
          title: '40mm Drivers',
        ),
        TechnicalHighlight(
          icon: Icons.battery_charging_full_rounded,
          title: '45h Playtime',
        ),
        TechnicalHighlight(
          icon: Icons.spatial_audio_off_outlined,
          title: 'Spatial Audio',
        ),
        TechnicalHighlight(
          icon: Icons.bluetooth_audio_outlined,
          title: 'Bluetooth 5.3',
        ),
      ],
    ),
    ProductItemModel(
      title: 'Nova Mechanical Keyboard',
      category: 'CUSTOM PERIPHERAL',
      tag: 'HOT-SWAP - RGB MATRIX',
      rating: '4.9 (890)',
      description: 'Custom tactile switches, pre-lubed stabs and RGB backlight.',
      longDescription:
          'Crafted with aerospace aluminum casing, hot-swappable PCB sockets, and factory pre-lubricated tactile switches. Designed for maximum ergonomic typing comfort and high-speed responsiveness.',
      price: '139',
      originalPrice: '179',
      image: AppAssets.keyboard,
      images: [
        AppAssets.keyboard,
        AppAssets.keyboard2,
        AppAssets.keyboard3,
        AppAssets.keyboard4,
      ],
      badge: null,
      quantity: 1,
      highlights: [
        TechnicalHighlight(
          icon: Icons.keyboard_outlined,
          title: 'Custom Switches',
        ),
        TechnicalHighlight(
          icon: Icons.battery_charging_full_rounded,
          title: '200h Battery',
        ),
        TechnicalHighlight(
          icon: Icons.lightbulb_outline,
          title: 'RGB Per-Key',
        ),
        TechnicalHighlight(
          icon: Icons.cable_outlined,
          title: 'Type-C & 2.4G',
        ),
      ],
    ),
    ProductItemModel(
      title: 'Aura Smartwatch Pro',
      category: 'FLAGSHIP WEARABLE',
      tag: 'SERIES X - TITANIUM',
      rating: '4.9 (1,420)',
      description: 'AMOLED display with all-day health & sleep analytics.',
      longDescription:
          'Engineered for high performance and everyday elegance. Features a brilliant 1.43-inch always-on AMOLED display, comprehensive sapphire biometric tracking, dual-band GPS, and up to 14 days of battery life on a single charge. Crafted with aerospace-grade aluminum and interchangeable fluoroelastomer strap.',
      price: '299',
      originalPrice: '349',
      image: AppAssets.clock,
      images: [
        AppAssets.clock,
        AppAssets.clock2,
        AppAssets.clock3,
        AppAssets.clock4,
      ],
      badge: 'Hot',
      badgeColor: Color(0xFFEA580C),
      quantity: 3,
      highlights: [
        TechnicalHighlight(
          icon: Icons.speed_outlined,
          title: 'AMOLED Display',
        ),
        TechnicalHighlight(
          icon: Icons.battery_charging_full_rounded,
          title: '14-Day Battery',
        ),
        TechnicalHighlight(
          icon: Icons.water_drop_outlined,
          title: '50m Water Resistant',
        ),
        TechnicalHighlight(
          icon: Icons.sensors_outlined,
          title: 'Health Sensors',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderProuductsMobaileScreen(),
          const HeaderTwoProuductsMobaileScreen(),
          const CartItemsDetailsMobail(),
          const Gap(4),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 24),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return _ProductCard(
                product: product,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsView(product: product),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductItemModel product;
  final VoidCallback onTap;

  const _ProductCard({
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFF1F5F9), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0F172A).withValues(alpha: 0.04),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image with optional Badge
                  _ProductImageThumbnail(
                    imagePath: product.image,
                    badge: product.badge,
                    badgeColor: product.badgeColor,
                  ),
                  const Gap(14),
                  // Product Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0F172A),
                            letterSpacing: -0.2,
                          ),
                        ),
                        const Gap(4),
                        Text(
                          product.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF64748B),
                            height: 1.3,
                          ),
                        ),
                        const Gap(8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '\$${product.price}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                            const Gap(4),
                            const Text(
                              'USD',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(14),
              // Quantity Selector Bar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFF8FAFC),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Row(
                  children: [
                    const Text(
                      'Selected Quantity',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF334155),
                      ),
                    ),
                    const Spacer(),
                    // Minus Button
                    _QuantityControlButton(
                      icon: Icons.remove,
                      isPrimary: false,
                      onTap: () {},
                    ),
                    const Gap(16),
                    Text(
                      '${product.quantity}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const Gap(16),
                    // Plus Button
                    _QuantityControlButton(
                      icon: Icons.add,
                      isPrimary: true,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProductImageThumbnail extends StatelessWidget {
  final String imagePath;
  final String? badge;
  final Color? badgeColor;

  const _ProductImageThumbnail({
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
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
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

class _QuantityControlButton extends StatelessWidget {
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  const _QuantityControlButton({
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
            color: isPrimary ? const Color(0xFF4338CA) : const Color(0xFFEEF2F6),
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
