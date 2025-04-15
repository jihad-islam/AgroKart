// lib/models/product.dart
class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double rating;
  final String category;
  final String description;
  final List<String> additionalImages;
  final int reviewCount;
  final bool inStock;
  final double discountPercentage;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    this.category = 'All',
    this.description = '',
    this.additionalImages = const [],
    this.reviewCount = 0,
    this.inStock = true,
    this.discountPercentage = 0,
  });
}
