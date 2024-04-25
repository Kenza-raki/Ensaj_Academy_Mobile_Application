class Course {
  final String title;
  final String description;
  final String instructor;
  final String category;
  final String? imageUrl; // Make imageUrl nullable
  final String url; // URL associated with the course

  Course({
    required this.title,
    required this.description,
    required this.instructor,
    required this.category,
    this.imageUrl, // Make imageUrl nullable
    required this.url, // URL associated with the course
  });
}
