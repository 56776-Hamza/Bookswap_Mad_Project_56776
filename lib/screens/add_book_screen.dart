import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/theme/app_colors.dart';
import '../core/widgets/custom_button.dart';
import '../models/book.dart';
import '../providers/book_provider.dart';
import '../providers/auth_provider.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedCategory = 'Fiction';
  BookCondition _selectedCondition = BookCondition.good;
  bool _isPublishing = false;

  final List<String> _categories = [
    'Fiction',
    'Self Help',
    'Programming',
    'Science Fiction',
    'Academic',
    'History',
    'Biography',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitBook() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isPublishing = true;
      });

      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final bookProvider = Provider.of<BookProvider>(context, listen: false);

      final newBook = Book(
        id: 'b_${DateTime.now().millisecondsSinceEpoch}',
        ownerId: authProvider.currentUser.id,
        ownerName: authProvider.currentUser.name,
        ownerAvatar: authProvider.currentUser.avatarUrl,
        ownerCity: authProvider.currentUser.city,
        ownerRating: authProvider.currentUser.ratingAvg,
        ownerSwaps: authProvider.currentUser.swapCount,
        title: _titleController.text.trim(),
        author: _authorController.text.trim(),
        category: _selectedCategory,
        condition: _selectedCondition,
        description: _descriptionController.text.trim().isEmpty
            ? 'No description provided.'
            : _descriptionController.text.trim(),
        imageUrl: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&q=80&w=400',
        status: 'Available',
        distance: '0 km away',
      );

      bookProvider.addBook(newBook);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Book listed successfully!'),
          backgroundColor: AppColors.primary,
        ),
      );

      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBackground : AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Add New Book'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Upload Placeholder Container
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Photo selected from gallery.')),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkSurface : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight.withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add_a_photo_rounded,
                            color: AppColors.primary,
                            size: 28,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Tap to add cover photo',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Book Title Field
                const Text(
                  'Book Title',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _titleController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Please enter book title' : null,
                  decoration: const InputDecoration(
                    hintText: 'e.g. Atomic Habits',
                    prefixIcon: Icon(Icons.book_rounded),
                  ),
                ),
                const SizedBox(height: 18),

                // Author Name Field
                const Text(
                  'Author Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _authorController,
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Please enter author name' : null,
                  decoration: const InputDecoration(
                    hintText: 'e.g. James Clear',
                    prefixIcon: Icon(Icons.person_outline_rounded),
                  ),
                ),
                const SizedBox(height: 18),

                // Category Dropdown
                const Text(
                  'Category',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: _selectedCategory,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                  items: _categories.map((cat) {
                    return DropdownMenuItem(
                      value: cat,
                      child: Text(cat),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        _selectedCategory = val;
                      });
                    }
                  },
                ),
                const SizedBox(height: 18),

                // Condition Selector
                const Text(
                  'Book Condition',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 10,
                  children: BookCondition.values.map((cond) {
                    final isSelected = _selectedCondition == cond;
                    return ChoiceChip(
                      label: Text(cond.displayName),
                      selected: isSelected,
                      selectedColor: AppColors.primary,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedCondition = cond;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 18),

                // Description Field
                const Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Describe the book condition, edition, or exchange preference...',
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: 30),

                // Publish Button
                PrimaryButton(
                  text: 'Publish Listing',
                  icon: Icons.check_circle_outline_rounded,
                  isLoading: _isPublishing,
                  onPressed: _submitBook,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
