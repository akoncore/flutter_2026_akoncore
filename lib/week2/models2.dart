import 'models.dart';

enum Genre {
  craft,
  theory,
  unknown,
}

abstract class LibraryItem {
  final String title;
  final int year;

  LibraryItem({
    required this.title,
    required this.year,
  });

  String describe();

  bool get isOld => year < 2000;
}


// Mixin
mixin Borrowable on LibraryItem {
  String borrowLabel() {
    return "Borrow: $title";
  }
}


// Book
class Book extends LibraryItem with Borrowable {
  final int pages;
  final Author author;
  final Genre genre;

  Book({
    required super.title,
    required super.year,
    required this.pages,
    required this.author,
    required this.genre
  });

  @override
  String describe() {
    return "Book: $title ($year), pages: $pages";
  }
}


// Magazine
class Magazine extends LibraryItem {
  final int issue;

  Magazine({
    required super.title,
    required super.year,
    required this.issue,
  });

  @override
  String describe() {
    return "Magazine: $title ($year), issue: $issue";
  }
}


// Ghost
class Ghost implements LibraryItem {
  @override
  final String title;

  @override
  final int year;

  Ghost({
    required this.title,
    required this.year,
  });

  @override
  String describe() {
    return "Ghost: $title ($year)";
  }

  @override
  bool get isOld => year < 2000;
}