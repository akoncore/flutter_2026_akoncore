import 'models2.dart';

class Library {
  final List<LibraryItem> items = [];

  late final DateTime openedAt;

  String? _cachedReport;

  void add(LibraryItem item) {
    items.add(item);
  }

  Book? findByTitle(String title) {
    for (final item in items) {
      if (item is Book && item.title == title) {
        return item;
      }
    }

    return null;
  }

  String countryOf(String title) {
    final book = findByTitle(title);
    return book?.author.country ?? 'unknown';
  }

  void open() {
    openedAt = DateTime.now();
  }

  String report() {
    return _cachedReport ??= 'Library contains ${items.length} items';
  }
}


extension LibraryCollections on Library {
  List<String> get allTitles => items.map((item) => item.title).toList();

  List<Book> get booksAfter2010 =>
      items.whereType<Book>().where((book) => book.year > 2010).toList();

  double get averagePageCount {
    final books = items.whereType<Book>();
    if (books.isEmpty) return 0.0;
    return books.fold<int>(0, (sum, book) => sum + book.pages) / books.length;
  }

  Map<String, int> get bookCountByAuthor => items.whereType<Book>().fold<Map<String, int>>(
        {},
        (acc, book) => acc..[book.author.name] = (acc[book.author.name] ?? 0) + 1,
      );

  Set<String> get distinctAuthors =>
      items.whereType<Book>().map((book) => book.author.name).toSet();

  Set<Genre> get distinctGenres =>
      items.whereType<Book>().map((book) => book.genre).toSet();

  List<String> get catalogueDisplay => [
        'CATALOGUE',
        for (final book in items.whereType<Book>())
          '${book.title} (${book.year})',
        ...distinctAuthors,
        if (items.whereType<Book>().any((book) => book.pages == 0))
          '(incomplete data)',
      ];
}





