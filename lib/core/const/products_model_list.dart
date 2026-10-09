import 'package:flutter/material.dart';
import 'package:payment_method/Features/checkout/data/models/product_item_model.dart';
import 'package:payment_method/core/const/app_assets.dart';

const List<ProductItemModel> products = [
  // 1. Headphones
  ProductItemModel(
    title: 'Horizon Wireless ANC',
    category: 'FLAGSHIP AUDIO',
    tag: 'TITANIUM - SPATIAL AUDIO',
    rating: '4.8 (2,310)',
    description: 'Premium wireless headphones for immersive listening.',
    longDescription: 'Premium headphones designed for everyday listening, entertainment, and work. Their over-ear design provides a comfortable listening experience.',
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
    quantity: 1,
    highlights: [
      TechnicalHighlight(
        icon: Icons.headphones_outlined,
        title: 'Over-Ear Design',
      ),
      TechnicalHighlight(
        icon: Icons.bluetooth_audio_outlined,
        title: 'Wireless Audio',
      ),
      TechnicalHighlight(
        icon: Icons.spatial_audio_off_outlined,
        title: 'Immersive Sound',
      ),
      TechnicalHighlight(icon: Icons.work_outline, title: 'Everyday Use'),
    ],
  ),

  // 2. Mechanical Keyboard
  ProductItemModel(
    title: 'Nova Mechanical Keyboard',
    category: 'CUSTOM PERIPHERAL',
    tag: 'HOT-SWAP - RGB MATRIX',
    rating: '4.9 (890)',
    description: 'A stylish keyboard for work, gaming, and productivity.',
    longDescription: 'A modern keyboard featuring a stylish design suitable for desktop setups, office productivity, and gaming environments.',
    price: '139',
    originalPrice: '179',
    image: AppAssets.keyboard,
    images: [
      AppAssets.keyboard,
      AppAssets.keyboard2,
      AppAssets.keyboard3,
      AppAssets.keyboard4,
    ],
    badge: 'Popular',
    badgeColor: Color(0xFF4338CA),
    quantity: 1,
    highlights: [
      TechnicalHighlight(
        icon: Icons.keyboard_outlined,
        title: 'Desktop Keyboard',
      ),
      TechnicalHighlight(icon: Icons.lightbulb_outline, title: 'Modern Design'),
      TechnicalHighlight(icon: Icons.work_outline, title: 'Work & Gaming'),
      TechnicalHighlight(icon: Icons.usb_outlined, title: 'Computer Accessory'),
    ],
  ),

  // 3. Smartwatch
  ProductItemModel(
    title: 'Aura Smartwatch Pro',
    category: 'FLAGSHIP WEARABLE',
    tag: 'SERIES X - TITANIUM',
    rating: '4.9 (1,420)',
    description: 'A modern smartwatch for everyday use.',
    longDescription: 'A stylish smartwatch featuring a modern display and a comfortable wearable design. Suitable for everyday activities and compatible smartphone experiences depending on the device model.',
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
    quantity: 1,
    highlights: [
      TechnicalHighlight(
        icon: Icons.watch_outlined,
        title: 'Smartwatch Design',
      ),
      TechnicalHighlight(
        icon: Icons.phone_android_outlined,
        title: 'Smart Device',
      ),
      TechnicalHighlight(
        icon: Icons.directions_run_outlined,
        title: 'Daily Activities',
      ),
      TechnicalHighlight(
        icon: Icons.favorite_border,
        title: 'Wearable Technology',
      ),
    ],
  ),

  // 4. Wireless Earbuds
  ProductItemModel(
    title: 'AirPods Wireless Pro',
    category: 'WIRELESS AUDIO',
    tag: 'COMPACT - PREMIUM SOUND',
    rating: '4.7 (860)',
    description: 'Compact wireless earbuds for everyday listening.',
    longDescription: 'Compact wireless earbuds with a portable charging case and a lightweight design suitable for daily use, commuting, and listening to music.',
    price: '129',
    originalPrice: '159',
    image: AppAssets.airbuds,
    images: [
      AppAssets.airbuds,
      AppAssets.airbuds2,
      AppAssets.airbuds3,
      AppAssets.airbuds4,
    ],
    badge: 'Popular',
    badgeColor: Color(0xFF4338CA),
    quantity: 1,
    highlights: [
      TechnicalHighlight(
        icon: Icons.headphones_outlined,
        title: 'Wireless Audio',
      ),
      TechnicalHighlight(
        icon: Icons.battery_charging_full_rounded,
        title: 'Charging Case',
      ),
      TechnicalHighlight(
        icon: Icons.bluetooth_audio_outlined,
        title: 'Bluetooth Audio',
      ),
      TechnicalHighlight(
        icon: Icons.directions_walk_outlined,
        title: 'Portable Design',
      ),
    ],
  ),

  // 5. Wireless Mouse
  ProductItemModel(
    title: 'Nova Wireless Mouse',
    category: 'COMPUTER ACCESSORIES',
    tag: 'ERGONOMIC - WIRELESS',
    rating: '4.6 (420)',
    description: 'A comfortable mouse for work and everyday browsing.',
    longDescription: 'A practical computer mouse with a clean design for office work, studying, and everyday desktop use.',
    price: '29',
    originalPrice: '39',
    image: AppAssets.mouse,
    images: [
      AppAssets.mouse,
      AppAssets.mouse2,
      AppAssets.mouse3,
      AppAssets.mouse4,
    ],
    badge: null,
    quantity: 1,
    highlights: [
      TechnicalHighlight(icon: Icons.mouse_outlined, title: 'Mouse Design'),
      TechnicalHighlight(
        icon: Icons.computer_outlined,
        title: 'Computer Accessory',
      ),
      TechnicalHighlight(icon: Icons.work_outline, title: 'Office Ready'),
    ],
  ),

  // 6. Digital Camera
  ProductItemModel(
    title: 'Vision Digital Camera',
    category: 'CAMERA & PHOTOGRAPHY',
    tag: 'PORTABLE - DIGITAL',
    rating: '4.8 (560)',
    description: 'A camera for photography and content creation.',
    longDescription: 'A dedicated digital camera for photography, travel, and creative projects. A suitable choice for users who prefer a camera for capturing photos and videos.',
    price: '499',
    originalPrice: '599',
    image: AppAssets.camera,
    images: [
      AppAssets.camera,
      AppAssets.camera2,
      AppAssets.camera3,
      AppAssets.camera4,
    ],
    badge: 'Featured',
    badgeColor: Color(0xFF0F766E),
    quantity: 1,
    highlights: [
      TechnicalHighlight(
        icon: Icons.camera_alt_outlined,
        title: 'Digital Camera',
      ),
      TechnicalHighlight(
        icon: Icons.photo_camera_outlined,
        title: 'Photography',
      ),
      TechnicalHighlight(
        icon: Icons.luggage_outlined,
        title: 'Travel Friendly',
      ),
    ],
  ),

  // 7. Laptop
  ProductItemModel(
    title: 'ProBook Laptop',
    category: 'COMPUTERS & LAPTOPS',
    tag: 'PRODUCTIVITY - PORTABLE',
    rating: '4.8 (720)',
    description: 'A laptop for productivity, studying, and everyday work.',
    longDescription: 'A versatile laptop designed for studying, office tasks, browsing, and entertainment. Its portable form factor makes it suitable for work at home or on the go.',
    price: '899',
    originalPrice: '999',
    image: AppAssets.laptop,
    images: [
      AppAssets.laptop,
      AppAssets.laptop2,
      AppAssets.laptop3,
      AppAssets.laptop4,
    ],
    badge: 'Top Pick',
    badgeColor: Color(0xFF0F766E),
    quantity: 1,
    highlights: [
      TechnicalHighlight(icon: Icons.laptop_outlined, title: 'Portable Design'),
      TechnicalHighlight(icon: Icons.work_outline, title: 'Productivity'),
      TechnicalHighlight(icon: Icons.school_outlined, title: 'Study & Work'),
    ],
  ),

  // 8. Tablet
  ProductItemModel(
    title: 'Nova iPad Tablet',
    category: 'TABLETS & MOBILE TECH',
    tag: 'PORTABLE - TOUCH DISPLAY',
    rating: '4.7 (680)',
    description: 'A tablet for browsing, entertainment, and productivity.',
    longDescription: 'A versatile tablet suitable for reading, browsing, entertainment, and productivity. Its portable form factor makes it useful for work and leisure.',
    price: '399',
    originalPrice: '449',
    image: AppAssets.ipad,
    images: [AppAssets.ipad, AppAssets.ipad2, AppAssets.ipad3, AppAssets.ipad4],
    badge: 'Featured',
    badgeColor: Color(0xFF4338CA),
    quantity: 1,
    highlights: [
      TechnicalHighlight(
        icon: Icons.tablet_mac_outlined,
        title: 'Tablet Design',
      ),
      TechnicalHighlight(
        icon: Icons.touch_app_outlined,
        title: 'Touch Display',
      ),
      TechnicalHighlight(icon: Icons.movie_outlined, title: 'Entertainment'),
    ],
  ),

  // 9. Smartphone
  ProductItemModel(
    title: 'Nova Smartphone',
    category: 'MOBILE PHONES',
    tag: 'SMART - PORTABLE',
    rating: '4.8 (950)',
    description: 'A modern smartphone for everyday communication.',
    longDescription: 'A smartphone for everyday communication, browsing, entertainment, and mobile applications. The design suits users who need a portable device for daily activities.',
    price: '599',
    originalPrice: '699',
    image: AppAssets.phone,
    images: [
      AppAssets.phone,
      AppAssets.phone2,
      AppAssets.phone3,
      AppAssets.phone4,
    ],
    badge: 'Popular',
    badgeColor: Color(0xFFEA580C),
    quantity: 1,
    highlights: [
      TechnicalHighlight(
        icon: Icons.phone_android_outlined,
        title: 'Smartphone',
      ),
      TechnicalHighlight(icon: Icons.apps_outlined, title: 'Mobile Apps'),
      TechnicalHighlight(icon: Icons.wifi_outlined, title: 'Connectivity'),
    ],
  ),

  // 10. Microphone
  ProductItemModel(
    title: 'Studio USB Microphone',
    category: 'AUDIO & RECORDING',
    tag: 'DESKTOP - CONTENT CREATION',
    rating: '4.7 (390)',
    description: 'A desktop microphone for calls and content creation.',
    longDescription: 'A desktop microphone designed for recording, online meetings, streaming setups, and content creation. Its dedicated form factor suits desktop audio workflows.',
    price: '89',
    originalPrice: '119',
    image: AppAssets.microphone,
    images: [
      AppAssets.microphone,
      AppAssets.microphone2,
      AppAssets.microphone3,
      AppAssets.microphone4,
    ],
    badge: null,
    quantity: 1,
    highlights: [
      TechnicalHighlight(
        icon: Icons.mic_none_outlined,
        title: 'Desktop Microphone',
      ),
      TechnicalHighlight(
        icon: Icons.graphic_eq_outlined,
        title: 'Audio Recording',
      ),
      TechnicalHighlight(
        icon: Icons.video_call_outlined,
        title: 'Online Meetings',
      ),
    ],
  ),

  // 11. Power Bank
  ProductItemModel(
    title: 'PowerBank Portable',
    category: 'MOBILE ACCESSORIES',
    tag: 'PORTABLE - ON THE GO',
    rating: '4.7 (510)',
    description: 'A portable power bank for charging devices on the go.',
    longDescription: 'A portable charging accessory for mobile devices during travel, commuting, and everyday activities. Check the actual product specifications for its capacity and charging speed.',
    price: '49',
    originalPrice: '69',
    image: AppAssets.powerBank,
    images: [
      AppAssets.powerBank,
      AppAssets.powerBank2,
      AppAssets.powerBank3,
      AppAssets.powerBank4,
    ],
    badge: 'Popular',
    badgeColor: Color(0xFFEA580C),
    quantity: 1,
    highlights: [
      TechnicalHighlight(
        icon: Icons.battery_charging_full_rounded,
        title: 'Portable Charging',
      ),
      TechnicalHighlight(
        icon: Icons.phone_android_outlined,
        title: 'Mobile Devices',
      ),
      TechnicalHighlight(
        icon: Icons.backpack_outlined,
        title: 'Travel Friendly',
      ),
    ],
  ),
];
