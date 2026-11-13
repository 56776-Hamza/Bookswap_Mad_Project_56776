import 'package:go_router/go_router.dart';

import '../screens/splash_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/login_screen.dart';
import '../screens/main_navigation_screen.dart';
import '../screens/book_details_screen.dart';
import '../screens/add_book_screen.dart';
import '../screens/swap_request_screen.dart';
import '../screens/manage_requests_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/wishlist_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/edit_profile_screen.dart';

/// ---------------------------------------------------------------------------
/// AppRouter: Central GoRouter configuration for page navigation
/// Maps URL path routes to their respective screen widgets
/// ---------------------------------------------------------------------------
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/', // App launch starts at SplashScreen
    routes: [
      // 1. Splash Screen Route
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      // 2. Onboarding Feature Carousel Route
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      // 3. Login & Authentication Route
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      // 4. Main Navigation Container Route (Bottom Navigation Bar)
      GoRoute(
        path: '/main',
        builder: (context, state) {
          final tab = state.uri.queryParameters['tab'];
          final initialIndex = tab != null ? int.tryParse(tab) ?? 0 : 0;
          return MainNavigationScreen(initialIndex: initialIndex);
        },
      ),
      // 5. Book Details Screen Route (with path parameter :id)
      GoRoute(
        path: '/book-details/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return BookDetailsScreen(bookId: id);
        },
      ),
      // 6. Add Book Screen Route
      GoRoute(
        path: '/add-book',
        builder: (context, state) => const AddBookScreen(),
      ),
      // 7. Request Swap Screen Route (with path parameter :id)
      GoRoute(
        path: '/request-swap/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return SwapRequestScreen(targetBookId: id);
        },
      ),
      // 8. Manage Requests Screen Route
      GoRoute(
        path: '/manage-requests',
        builder: (context, state) => const ManageRequestsScreen(),
      ),
      // 9. Chat Screen Route (with path parameter :requestId)
      GoRoute(
        path: '/chat/:requestId',
        builder: (context, state) {
          final requestId = state.pathParameters['requestId'] ?? '';
          return ChatScreen(requestId: requestId);
        },
      ),
      // 10. Saved Wishlist Screen Route
      GoRoute(
        path: '/wishlist',
        builder: (context, state) => const WishlistScreen(),
      ),
      // 11. Profile Screen Route
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      // 12. Notifications Screen Route
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      // 13. Edit Profile Screen Route
      GoRoute(
        path: '/edit-profile',
        builder: (context, state) => const EditProfileScreen(),
      ),
    ],
  );
}
