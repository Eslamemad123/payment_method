import 'package:flutter/material.dart';

class TechnicalHighlight {
  final IconData icon;
  final String title;

  const TechnicalHighlight({
    required this.icon,
    required this.title,
  });
}

class ProductItemModel {
  final String title;
  final String category;
  final String tag;
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
