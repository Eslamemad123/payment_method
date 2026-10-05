import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/core/const/app_assets.dart';

const List<ProductItemModel> products = [
  ProductItemModel(
    title: 'Horizon Wireless ANC',
    category: 'FLAGSHIP AUDIO',
    tag: 'TITANIUM - SPATIAL AUDIO',
    rating: '4.8 (2,310)',
    description: 'Premium hybrid active noise cancelling with spatial audio.',
    longDescription: 'Engineered with precision acoustic drivers and next-generation hybrid active noise cancellation. Features ultra-soft memory foam earcups, multi-point Bluetooth pairing, and up to 45 hours of immersive playtime on a single charge.',
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
    longDescription: 'Crafted with aerospace aluminum casing, hot-swappable PCB sockets, and factory pre-lubricated tactile switches. Designed for maximum ergonomic typing comfort and high-speed responsiveness.',
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
      TechnicalHighlight(icon: Icons.lightbulb_outline, title: 'RGB Per-Key'),
      TechnicalHighlight(icon: Icons.cable_outlined, title: 'Type-C & 2.4G'),
    ],
  ),
  ProductItemModel(
    title: 'Aura Smartwatch Pro',
    category: 'FLAGSHIP WEARABLE',
    tag: 'SERIES X - TITANIUM',
    rating: '4.9 (1,420)',
    description: 'AMOLED display with all-day health & sleep analytics.',
    longDescription: 'Engineered for high performance and everyday elegance. Features a brilliant 1.43-inch always-on AMOLED display, comprehensive sapphire biometric tracking, dual-band GPS, and up to 14 days of battery life on a single charge. Crafted with aerospace-grade aluminum and interchangeable fluoroelastomer strap.',
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
      TechnicalHighlight(icon: Icons.speed_outlined, title: 'AMOLED Display'),
      TechnicalHighlight(
        icon: Icons.battery_charging_full_rounded,
        title: '14-Day Battery',
      ),
      TechnicalHighlight(
        icon: Icons.water_drop_outlined,
        title: '50m Water Resistant',
      ),
      TechnicalHighlight(icon: Icons.sensors_outlined, title: 'Health Sensors'),
    ],
  ),
];
