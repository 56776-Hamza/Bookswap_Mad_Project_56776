import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../core/widgets/custom_button.dart';
import '../models/book.dart';
import '../models/swap_request.dart';
import '../providers/book_provider.dart';
import '../providers/swap_provider.dart';
import '../providers/auth_provider.dart';

class SwapRequestScreen extends StatefulWidget {
  final String targetBookId;

  const SwapRequestScreen({
    super.key,
    required this.targetBookId,
  });

  @override
  State<SwapRequestScreen> createState() => _SwapRequestScreenState();
}

class _SwapRequestScreenState extends State<SwapRequestScreen> {
  Book? _selectedOfferedBook;
  final _messageController = TextEditingController(
    text: "Hi! I would like to swap this book with you. Let me know if you are interested.",
  );

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendRequest(Book targetBook) {
    if (_selectedOfferedBook == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select one of your books to offer in exchange.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final swapProvider = Provider.of<SwapProvider>(context, listen: false);

    final request = SwapRequest(
      id: 'req_${DateTime.now().millisecondsSinceEpoch}',
      targetBookId: targetBook.id,
      targetBookTitle: targetBook.title,
      targetBookAuthor: targetBook.author,
      targetBookCover: targetBook.imageUrl,
      targetOwnerId: targetBook.ownerId,
      targetOwnerName: targetBook.ownerName,
      requesterId: authProvider.currentUser.id,
      requesterName: authProvider.currentUser.name,
      requesterAvatar: authProvider.currentUser.avatarUrl,
      offeredBookId: _selectedOfferedBook!.id,
      offeredBookTitle: _selectedOfferedBook!.title,
      offeredBookAuthor: _selectedOfferedBook!.author,
      offeredBookCover: _selectedOfferedBook!.imageUrl,
      status: 'Pending',
      message: _messageController.text,
      createdAt: DateTime.now(),
    );

    swapProvider.addRequest(request);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Swap request sent successfully!'),
        backgroundColor: AppColors.primary,
      ),
    );

    context.go('/manage-requests');
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    final targetBook = bookProvider.getBookById(widget.targetBookId);
    final myBooks = bookProvider.myAvailableBooks;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (targetBook == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Request Swap')),
        body: const Center(child: Text('Book not found.')),
      );
    }

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Request Swap'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Requested Book Info
              const Text(
                'You want to get:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkSurface : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                  ),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        targetBook.imageUrl,
                        width: 60,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            targetBook.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                            ),
                          ),
                          Text(
                            'by ${targetBook.author}',
                            style: TextStyle(
                              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Owner: ${targetBook.ownerName}',
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Offer Choice Section
              const Text(
                'Select one of your books to offer:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              if (myBooks.isEmpty) ...[
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkSurface : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'You do not have any available books in your library to offer.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          context.push('/add-book');
                        },
                        child: const Text('Add a Book First'),
                      ),
                    ],
                  ),
                ),
              ] else ...[
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myBooks.length,
                    itemBuilder: (context, index) {
                      final myBook = myBooks[index];
                      final isSelected = _selectedOfferedBook?.id == myBook.id;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedOfferedBook = myBook;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 110,
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.darkSurface : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected ? AppColors.primary : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
                              width: isSelected ? 2.5 : 1.0,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      myBook.imageUrl,
                                      height: 90,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  if (isSelected)
                                    Positioned(
                                      top: 4,
                                      right: 4,
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: const BoxDecoration(
                                          color: AppColors.primary,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                myBook.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],

              const SizedBox(height: 28),

              // Message Section
              const Text(
                'Add a Note for the Owner:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _messageController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Say hi or propose a convenient location for swap...',
                ),
              ),
              const SizedBox(height: 36),

              // Send Request Button
              PrimaryButton(
                text: 'Send Swap Request',
                icon: Icons.send_rounded,
                onPressed: () => _sendRequest(targetBook),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
