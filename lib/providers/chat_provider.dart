import 'package:flutter/material.dart';
import '../models/chat_message.dart';

/// ---------------------------------------------------------------------------
/// ChatProvider: Manages in-app message streams for each active swap request
/// ---------------------------------------------------------------------------
class ChatProvider extends ChangeNotifier {
  // Store chat message histories indexed by requestId
  final Map<String, List<ChatMessage>> _messages = {
    'req_4': [
      ChatMessage(
        id: 'm1',
        requestId: 'req_4',
        senderId: 'u_ayesha',
        senderName: 'Ayesha Khan',
        text: "Hi! I'm interested in your Atomic Habits book.",
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        isMe: false,
      ),
      ChatMessage(
        id: 'm2',
        requestId: 'req_4',
        senderId: 'u_xyz',
        senderName: 'XYZ',
        text: "Sure! Which book would you like to offer?",
        timestamp: DateTime.now().subtract(const Duration(minutes: 28)),
        isMe: true,
      ),
      ChatMessage(
        id: 'm3',
        requestId: 'req_4',
        senderId: 'u_ayesha',
        senderName: 'Ayesha Khan',
        text: "I can offer Clean Code. Let me know if that works.",
        timestamp: DateTime.now().subtract(const Duration(minutes: 27)),
        isMe: false,
      ),
      ChatMessage(
        id: 'm4',
        requestId: 'req_4',
        senderId: 'u_xyz',
        senderName: 'XYZ',
        text: "That sounds good! Let's meet at F-10 this weekend.",
        timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
        isMe: true,
      ),
    ],
  };

  /// Retrieves list of chat messages for a specific swap request ID
  List<ChatMessage> getMessages(String requestId) {
    return _messages[requestId] ?? [];
  }

  /// Sends a new message in the chat thread
  void sendMessage(String requestId, String text) {
    if (text.trim().isEmpty) return;

    final newMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      requestId: requestId,
      senderId: 'u_xyz',
      senderName: 'XYZ',
      text: text.trim(),
      timestamp: DateTime.now(),
      isMe: true,
    );

    if (_messages.containsKey(requestId)) {
      _messages[requestId]!.add(newMessage);
    } else {
      _messages[requestId] = [newMessage];
    }

    notifyListeners(); // Updates ChatScreen widget tree
  }
}
