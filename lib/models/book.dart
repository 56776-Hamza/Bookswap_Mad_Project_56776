enum BookCondition {
  likeNew,
  good,
  fair,
}

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

class Book {
  final String id;
  final String ownerId;
  final String ownerName;
  final String ownerAvatar;
  final String ownerCity;
  final double ownerRating;
  final int ownerSwaps;
  final String title;
  final String author;
  final String category;
  final BookCondition condition;
  final String description;
  final String imageUrl;
  final String status; // Available, Requested, Accepted, Swapped
  final bool isWishlisted;
  final String distance;

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
