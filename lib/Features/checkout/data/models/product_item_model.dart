import 'package:flutter/material.dart';

class TechnicalHighlight {
  final IconData icon;
  final String title;
  final String? label;
  final String? subtitle;

  const TechnicalHighlight({
    required this.icon,
    required this.title,
    this.label,
    this.subtitle,
  });
}

class ProductItemModel {
  final String title;
  final String category;
  final String tag;
  final String sku;
  final String rating;
  final String description;
  final String longDescription;
  final String price;
  final String originalPrice;
  final String image;
  final List<String> images;
  final String? badge;
  final Color? badgeColor;
  final int quantity;
  final List<TechnicalHighlight> highlights;

  const ProductItemModel({
    required this.title,
    this.category = 'FLAGSHIP WEARABLE',
    this.tag = 'SERIES X - TITANIUM',
    this.sku = 'SKU: AUR-PRO-8924',
    this.rating = '4.9 (1,420)',
    required this.description,
    this.longDescription = '',
    required this.price,
    this.originalPrice = '349',
    required this.image,
    this.images = const [],
    this.badge,
    this.badgeColor,
    required this.quantity,
    this.highlights = const [],
  });
}
