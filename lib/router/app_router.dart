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

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) {
          final tab = state.uri.queryParameters['tab'];
          final initialIndex = tab != null ? int.tryParse(tab) ?? 0 : 0;
          return MainNavigationScreen(initialIndex: initialIndex);
        },
      ),
      GoRoute(
        path: '/book-details/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return BookDetailsScreen(bookId: id);
        },
      ),
      GoRoute(
        path: '/add-book',
        builder: (context, state) => const AddBookScreen(),
      ),
      GoRoute(
        path: '/request-swap/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return SwapRequestScreen(targetBookId: id);
        },
      ),
      GoRoute(
        path: '/manage-requests',
        builder: (context, state) => const ManageRequestsScreen(),
      ),
      GoRoute(
        path: '/chat/:requestId',
        builder: (context, state) {
          final requestId = state.pathParameters['requestId'] ?? '';
          return ChatScreen(requestId: requestId);
        },
      ),
      GoRoute(
        path: '/wishlist',
        builder: (context, state) => const WishlistScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/edit-profile',
        builder: (context, state) => const EditProfileScreen(),
      ),
    ],
  );
}
