// lib/services/product_service.dart
import '../models/product.dart';

class ProductService {
  // Sample product data (in a real app, this would come from an API or database)
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Fresh Carrots',
      imageUrl:
          'https://images.pexels.com/photos/65174/pexels-photo-65174.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 1.99,
      rating: 4.5,
      category: 'Vegetables',
      description:
          'Fresh organic carrots from local farms. Rich in vitamin A, these carrots are perfect for salads, cooking, or making fresh juice. No pesticides used in cultivation.',
      additionalImages: [
        'https://images.pexels.com/photos/143133/pexels-photo-143133.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        'https://images.pexels.com/photos/37641/carrots-vegetable-orange-vegetarian.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      reviewCount: 128,
      discountPercentage: 5,
    ),
    Product(
      id: '2',
      name: 'Organic Tomatoes',
      imageUrl:
          'https://images.pexels.com/photos/1367242/pexels-photo-1367242.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 2.49,
      rating: 4.8,
      category: 'Vegetables',
      description:
          'Juicy, organic tomatoes grown without harmful pesticides. Great for sandwiches, salads or cooking. Our tomatoes are harvested at peak ripeness to ensure the best flavor.',
      additionalImages: [
        'https://images.pexels.com/photos/533280/pexels-photo-533280.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        'https://images.pexels.com/photos/96616/pexels-photo-96616.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      reviewCount: 94,
      discountPercentage: 0,
    ),
    Product(
      id: '3',
      name: 'Fresh Onions',
      imageUrl:
          'https://images.pexels.com/photos/175414/pexels-photo-175414.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 1.29,
      rating: 4.6,
      category: 'Vegetables',
      description:
          'Farm-fresh onions with crisp layers and strong flavor. Essential ingredient for countless recipes. Our onions are carefully selected for quality and freshness.',
      additionalImages: [
        'https://images.pexels.com/photos/144206/pexels-photo-144206.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        'https://images.pexels.com/photos/533342/pexels-photo-533342.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      reviewCount: 76,
      discountPercentage: 10,
    ),
    Product(
      id: '4',
      name: 'Fresh Potatoes',
      imageUrl:
          'https://images.pexels.com/photos/144248/potatoes-vegetables-erdfrucht-bio-144248.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 1.59,
      rating: 4.7,
      category: 'Vegetables',
      description:
          'Premium quality potatoes with smooth skin and firm flesh. Perfect for boiling, baking, frying or mashing. Grown by local farmers using sustainable farming practices.',
      additionalImages: [
        'https://images.pexels.com/photos/2286776/pexels-photo-2286776.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        'https://images.pexels.com/photos/4110490/pexels-photo-4110490.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      reviewCount: 105,
      discountPercentage: 0,
    ),
    Product(
      id: '5',
      name: 'Red Apples',
      imageUrl:
          'https://images.pexels.com/photos/1510392/pexels-photo-1510392.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 2.99,
      rating: 4.9,
      category: 'Fruits',
      description:
          'Sweet and crisp red apples picked at perfect ripeness. Rich in antioxidants and dietary fiber. Enjoy as a healthy snack or use in your favorite dessert recipes.',
      additionalImages: [
        'https://images.pexels.com/photos/102104/pexels-photo-102104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        'https://images.pexels.com/photos/1630588/pexels-photo-1630588.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      reviewCount: 154,
      discountPercentage: 8,
    ),
    Product(
      id: '6',
      name: 'Bananas',
      imageUrl:
          'https://images.pexels.com/photos/1093038/pexels-photo-1093038.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 1.49,
      rating: 4.5,
      category: 'Fruits',
      description:
          'Perfectly ripened bananas with a sweet taste and soft texture. Rich in potassium and vitamin B6. Great for smoothies, baking or as a quick energy boost.',
      additionalImages: [
        'https://images.pexels.com/photos/2894200/pexels-photo-2894200.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        'https://images.pexels.com/photos/1166648/pexels-photo-1166648.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      reviewCount: 87,
      discountPercentage: 0,
    ),
    Product(
      id: '7',
      name: 'Rice',
      imageUrl:
          'https://images.pexels.com/photos/4110251/pexels-photo-4110251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 5.99,
      rating: 4.8,
      category: 'Crops',
      description:
          'Premium quality long-grain rice with a fragrant aroma. Easy to cook and fluffy texture when prepared. Sourced from sustainable farms with traditional cultivation methods.',
      additionalImages: [
        'https://images.pexels.com/photos/7421213/pexels-photo-7421213.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        'https://images.pexels.com/photos/1277416/pexels-photo-1277416.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      reviewCount: 112,
      discountPercentage: 15,
    ),
    Product(
      id: '8',
      name: 'Wheat',
      imageUrl:
          'https://images.pexels.com/photos/326082/pexels-photo-326082.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      price: 4.49,
      rating: 4.6,
      category: 'Crops',
      description:
          'Organic wheat grains harvested from pesticide-free farms. High in protein and dietary fiber. Perfect for home milling or cooking whole grain dishes.',
      additionalImages: [
        'https://images.pexels.com/photos/1537169/pexels-photo-1537169.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        'https://images.pexels.com/photos/533982/pexels-photo-533982.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      ],
      reviewCount: 68,
      discountPercentage: 0,
    ),
  ];

  // Get all products
  List<Product> getAllProducts() {
    return _products;
  }

  // Get products by category
  List<Product> getProductsByCategory(String category) {
    if (category == 'All') {
      return _products;
    }
    return _products.where((product) => product.category == category).toList();
  }

  // Search products
  List<Product> searchProducts(String query) {
    if (query.isEmpty) {
      return _products;
    }

    return _products
        .where(
          (product) => product.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  // Get product by id
  Product? getProductById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}
