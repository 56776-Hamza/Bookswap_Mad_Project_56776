import 'package:flutter/material.dart';
import '../models/swap_request.dart';

class SwapProvider extends ChangeNotifier {
  final List<SwapRequest> _requests = [
    SwapRequest(
      id: 'req_1',
      targetBookId: 'b3', // Clean Code
      targetBookTitle: 'Clean Code',
      targetBookAuthor: 'Robert C. Martin',
      targetBookCover: 'https://images.unsplash.com/photo-1532012197267-da84d127e765?auto=format&fit=crop&q=80&w=400',
      targetOwnerId: 'u_hamza',
      targetOwnerName: 'Hamza Rahim',
      requesterId: 'u_ali',
      requesterName: 'Ali Raza',
      requesterAvatar: 'https://i.pravatar.cc/150?img=12',
      offeredBookId: 'b_offered_1',
      offeredBookTitle: 'The Lean Startup',
      offeredBookAuthor: 'Eric Ries',
      offeredBookCover: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&q=80&w=400',
      status: 'Pending',
      message: 'Hi! I would love to trade my Lean Startup for your Clean Code book.',
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    SwapRequest(
      id: 'req_2',
      targetBookId: 'b2', // The Alchemist
      targetBookTitle: 'The Alchemist',
      targetBookAuthor: 'Paulo Coelho',
      targetBookCover: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=400',
      targetOwnerId: 'u_hamza',
      targetOwnerName: 'Hamza Rahim',
      requesterId: 'u_sara',
      requesterName: 'Sara Khan',
      requesterAvatar: 'https://i.pravatar.cc/150?img=9',
      offeredBookId: 'b_offered_2',
      offeredBookTitle: 'Sapiens',
      offeredBookAuthor: 'Yuval Noah Harari',
      offeredBookCover: 'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?auto=format&fit=crop&q=80&w=400',
      status: 'Pending',
      message: 'Would love to swap for The Alchemist!',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    SwapRequest(
      id: 'req_3',
      targetBookId: 'b7', // Deep Work
      targetBookTitle: 'Deep Work',
      targetBookAuthor: 'Cal Newport',
      targetBookCover: 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?auto=format&fit=crop&q=80&w=400',
      targetOwnerId: 'u_hamza',
      targetOwnerName: 'Hamza Rahim',
      requesterId: 'u_hassan',
      requesterName: 'Hassan',
      requesterAvatar: 'https://i.pravatar.cc/150?img=13',
      offeredBookId: 'b_offered_3',
      offeredBookTitle: 'Zero to One',
      offeredBookAuthor: 'Peter Thiel',
      offeredBookCover: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&q=80&w=400',
      status: 'Pending',
      message: 'Hi, is Deep Work available for swap?',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    SwapRequest(
      id: 'req_4',
      targetBookId: 'b1', // Atomic Habits
      targetBookTitle: 'Atomic Habits',
      targetBookAuthor: 'James Clear',
      targetBookCover: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&q=80&w=400',
      targetOwnerId: 'u_ayesha',
      targetOwnerName: 'Ayesha Khan',
      requesterId: 'u_hamza',
      requesterName: 'Hamza Rahim',
      requesterAvatar: 'https://i.pravatar.cc/300?img=11',
      offeredBookId: 'b3', // Clean Code
      offeredBookTitle: 'Clean Code',
      offeredBookAuthor: 'Robert C. Martin',
      offeredBookCover: 'https://images.unsplash.com/photo-1532012197267-da84d127e765?auto=format&fit=crop&q=80&w=400',
      status: 'Accepted',
      message: 'Hi! I would like to swap this book with you. Let me know if you are interested.',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
  ];

  List<SwapRequest> get allRequests => _requests;

  List<SwapRequest> get incomingRequests {
    return _requests.where((r) => r.targetOwnerId == 'u_hamza').toList();
  }

  List<SwapRequest> get outgoingRequests {
    return _requests.where((r) => r.requesterId == 'u_hamza').toList();
  }

  SwapRequest? getRequestById(String id) {
    try {
      return _requests.firstWhere((r) => r.id == id);
    } catch (_) {
      return null;
    }
  }

  void addRequest(SwapRequest request) {
    _requests.insert(0, request);
    notifyListeners();
  }

  void updateRequestStatus(String requestId, String newStatus) {
    final index = _requests.indexWhere((r) => r.id == requestId);
    if (index != -1) {
      _requests[index] = _requests[index].copyWith(status: newStatus);
      notifyListeners();
    }
  }
}
