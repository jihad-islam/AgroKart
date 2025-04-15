// lib/services/user_service.dart
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class UserService {
  // Singleton instance
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  // Current user
  User? _currentUser;

  // Stream controller for authentication changes
  final _authController = StreamController<User?>.broadcast();
  Stream<User?> get authStateChanges => _authController.stream;

  // Local storage keys
  static const String _userKey = 'current_user';
  static const String _usersKey = 'all_users';

  // Get current user
  User? get currentUser => _currentUser;

  // Check if user is logged in
  bool get isLoggedIn => _currentUser != null && !_currentUser!.isGuest;

  // Check if user is guest
  bool get isGuest => _currentUser != null && _currentUser!.isGuest;

  // Initialize - load user data from storage
  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();

    // Load current user if exists
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      try {
        final Map<String, dynamic> userMap = json.decode(userJson);
        _currentUser = User.fromJson(userMap);
        _authController.add(_currentUser);
      } catch (e) {
        print('Error loading user: $e');
      }
    }
  }

  // Get all users from storage
  Future<Map<String, User>> _getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString(_usersKey);

    if (usersJson == null) {
      return {};
    }

    try {
      final Map<String, dynamic> usersMap = json.decode(usersJson);
      return usersMap.map(
        (key, value) =>
            MapEntry(key, User.fromJson(value as Map<String, dynamic>)),
      );
    } catch (e) {
      print('Error loading users: $e');
      return {};
    }
  }

  // Save all users to storage
  Future<void> _saveUsers(Map<String, User> users) async {
    final prefs = await SharedPreferences.getInstance();
    final usersMap = users.map((key, value) => MapEntry(key, value.toJson()));
    await prefs.setString(_usersKey, json.encode(usersMap));
  }

  // Save current user to storage
  Future<void> _saveCurrentUser() async {
    if (_currentUser == null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userKey);
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, json.encode(_currentUser!.toJson()));
  }

  // Register a new user
  Future<User?> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Get all users
    final users = await _getUsers();

    // Check if email already exists
    if (users.containsKey(email)) {
      throw Exception('Email already in use');
    }

    // Create new user
    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      phone: phone,
      isGuest: false,
      password: password, // In a real app, you would hash this
    );

    // Add user to map
    users[email] = user;
    await _saveUsers(users);

    // Set current user and notify listeners
    _currentUser = user;
    await _saveCurrentUser();
    _authController.add(user);

    return user;
  }

  // Create a guest user
  Future<User?> continueAsGuest() async {
    // Create guest user
    final user = User(
      id: 'guest-${DateTime.now().millisecondsSinceEpoch}',
      name: 'Guest User',
      email: 'guest@example.com',
      isGuest: true,
    );

    // Set current user and notify listeners
    _currentUser = user;
    await _saveCurrentUser();
    _authController.add(user);

    return user;
  }

  // Login user
  Future<User?> login({required String email, required String password}) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Get all users
    final users = await _getUsers();

    // Check if user exists
    if (!users.containsKey(email)) {
      throw Exception('User not found');
    }

    // Check password (in a real app, you would verify hashed passwords)
    final user = users[email]!;
    if (user.password != password) {
      throw Exception('Invalid password');
    }

    // Set current user and notify listeners
    _currentUser = user;
    await _saveCurrentUser();
    _authController.add(user);

    return user;
  }

  // Logout user
  Future<void> logout() async {
    _currentUser = null;
    await _saveCurrentUser();
    _authController.add(null);
  }

  // Update user profile
  Future<User?> updateProfile({
    String? name,
    String? phone,
    String? address,
    String? profileImage,
  }) async {
    if (_currentUser == null) {
      throw Exception('No user logged in');
    }

    // Cannot update guest user
    if (_currentUser!.isGuest) {
      throw Exception('Guest users cannot update profile');
    }

    // Update user
    final updatedUser = _currentUser!.copyWith(
      name: name,
      phone: phone,
      address: address,
      profileImage: profileImage,
    );

    // Update in storage
    final users = await _getUsers();
    users[_currentUser!.email] = updatedUser;
    await _saveUsers(users);

    // Update current user
    _currentUser = updatedUser;
    await _saveCurrentUser();
    _authController.add(updatedUser);

    return updatedUser;
  }

  // Add product to favorites
  Future<void> toggleFavorite(String productId) async {
    if (_currentUser == null) return;

    // Guest users cannot have favorites
    if (_currentUser!.isGuest) {
      throw Exception('Please sign in to save favorites');
    }

    List<String> updatedFavorites = List.from(_currentUser!.favorites);

    if (updatedFavorites.contains(productId)) {
      updatedFavorites.remove(productId);
    } else {
      updatedFavorites.add(productId);
    }

    final updatedUser = _currentUser!.copyWith(favorites: updatedFavorites);

    // Update in storage
    final users = await _getUsers();
    users[_currentUser!.email] = updatedUser;
    await _saveUsers(users);

    // Update current user
    _currentUser = updatedUser;
    await _saveCurrentUser();
    _authController.add(updatedUser);
  }

  // Dispose
  void dispose() {
    _authController.close();
  }
}
