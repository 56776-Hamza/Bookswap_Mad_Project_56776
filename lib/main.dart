import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'providers/theme_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/book_provider.dart';
import 'providers/swap_provider.dart';
import 'providers/chat_provider.dart';
import 'router/app_router.dart';

/// ---------------------------------------------------------------------------
/// Main Entry Point of the BookSwap Application
/// ---------------------------------------------------------------------------
void main() {
  // Ensures Flutter framework widgets and services are initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BookSwapApp());
}

/// ---------------------------------------------------------------------------
/// Root Widget: Configures MultiProvider for state management and MaterialApp router
/// ---------------------------------------------------------------------------
class BookSwapApp extends StatelessWidget {
  const BookSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiProvider registers all state management classes across the application
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()), // Manages Light / Dark mode
        ChangeNotifierProvider(create: (_) => AuthProvider()),  // Manages User login & profile
        ChangeNotifierProvider(create: (_) => BookProvider()),  // Manages Book listings & wishlist
        ChangeNotifierProvider(create: (_) => SwapProvider()),  // Manages Swap requests
        ChangeNotifierProvider(create: (_) => ChatProvider()),  // Manages In-app messaging
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          // MaterialApp.router wires GoRouter and application themes
          return MaterialApp.router(
            title: 'BookSwap',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
