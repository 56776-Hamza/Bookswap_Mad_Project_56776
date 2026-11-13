import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/theme/app_colors.dart';

/// ---------------------------------------------------------------------------
/// Screen 1: Splash Screen
/// App launch branding screen with logo emblem, tagline, and progress spinner.
/// Automatically transitions to Onboarding Screen after 3 seconds.
/// ---------------------------------------------------------------------------
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start a 3-second timer to auto-navigate to onboarding screen
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/onboarding');
      }
    });
  }

  @override
  void dispose() {
    // Safely cancel timer to prevent memory leaks on screen disposal
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: Stack(
        children: [
          // Background Aesthetic Radial Wave Decoration
          Positioned(
            bottom: -100,
            left: -50,
            right: -50,
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primaryLight.withValues(alpha: 0.25),
                    AppColors.primary.withValues(alpha: 0.05),
                    Colors.transparent,
                  ],
                  radius: 0.8,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  // BookSwap App Brand Logo Emblem
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.menu_book_rounded,
                          size: 64,
                          color: Colors.white,
                        ),
                        Positioned(
                          right: 20,
                          top: 25,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: AppColors.accent,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.north_east_rounded,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // App Main Title
                  const Text(
                    'BookSwap',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // App Tagline
                  const Text(
                    'Swap Books\nShare Knowledge\nBuild a Reading Community',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.lightTextSecondary,
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  
                  // Loading Indicator
                  const SizedBox(
                    width: 32,
                    height: 32,
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                      strokeWidth: 3,
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
