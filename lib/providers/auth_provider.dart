import 'package:flutter/material.dart';
import '../models/app_user.dart';

class AuthProvider extends ChangeNotifier {
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

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  void updateProfile({String? name, String? city}) {
    _currentUser = _currentUser.copyWith(
      name: name ?? _currentUser.name,
      city: city ?? _currentUser.city,
    );
    notifyListeners();
  }
}
