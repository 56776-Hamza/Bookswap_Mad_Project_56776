import 'package:flutter/material.dart';
import '../models/app_user.dart';

/// ---------------------------------------------------------------------------
/// AuthProvider: Manages authentication state, current user profile, and edits
/// ---------------------------------------------------------------------------
class AuthProvider extends ChangeNotifier {
  // Current active user model state
  AppUser _currentUser = AppUser(
    id: 'u_xyz',
    name: 'XYZ',
    email: 'xyz@example.com',
    avatarUrl: 'https://i.pravatar.cc/300?img=11',
    city: 'Islamabad',
    ratingAvg: 4.8,
    swapCount: 25,
    listingCount: 12,
  );

  bool _isLoggedIn = true;

  AppUser get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;

  /// Handles standard email/password login action
  void login(String email, String password) {
    _isLoggedIn = true;
    _currentUser = AppUser(
      id: 'u_xyz',
      name: email.contains('@') ? email.split('@')[0] : 'XYZ',
      email: email,
      avatarUrl: 'https://i.pravatar.cc/300?img=11',
      city: 'Islamabad',
      ratingAvg: 4.8,
      swapCount: 25,
      listingCount: 12,
    );
    notifyListeners();
  }

  /// Handles Google sign-in action
  void loginWithGoogle() {
    _isLoggedIn = true;
    _currentUser = AppUser(
      id: 'u_xyz',
      name: 'XYZ',
      email: 'xyz@example.com',
      avatarUrl: 'https://i.pravatar.cc/300?img=11',
      city: 'Islamabad',
      ratingAvg: 4.8,
      swapCount: 25,
      listingCount: 12,
    );
    notifyListeners();
  }

  /// Handles user logout action
  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  /// Updates current user profile details (Name and City location)
  void updateProfile({String? name, String? city}) {
    _currentUser = _currentUser.copyWith(
      name: name ?? _currentUser.name,
      city: city ?? _currentUser.city,
    );
    notifyListeners();
  }
}
