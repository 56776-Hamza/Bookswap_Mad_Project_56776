import 'package:flutter/material.dart';
import '../models/book.dart';

class BookProvider extends ChangeNotifier {
  String _selectedCategory = 'All';
  String _selectedCondition = 'All';
  String _searchQuery = '';

  final List<Book> _books = [
    Book(
      id: 'b1',
      ownerId: 'u_ayesha',
      ownerName: 'Ayesha Khan',
      ownerAvatar: 'https://i.pravatar.cc/150?img=5',
      ownerCity: 'Islamabad',
      ownerRating: 4.9,
      ownerSwaps: 12,
      title: 'Atomic Habits',
      author: 'James Clear',
      category: 'Self Help',
      condition: BookCondition.good,
      description: 'An excellent book on building better habits. Slightly used, good condition.',
      imageUrl: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&q=80&w=400',
      status: 'Available',
      isWishlisted: true,
      distance: '2 km away',
    ),
    Book(
      id: 'b2',
      ownerId: 'u_sara',
      ownerName: 'Sara Khan',
      ownerAvatar: 'https://i.pravatar.cc/150?img=9',
      ownerCity: 'Islamabad',
      ownerRating: 4.7,
      ownerSwaps: 8,
      title: 'The Alchemist',
      author: 'Paulo Coelho',
      category: 'Fiction',
      condition: BookCondition.likeNew,
      description: 'Inspiring journey of Santiago. Perfect condition, read once.',
      imageUrl: 'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&q=80&w=400',
      status: 'Available',
      isWishlisted: true,
      distance: '1.5 km away',
    ),
    Book(
      id: 'b3',
      ownerId: 'u_ali',
      ownerName: 'Ali Raza',
      ownerAvatar: 'https://i.pravatar.cc/150?img=12',
      ownerCity: 'Rawalpindi',
      ownerRating: 4.8,
      ownerSwaps: 15,
      title: 'Clean Code',
      author: 'Robert C. Martin',
      category: 'Programming',
      condition: BookCondition.good,
      description: 'Handbook of Agile Software Craftsmanship. Essential for software developers.',
      imageUrl: 'https://images.unsplash.com/photo-1532012197267-da84d127e765?auto=format&fit=crop&q=80&w=400',
      status: 'Available',
      isWishlisted: false,
      distance: '3.2 km away',
    ),
    Book(
      id: 'b4',
      ownerId: 'u_hassan',
      ownerName: 'Hassan',
      ownerAvatar: 'https://i.pravatar.cc/150?img=13',
      ownerCity: 'Islamabad',
      ownerRating: 4.6,
      ownerSwaps: 6,
      title: 'Thinking, Fast and Slow',
      author: 'Daniel Kahneman',
      category: 'Self Help',
      condition: BookCondition.good,
      description: 'Explores the two systems that drive the way we think and make choices.',
      imageUrl: 'https://images.unsplash.com/photo-1589829085413-56de8ae18c73?auto=format&fit=crop&q=80&w=400',
      status: 'Available',
      isWishlisted: false,
      distance: '4.0 km away',
    ),
    Book(
      id: 'b5',
      ownerId: 'u_xyz', // User's own book
      ownerName: 'XYZ',
      ownerAvatar: 'https://i.pravatar.cc/300?img=11',
      ownerCity: 'Islamabad',
      ownerRating: 4.8,
      ownerSwaps: 25,
      title: 'Dune',
      author: 'Frank Herbert',
      category: 'Science Fiction',
      condition: BookCondition.likeNew,
      description: 'Epic science fiction masterpiece set on the desert planet Arrakis.',
      imageUrl: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&q=80&w=400',
      status: 'Available',
      isWishlisted: true,
      distance: '0 km away',
    ),
    Book(
      id: 'b6',
      ownerId: 'u_usman',
      ownerName: 'Usman Tariq',
      ownerAvatar: 'https://i.pravatar.cc/150?img=14',
      ownerCity: 'Islamabad',
      ownerRating: 4.5,
      ownerSwaps: 4,
      title: 'Invincible',
      author: 'Robert Kirkman',
      category: 'Fiction',
      condition: BookCondition.likeNew,
      description: 'Great superhero graphic novel series.',
      imageUrl: 'https://images.unsplash.com/photo-1607604276583-eef5d076aa5f?auto=format&fit=crop&q=80&w=400',
      status: 'Available',
      isWishlisted: false,
      distance: '2.8 km away',
    ),
    Book(
      id: 'b7',
      ownerId: 'u_xyz', // User's own book
      ownerName: 'XYZ',
      ownerAvatar: 'https://i.pravatar.cc/300?img=11',
      ownerCity: 'Islamabad',
      ownerRating: 4.8,
      ownerSwaps: 25,
      title: 'Deep Work',
      author: 'Cal Newport',
      category: 'Self Help',
      condition: BookCondition.good,
      description: 'Rules for focused success in a distracted world.',
      imageUrl: 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?auto=format&fit=crop&q=80&w=400',
      status: 'Available',
      isWishlisted: true,
      distance: '0 km away',
    ),
    Book(
      id: 'b8',
      ownerId: 'u_zainab',
      ownerName: 'Zainab Ahmed',
      ownerAvatar: 'https://i.pravatar.cc/150?img=20',
      ownerCity: 'Islamabad',
      ownerRating: 4.9,
      ownerSwaps: 18,
      title: 'The Psychology of Money',
      author: 'Morgan Housel',
      category: 'Self Help',
      condition: BookCondition.likeNew,
      description: 'Timeless lessons on wealth, greed, and happiness.',
      imageUrl: 'https://images.unsplash.com/photo-1553729459-efe14ef6055d?auto=format&fit=crop&q=80&w=400',
      status: 'Available',
      isWishlisted: true,
      distance: '1.2 km away',
    ),
    Book(
      id: 'b9',
      ownerId: 'u_bilal',
      ownerName: 'Bilal Chaudhry',
      ownerAvatar: 'https://i.pravatar.cc/150?img=33',
      ownerCity: 'Islamabad',
      ownerRating: 4.7,
      ownerSwaps: 9,
      title: '1984',
      author: 'George Orwell',
      category: 'Fiction',
      condition: BookCondition.good,
      description: 'Classic dystopian social science fiction novel.',
      imageUrl: 'https://images.unsplash.com/photo-1541963463532-d68292c34b19?auto=format&fit=crop&q=80&w=400',
      status: 'Available',
      isWishlisted: true,
      distance: '3.5 km away',
    ),
  ];

  String get selectedCategory => _selectedCategory;
  String get selectedCondition => _selectedCondition;
  String get searchQuery => _searchQuery;

  List<Book> get allBooks => _books;

  List<Book> get filteredBooks {
    return _books.where((book) {
      final matchesCategory = _selectedCategory == 'All' || book.category == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty ||
          book.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          book.author.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          book.category.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCondition = _selectedCondition == 'All' ||
          book.condition.displayName == _selectedCondition;
      return matchesCategory && matchesSearch && matchesCondition;
    }).toList();
  }

  List<Book> get recommendedBooks {
    return _books.where((b) => b.ownerId != 'u_xyz').take(4).toList();
  }

  List<Book> get nearbyBooks {
    return _books.where((b) => b.ownerId != 'u_xyz').skip(1).toList();
  }

  List<Book> get myBooks {
    return _books.where((b) => b.ownerId == 'u_xyz').toList();
  }

  List<Book> get myAvailableBooks {
    return _books.where((b) => b.ownerId == 'u_xyz' && b.status == 'Available').toList();
  }

  List<Book> get wishlistBooks {
    return _books.where((b) => b.isWishlisted).toList();
  }

  Book? getBookById(String id) {
    try {
      return _books.firstWhere((b) => b.id == id);
    } catch (_) {
      return null;
    }
  }

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setCondition(String condition) {
    _selectedCondition = condition;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void toggleWishlist(String bookId) {
    final index = _books.indexWhere((b) => b.id == bookId);
    if (index != -1) {
      _books[index] = _books[index].copyWith(
        isWishlisted: !_books[index].isWishlisted,
      );
      notifyListeners();
    }
  }

  void addBook(Book newBook) {
    _books.insert(0, newBook);
    notifyListeners();
  }

  void updateBookStatus(String bookId, String newStatus) {
    final index = _books.indexWhere((b) => b.id == bookId);
    if (index != -1) {
      _books[index] = _books[index].copyWith(status: newStatus);
      notifyListeners();
    }
  }
}
