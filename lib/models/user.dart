// lib/models/user.dart
class User {
  final String id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? profileImage;
  final List<String> favorites;
  final List<String> recentOrders;
  final bool isGuest;
  final String? password; // This should be hashed in a real app

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.profileImage,
    this.favorites = const [],
    this.recentOrders = const [],
    this.isGuest = false,
    this.password,
  });

  // Create a copy of the user with updated fields
  User copyWith({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? profileImage,
    List<String>? favorites,
    List<String>? recentOrders,
    bool? isGuest,
    String? password,
  }) {
    return User(
      id: this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
      favorites: favorites ?? this.favorites,
      recentOrders: recentOrders ?? this.recentOrders,
      isGuest: isGuest ?? this.isGuest,
      password: password ?? this.password,
    );
  }

  // Convert user to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'profileImage': profileImage,
      'favorites': favorites,
      'recentOrders': recentOrders,
      'isGuest': isGuest,
      'password': password,
    };
  }

  // Create user from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      profileImage: json['profileImage'],
      favorites: List<String>.from(json['favorites'] ?? []),
      recentOrders: List<String>.from(json['recentOrders'] ?? []),
      isGuest: json['isGuest'] ?? false,
      password: json['password'],
    );
  }
}
