import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../providers/swap_provider.dart';
import 'explore_screen.dart';
import 'manage_requests_screen.dart';
import 'profile_screen.dart';
import 'wishlist_screen.dart';

/// ---------------------------------------------------------------------------
/// Main Navigation Shell Screen
/// Persistent container hosting the 4 primary tabs (Explore, Wishlist, Requests, Profile)
/// with a centered FloatingActionButton (+ Add Book) and bottom notched navigation bar.
/// ---------------------------------------------------------------------------
class MainNavigationScreen extends StatefulWidget {
  final int initialIndex; // Initial active tab index

  const MainNavigationScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final swapProvider = Provider.of<SwapProvider>(context);
    final pendingCount = swapProvider.incomingRequests.where((r) => r.status == 'Pending').length;

    // Tab pages held in memory via IndexedStack
    final pages = [
      const ExploreScreen(),
      const WishlistScreen(),
      const ManageRequestsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      // Centered FloatingActionButton for listing new books
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add_rounded, color: Colors.white, size: 28),
        onPressed: () {
          context.push('/add-book');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Bottom Navigation Bar with notch cutout for the FloatingActionButton
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: isDark ? AppColors.darkSurface : Colors.white,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.explore_rounded, 'Explore'),
              _buildNavItem(1, Icons.favorite_border_rounded, 'Wishlist'),
              const SizedBox(width: 40), // Gap reserved for FloatingActionButton
              _buildNavItem(
                2,
                Icons.swap_horizontal_circle_outlined,
                'Requests',
                badgeCount: pendingCount,
              ),
              _buildNavItem(3, Icons.person_outline_rounded, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper builder for bottom navigation icons with notification badges
  Widget _buildNavItem(int index, IconData icon, String label, {int badgeCount = 0}) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? AppColors.primary : Colors.grey;

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(icon, color: color, size: 24),
              if (badgeCount > 0)
                Positioned(
                  top: -4,
                  right: -6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '$badgeCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: color,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
