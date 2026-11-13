/// ---------------------------------------------------------------------------
/// AppUser Data Model: Represents a user registered in the BookSwap system
/// Note: Enforces privacy by storing and showing city only (never full home address).
/// ---------------------------------------------------------------------------
class AppUser {
  final String id;           // Unique user identifier
  final String name;         // Display name of the user
  final String email;        // Email address of the user
  final String avatarUrl;    // Profile image URL
  final String city;         // City location (e.g. Islamabad) for local swaps
  final double ratingAvg;    // Average star rating from previous book swaps
  final int swapCount;       // Total number of completed book swaps
  final int listingCount;   // Total active books listed by the user

  AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
    required this.city,
    required this.ratingAvg,
    required this.swapCount,
    required this.listingCount,
  });

  /// Utility method to create a updated copy of AppUser with modified fields
  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    String? avatarUrl,
    String? city,
    double? ratingAvg,
    int? swapCount,
    int? listingCount,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      city: city ?? this.city,
      ratingAvg: ratingAvg ?? this.ratingAvg,
      swapCount: swapCount ?? this.swapCount,
      listingCount: listingCount ?? this.listingCount,
    );
  }
}
