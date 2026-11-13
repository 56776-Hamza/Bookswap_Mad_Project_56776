import 'package:flutter/material.dart';

/// ---------------------------------------------------------------------------
/// AppColors: Centralized color palette for Emerald Green theme (Light & Dark)
/// Defines all primary, secondary, background, surface, and state colors.
/// ---------------------------------------------------------------------------
class AppColors {
  // Brand Colors matching design specification
  static const Color primary = Color(0xFF2E7D32);      // Primary Emerald Green (#2E7D32)
  static const Color primaryTeal = Color(0xFF1E6F5C);  // Emerald Teal (#1E6F5C)
  static const Color primaryLight = Color(0xFF66BB6A); // Light Emerald (#66BB6A)
  static const Color accent = Color(0xFFFFA726);       // Warm Amber Accent (#FFA726)
  static const Color amber = Color(0xFFFFA726);        // Rating Star Amber
  static const Color amberLight = Color(0xFFFFE082);   // Soft Amber Background

  // Light Theme Palette
  static const Color lightBackground = Color(0xFFF5F7FA); // Soft Grey Background (#F5F7FA)
  static const Color lightSurface = Color(0xFFFFFFFF);    // Pure White Card Surface
  static const Color lightTextPrimary = Color(0xFF1F2933); // Dark Primary Text
  static const Color lightTextSecondary = Color(0xFF6B7280);// Muted Secondary Text
  static const Color lightBorder = Color(0xFFE5E7EB);     // Subtle Border Grey

  // Dark Theme Palette
  static const Color darkBackground = Color(0xFF121615);  // Deep Dark Background (#121615)
  static const Color darkSurface = Color(0xFF202824);     // Dark Surface Container (#202824)
  static const Color darkTextPrimary = Color(0xFFF5F7FA);  // Light Primary Text for Dark Mode
  static const Color darkTextSecondary = Color(0xFF9CA3AF); // Muted Secondary Text for Dark Mode
  static const Color darkBorder = Color(0xFF2D3748);      // Dark Mode Divider & Border Color

  // System Status Colors
  static const Color success = Color(0xFF2E9E5B);
  static const Color error = Color(0xFFC0392B);
  static const Color warning = Color(0xFFF39C12);

  // Category & Chip Backgrounds
  static const Color chipBackgroundLight = Color(0xFFE8F5E9);
  static const Color chipBackgroundDark = Color(0xFF1B382B);
}
