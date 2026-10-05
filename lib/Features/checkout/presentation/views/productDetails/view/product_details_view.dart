import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/Features/checkout/data/repo/repo_implementation.dart';
import 'package:payment_method/Features/checkout/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:payment_method/Features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';

class ProductDetailsView extends StatefulWidget {
  final ProductItemModel product;

  const ProductDetailsView({super.key, required this.product});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late int _quantity;
  int _currentImageIndex = 0;
  bool _isFavorite = false;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _quantity = widget.product.quantity > 0 ? widget.product.quantity : 1;
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int get _unitPrice {
    return int.tryParse(widget.product.price) ?? 0;
  }

  int get _subtotal {
    return _unitPrice * _quantity;
  }

  List<String> get _displayImages {
    if (widget.product.images.isNotEmpty) {
      return widget.product.images;
    }
    return [widget.product.image];
  }

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  void _openCheckoutBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return BlocProvider(
          create: (context) => StripePaymentCubit(CheckPaymentImplement()),
          child: const PaymentMethodsBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            _buildTopBar(context),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(6),
                    // Navigation Bar (Back + In Stock + Favorite)
                    _buildSubHeader(context),
                    const Gap(14),

                    // Main Image Showcase Card
                    _buildHeroImageCard(),
                    const Gap(20),

                    // Category Tag
                    Text(
                      widget.product.category,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF64748B),
                        letterSpacing: 0.8,
                      ),
                    ),
                    const Gap(4),

                    // Product Title
                    Text(
                      widget.product.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F172A),
                        letterSpacing: -0.4,
                      ),
                    ),
                    const Gap(10),

                    // Price & Express Delivery Row
                    _buildPriceRow(),
                    const Gap(16),

                    // Description Box
                    _buildDescriptionBox(),
                    const Gap(20),

                    // Technical Highlights
                    _buildTechnicalHighlights(),
                    const Gap(20),

                    // Quantity Selector Box
                    _buildQuantityBox(),
                    const Gap(14),

                    // Warranty & Returns
                    _buildWarrantyRow(),
                    const Gap(24),

                    // Buy Now Button
                    _buildBuyNowButton(),
                    const Gap(24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFFF8FAFC),
        border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1)),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.shopping_bag_outlined,
                size: 26,
                color: Color(0xFF0F172A),
              ),
              Positioned(
                top: -3,
                right: -5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xFF4338CA),
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '6',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(12),
          const Text(
            'Product Details',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
            ),
          ),
          const Spacer(),
          const CircleAvatar(
            radius: 17,
            backgroundColor: Color(0xFF4338CA),
            child: Icon(Icons.person, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildSubHeader(BuildContext context) {
    return Row(
      children: [
        // Back Button
        Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF0F172A),
                size: 20,
              ),
            ),
          ),
        ),
        const Spacer(),
        // IN STOCK Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: const Color(0xFFE0F2FE),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF0284C7),
                  shape: BoxShape.circle,
                ),
              ),
              const Gap(6),
              const Text(
                'IN STOCK',
                style: TextStyle(
                  color: Color(0xFF0284C7),
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        const Gap(10),
        // Favorite Button
        Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                color: _isFavorite
                    ? const Color(0xFFEF4444)
                    : const Color(0xFF0F172A),
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeroImageCard() {
    final images = _displayImages;

    return Container(
      height: 290,
      decoration: BoxDecoration(
        color: const Color(0xFFEBEFF5),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          // Image PageView
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 36.0,
                    ),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.image_outlined,
                          size: 64,
                          color: Color(0xFF94A3B8),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),

          // Top floating badges
          Positioned(
            top: 14,
            left: 14,
            right: 14,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Series Tag
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.92),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    widget.product.tag,
                    style: const TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF4338CA),
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                // Rating Pill
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.92),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        size: 15,
                        color: Color(0xFF4338CA),
                      ),
                      const Gap(4),
                      Text(
                        widget.product.rating,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Dots Indicator
          if (images.length > 1)
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  final isActive = index == _currentImageIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: isActive ? 22 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xFF4338CA)
                          : const Color(0xFF94A3B8).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPriceRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Current Price
        Text(
          '\$${widget.product.price}',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: Color(0xFF0F172A),
            letterSpacing: -0.5,
          ),
        ),
        const Gap(8),
        // Strikethrough Price
        Text(
          '\$${widget.product.originalPrice}',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFF94A3B8),
            decoration: TextDecoration.lineThrough,
          ),
        ),
        const Spacer(),
        // Free Express Delivery Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF2FF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.local_shipping_outlined,
                size: 15,
                color: Color(0xFF4338CA),
              ),
              Gap(5),
              Text(
                'Free express delivery',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4338CA),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionBox() {
    final text = widget.product.longDescription.isNotEmpty
        ? widget.product.longDescription
        : widget.product.description;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5FD),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          height: 1.45,
          color: Color(0xFF475569),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildTechnicalHighlights() {
    final highlights = widget.product.highlights;
    if (highlights.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'TECHNICAL HIGHLIGHTS',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF64748B),
            letterSpacing: 0.8,
          ),
        ),
        const Gap(10),
        // 2x2 grid representation
        for (int i = 0; i < highlights.length; i += 2) ...[
          Row(
            children: [
              Expanded(child: _buildHighlightChip(highlights[i])),
              if (i + 1 < highlights.length) ...[
                const Gap(10),
                Expanded(child: _buildHighlightChip(highlights[i + 1])),
              ] else ...[
                const Gap(10),
                const Expanded(child: SizedBox()),
              ],
            ],
          ),
          if (i + 2 < highlights.length) const Gap(10),
        ],
      ],
    );
  }

  Widget _buildHighlightChip(TechnicalHighlight highlight) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(highlight.icon, size: 18, color: const Color(0xFF4338CA)),
          const Gap(8),
          Expanded(
            child: Text(
              highlight.title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1E293B),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5FD),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Quantity',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F172A),
                ),
              ),
              const Gap(2),
              Text(
                'Subtotal: \$$_subtotal',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),
            ],
          ),
          const Spacer(),
          // Stepper
          Row(
            children: [
              // Minus button
              Material(
                color: const Color(0xFFE0E7FF),
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: _decrementQuantity,
                  borderRadius: BorderRadius.circular(8),
                  child: const SizedBox(
                    width: 36,
                    height: 36,
                    child: Icon(
                      Icons.remove,
                      size: 18,
                      color: Color(0xFF4338CA),
                    ),
                  ),
                ),
              ),
              const Gap(14),
              Text(
                '$_quantity',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                ),
              ),
              const Gap(14),
              // Plus button
              Material(
                color: const Color(0xFFE0E7FF),
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: _incrementQuantity,
                  borderRadius: BorderRadius.circular(8),
                  child: const SizedBox(
                    width: 36,
                    height: 36,
                    child: Icon(Icons.add, size: 18, color: Color(0xFF4338CA)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWarrantyRow() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.verified_user_outlined,
              size: 16,
              color: Color(0xFF4338CA),
            ),
            Gap(6),
            Text(
              '2-Year Official Warranty',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.sync_rounded, size: 16, color: Color(0xFF4338CA)),
            Gap(6),
            Text(
              '30-Day Hassle Returns',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBuyNowButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3730A3),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        onPressed: _openCheckoutBottomSheet,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.lock_outline_rounded,
              size: 18,
              color: Colors.white,
            ),
            const Gap(8),
            Text(
              'Buy Now - \$$_subtotal',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
