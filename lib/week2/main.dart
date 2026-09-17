import 'models2.dart';
import 'catalogue.dart';

void main() {
  final library = Library();
  library.open();

  print('=== 1. КІТАПХАНАНЫ АШУ ===');
  print('Ашылған уақыты: ${library.openedAt}');

  // Raw JSON арқылы кітаптар құру
  final rawJson1 = {
    'title': 'Абай жолы',
    'year': 1942,
    'pages': 600,
    'author': {'name': 'Мұхтар Әуезов', 'country': 'Қазақстан'},
    'genre': 'theory',
    'description': 'Эпопея'
  };

  final rawJson2 = {
    'title': 'Clean Code',
    'year': 2012,
    'pages': 464,
    'author': {'name': 'Robert Martin', 'country': 'USA'},
    'genre': 'craft',
  };

  // Толық емес JSON (Book.fromJson арқылы аман өтеді)
  final rawJson3 = {
    'title': 'Белгісіз код',
  };

  final book1 = Book.fromJson(rawJson1);
  final book2 = Book.fromJson(rawJson2);
  final book3 = Book.fromJson(rawJson3); // pages = 0 болады

  final magazine = Magazine(title: 'Tech Magazine', year: 2024, issue: 5);
  final ghost = Ghost(title: 'Ghost Book', year: 1995);

  library.add(book1);
  library.add(book2);
  library.add(book3);
  
  library.add(magazine);
  library.add(ghost);

  print('\n=== 2. КАТАЛОГ СҰРАНЫСТАРЫ (EXTENSIONS) ===');
  print('Барлық тақырыптар: ${library.allTitles}');
  print('2010 жылдан кейінгі кітаптар: ${library.booksAfter2010.map((b) => b.title)}');
  print('Орташа бет саны: ${library.averagePageCount.toStringAsFixed(1)}');
  print('Авторлар бойынша кітап саны: ${library.bookCountByAuthor}');
  print('Авторлардың елі: ${library.countryOf("Clean Code")}');

  print('\n=== 3. CATALOGUE DISPLAY (LITERAL) ===');
  for (final line in library.catalogueDisplay) {
    print(line);
  }

  print('\n=== 4. BORROWABLE MIXIN ТЕКСЕРУ ===');
  print(book1.borrowLabel());

  print('\n=== 5. REPORT (CACHED) ===');
  print(library.report());
}