class AppUser {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  final String city;
  final double ratingAvg;
  final int swapCount;
  final int listingCount;

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
