/// ---------------------------------------------------------------------------
/// ChatMessage Model: Represents an individual chat message sent between users
/// ---------------------------------------------------------------------------
class ChatMessage {
  final String id;           // Unique message ID
  final String requestId;    // Associated swap request ID
  final String senderId;     // User ID of the message sender
  final String senderName;   // Name of sender
  final String text;         // Message body content
  final DateTime timestamp;  // Time when message was sent
  final bool isMe;           // True if current user sent this message

  ChatMessage({
    required this.id,
    required this.requestId,
    required this.senderId,
    required this.senderName,
    required this.text,
    required this.timestamp,
    required this.isMe,
  });
}
