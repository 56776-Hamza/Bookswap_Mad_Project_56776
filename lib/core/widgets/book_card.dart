import 'package:flutter/material.dart';
import '../../models/book.dart';
import '../theme/app_colors.dart';

/// ---------------------------------------------------------------------------
/// BookCard Widget: Display card for book grid and recommendation lists
/// Displays cover image, title, author, category badge, and wishlist toggle button
/// ---------------------------------------------------------------------------
class BookCard extends StatelessWidget {
  final Book book;                 // Book data object to display
  final VoidCallback onTap;         // Callback when card is tapped (opens book details)
  final VoidCallback onWishlistTap; // Callback when wishlist heart icon is tapped

  const BookCard({
    super.key,
    required this.book,
    required this.onTap,
    required this.onWishlistTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Book Image Container with Heart Wishlist Overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: AspectRatio(
                    aspectRatio: 0.85,
                    child: Image.network(
                      book.imageUrl,
                      fit: BoxFit.cover,
                      // Fallback gradient decoration if network image fails to load
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFF2E7D32), Color(0xFF1E6F5C)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                book.title,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Wishlist Heart Button Overlay
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onWishlistTap,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Icon(
                        book.isWishlisted ? Icons.favorite : Icons.favorite_border,
                        size: 18,
                        color: book.isWishlisted ? Colors.red : Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Book Details Section (Title, Author, Category Chip)
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    book.author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Category Badge Pill
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.chipBackgroundDark : AppColors.chipBackgroundLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      book.category,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: isDark ? AppColors.primaryLight : AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
