class Author {
  final String name;
  String country;

  Author({
    required this.name,
    required this.country,
  });

  @override
  String toString() {
    return "Name: $name, Country: $country";
  }
}

enum Genre {
  craft,
  theory,
  unknown,
}

class Book {
  final String title;
  final int year;
  final int pages;
  final Author author;
  final Genre genre;
  final String description;

  // Негізгі конструктор
  Book({
    required this.title,
    required this.year,
    required this.pages,
    required this.author,
    required this.genre,
    required this.description,
  });

  // Named constructor
  Book.missing()
      : title = "Белгісіз",
        year = 0,
        pages = 0,
        author = Author(
          name: "Белгісіз",
          country: "Белгісіз",
        ),
        genre = Genre.unknown,
        description = "Белгісіз";

  // Factory constructor
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] as String? ?? 'Белгісіз',
      year: json['year'] is int ? json['year'] as int : 0,
      pages: json['pages'] is int ? json['pages'] as int : 0,
      author: Author(
        name: json['author']?['name'] as String? ?? 'Белгісіз',
        country: json['author']?['country'] as String? ?? 'Белгісіз',
      ),
      genre: fromString(json['genre'] as String?),
      description: json['description'] as String? ?? 'Белгісіз',
    );
  }

  // Getter
  bool get isLong => pages > 400;

  // copyWith
  Book copyWith({
    String? title,
    int? year,
    int? pages,
    Author? author,
    Genre? genre,
    String? description,
  }) {
    return Book(
      title: title ?? this.title,
      year: year ?? this.year,
      pages: pages ?? this.pages,
      author: author ?? this.author,
      genre: genre ?? this.genre,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'Title: $title, year: $year, pages: $pages, '
        'author: $author, genre: $genre, description: $description';
  }

  // static method
  static Genre fromString(String? raw) {
    if (raw == null) {
      return Genre.unknown;
    }

    return Genre.values.firstWhere(
      (g) => g.name.toLowerCase() == raw.toLowerCase(),
      orElse: () => Genre.unknown,
    );
  }
}
