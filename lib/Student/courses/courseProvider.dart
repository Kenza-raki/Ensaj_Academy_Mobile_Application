import 'package:flutter/material.dart';
import 'package:flutter_project/Student/courses/courseModel.dart';

class CourseProvider extends ChangeNotifier {
  List<Course> _courses = [
      Course(
      title: 'Watercolor Painting Techniques',
      description: 'Master watercolor painting methods',
      instructor: 'Artist Mia',
      category: 'Art',
      imageUrl: 'assets/images/a.jpg', // Example image asset path
       url: 'https://www.w3schools.com/python/',
    
    ),
    Course(
      title: 'Biology Fundamentals',
      description: 'Explore the basics of biology',
      instructor: 'Dr. Johnson',
      category: 'Science',
      imageUrl: 'assets/images/b.png', // Example image asset path
      url: 'https://www.w3schools.com/java/default.asp',
    ),
    Course(
      title: 'Watercolor Painting Techniques',
      description: 'Master watercolor painting methods',
      instructor: 'Artist Mia',
      category: 'Art',
      imageUrl: 'assets/images/c.png', // Example image asset path
      url: 'https://www.w3schools.com/c/index.php',
    ),
    // Add more sample courses here
  ];

  List<Course> get courses => _courses;

  List<Course> filterCourses(String keyword) {
    if (keyword.isEmpty) {
      return _courses; // Return all courses if search keyword is empty
    } else {
      // Filter courses based on the title containing the keyword
      return _courses
          .where((course) => course.title.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
  }
List<Course> filterCoursesByCategory(String category) {
  return _courses.where((course) => course.category.toLowerCase() == category.toLowerCase()).toList();
}
  void addCourse(Course course) {
    _courses.add(course);
    notifyListeners();
  }
}
