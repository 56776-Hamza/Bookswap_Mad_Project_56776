/// ---------------------------------------------------------------------------
/// SwapRequest Model: Represents a peer-to-peer book swap proposal
/// Contains information about requested book, offered book, requester, and status.
/// ---------------------------------------------------------------------------
class SwapRequest {
  final String id;                  // Unique swap request ID
  
  // Requested Target Book Details
  final String targetBookId;
  final String targetBookTitle;
  final String targetBookAuthor;
  final String targetBookCover;
  final String targetOwnerId;
  final String targetOwnerName;

  // Requester User Details
  final String requesterId;
  final String requesterName;
  final String requesterAvatar;

  // Offered Exchange Book Details
  final String offeredBookId;
  final String offeredBookTitle;
  final String offeredBookAuthor;
  final String offeredBookCover;

  // Request Status: Pending, Accepted, Rejected, Cancelled, Completed
  final String status;
  final String message;            // Optional note/message for book owner
  final DateTime createdAt;        // Timestamp when proposal was submitted

  SwapRequest({
    required this.id,
    required this.targetBookId,
    required this.targetBookTitle,
    required this.targetBookAuthor,
    required this.targetBookCover,
    required this.targetOwnerId,
    required this.targetOwnerName,
    required this.requesterId,
    required this.requesterName,
    required this.requesterAvatar,
    required this.offeredBookId,
    required this.offeredBookTitle,
    required this.offeredBookAuthor,
    required this.offeredBookCover,
    this.status = 'Pending',
    required this.message,
    required this.createdAt,
  });

  /// Utility method to copy and update specific fields of a SwapRequest
  SwapRequest copyWith({
    String? id,
    String? targetBookId,
    String? targetBookTitle,
    String? targetBookAuthor,
    String? targetBookCover,
    String? targetOwnerId,
    String? targetOwnerName,
    String? requesterId,
    String? requesterName,
    String? requesterAvatar,
    String? offeredBookId,
    String? offeredBookTitle,
    String? offeredBookAuthor,
    String? offeredBookCover,
    String? status,
    String? message,
    DateTime? createdAt,
  }) {
    return SwapRequest(
      id: id ?? this.id,
      targetBookId: targetBookId ?? this.targetBookId,
      targetBookTitle: targetBookTitle ?? this.targetBookTitle,
      targetBookAuthor: targetBookAuthor ?? this.targetBookAuthor,
      targetBookCover: targetBookCover ?? this.targetBookCover,
      targetOwnerId: targetOwnerId ?? this.targetOwnerId,
      targetOwnerName: targetOwnerName ?? this.targetOwnerName,
      requesterId: requesterId ?? this.requesterId,
      requesterName: requesterName ?? this.requesterName,
      requesterAvatar: requesterAvatar ?? this.requesterAvatar,
      offeredBookId: offeredBookId ?? this.offeredBookId,
      offeredBookTitle: offeredBookTitle ?? this.offeredBookTitle,
      offeredBookAuthor: offeredBookAuthor ?? this.offeredBookAuthor,
      offeredBookCover: offeredBookCover ?? this.offeredBookCover,
      status: status ?? this.status,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
