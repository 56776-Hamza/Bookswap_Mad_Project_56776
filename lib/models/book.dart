/// ---------------------------------------------------------------------------
/// Book Condition Enum: Categorizes physical condition of listed books
/// ---------------------------------------------------------------------------
enum BookCondition {
  likeNew, // Mint condition with zero wear
  good,    // Slightly used but well taken care of
  fair,    // Noticeable wear or markings
}

/// Extension to get a readable string representation of book conditions
extension BookConditionExtension on BookCondition {
  String get displayName {
    switch (this) {
      case BookCondition.likeNew:
        return 'Like New';
      case BookCondition.good:
        return 'Good Condition';
      case BookCondition.fair:
        return 'Fair Condition';
    }
  }
}

/// ---------------------------------------------------------------------------
/// Book Model: Represents a single book listing on the platform
/// ---------------------------------------------------------------------------
class Book {
  final String id;             // Unique book ID
  final String ownerId;        // ID of the user listing the book
  final String ownerName;      // Name of the book owner
  final String ownerAvatar;    // Profile image URL of owner
  final String ownerCity;      // City location of owner
  final double ownerRating;    // Owner rating score
  final int ownerSwaps;        // Number of successful swaps by owner
  final String title;          // Book title
  final String author;         // Author name
  final String category;       // Category (Fiction, Self Help, Programming, etc.)
  final BookCondition condition;// Physical condition
  final String description;    // Detailed description of the book
  final String imageUrl;       // Cover image URL
  final String status;         // Status: Available, Requested, Accepted, Swapped
  final bool isWishlisted;     // Whether current user saved this book to wishlist
  final String distance;       // Distance string (e.g. 2 km away)

  Book({
    required this.id,
    required this.ownerId,
    required this.ownerName,
    required this.ownerAvatar,
    required this.ownerCity,
    required this.ownerRating,
    this.ownerSwaps = 12,
    required this.title,
    required this.author,
    required this.category,
    required this.condition,
    required this.description,
    required this.imageUrl,
    this.status = 'Available',
    this.isWishlisted = false,
    required this.distance,
  });

  /// Utility method to create a updated copy of Book with modified properties
  Book copyWith({
    String? id,
    String? ownerId,
    String? ownerName,
    String? ownerAvatar,
    String? ownerCity,
    double? ownerRating,
    int? ownerSwaps,
    String? title,
    String? author,
    String? category,
    BookCondition? condition,
    String? description,
    String? imageUrl,
    String? status,
    bool? isWishlisted,
    String? distance,
  }) {
    return Book(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      ownerName: ownerName ?? this.ownerName,
      ownerAvatar: ownerAvatar ?? this.ownerAvatar,
      ownerCity: ownerCity ?? this.ownerCity,
      ownerRating: ownerRating ?? this.ownerRating,
      ownerSwaps: ownerSwaps ?? this.ownerSwaps,
      title: title ?? this.title,
      author: author ?? this.author,
      category: category ?? this.category,
      condition: condition ?? this.condition,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
      isWishlisted: isWishlisted ?? this.isWishlisted,
      distance: distance ?? this.distance,
    );
  }
}
