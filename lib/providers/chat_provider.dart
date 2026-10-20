import 'package:flutter/material.dart';
import '../models/chat_message.dart';

class ChatProvider extends ChangeNotifier {
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
        senderId: 'u_hamza',
        senderName: 'Hamza Rahim',
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
        senderId: 'u_hamza',
        senderName: 'Hamza Rahim',
        text: "That sounds good! Let's meet at F-10 this weekend.",
        timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
        isMe: true,
      ),
    ],
  };

  List<ChatMessage> getMessages(String requestId) {
    return _messages[requestId] ?? [];
  }

  void sendMessage(String requestId, String text) {
    if (text.trim().isEmpty) return;

    final newMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      requestId: requestId,
      senderId: 'u_hamza',
      senderName: 'Hamza Rahim',
      text: text.trim(),
      timestamp: DateTime.now(),
      isMe: true,
    );

    if (_messages.containsKey(requestId)) {
      _messages[requestId]!.add(newMessage);
    } else {
      _messages[requestId] = [newMessage];
    }

    notifyListeners();
  }
}
