import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserRole { user, admin }

class User {
  final String id;
  final String email;
  final String name;
  final UserRole role;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
  });
}

class AuthService extends ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _currentUser != null;
  bool get isLoading => _isLoading;
  bool get isAdmin => _currentUser?.role == UserRole.admin;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Mock authentication logic
    if (email.isNotEmpty && password.isNotEmpty) {
      UserRole role = email.contains('admin') ? UserRole.admin : UserRole.user;
      
      _currentUser = User(
        id: '1',
        email: email,
        name: email.split('@')[0],
        role: role,
      );

      // Save to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', email);
      await prefs.setString('user_role', role.toString());

      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> signup(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    // Mock signup logic
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      _currentUser = User(
        id: '1',
        email: email,
        name: name,
        role: UserRole.user, // Default role for new users
      );

      // Save to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', email);
      await prefs.setString('user_role', UserRole.user.toString());

      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    _currentUser = null;
    
    // Clear shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('user_email');
    final roleString = prefs.getString('user_role');

    if (email != null && roleString != null) {
      final role = roleString == 'UserRole.admin' ? UserRole.admin : UserRole.user;
      _currentUser = User(
        id: '1',
        email: email,
        name: email.split('@')[0],
        role: role,
      );
      notifyListeners();
    }
  }
}