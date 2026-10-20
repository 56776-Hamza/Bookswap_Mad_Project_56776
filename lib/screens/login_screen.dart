import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../core/widgets/custom_button.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showEmailFields = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (_emailController.text.isNotEmpty) {
      authProvider.login(_emailController.text, _passwordController.text);
    } else {
      authProvider.loginWithGoogle();
    }
    context.go('/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              // App Logo
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.menu_book_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                    Positioned(
                      right: 14,
                      top: 18,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.north_east_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'BookSwap',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.lightTextPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in to continue your\nreading journey',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.lightTextSecondary,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 36),

              if (_showEmailFields) ...[
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  text: 'Sign In',
                  onPressed: _handleLogin,
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _showEmailFields = false;
                    });
                  },
                  child: const Text('Back to options'),
                ),
              ] else ...[
                // Google Sign In
                CustomOutlinedButton(
                  text: 'Continue with Google',
                  leading: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      'G',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false).loginWithGoogle();
                    context.go('/main');
                  },
                ),
                const SizedBox(height: 14),

                // Email Sign In
                CustomOutlinedButton(
                  text: 'Sign in with Email',
                  leading: const Icon(Icons.email_outlined, color: AppColors.lightTextPrimary),
                  onPressed: () {
                    setState(() {
                      _showEmailFields = true;
                    });
                  },
                ),
                const SizedBox(height: 14),

                // Create Account
                PrimaryButton(
                  text: 'Create New Account',
                  onPressed: () {
                    _handleLogin();
                  },
                ),
              ],

              const SizedBox(height: 40),
              // Footer Terms
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'By continuing you agree to our\nTerms & Privacy Policy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.lightTextSecondary,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
