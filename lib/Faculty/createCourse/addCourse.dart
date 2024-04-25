import 'package:flutter/material.dart';
import 'package:flutter_project/Student/courses/courseModel.dart';
import 'package:flutter_project/Student/courses/courseProvider.dart';
import 'package:provider/provider.dart';

class TeacherAddCoursePage extends StatefulWidget {
  @override
  _TeacherAddCoursePageState createState() => _TeacherAddCoursePageState();
}

class _TeacherAddCoursePageState extends State<TeacherAddCoursePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController instructorController = TextEditingController();

  String selectedCategory = 'Technology'; // Default category

  // Map of category to default image URLs
  Map<String, String> categoryImageUrls = {
    'Technology': 'assets/images/technology.jpg',
    'Science': 'assets/images/science.jpg',
    'Art': 'assets/images/art.jpg',
    // Add more categories and their corresponding image URLs here
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: instructorController,
              decoration: InputDecoration(labelText: 'Instructor'),
            ),
            SizedBox(height: 20.0),
            DropdownButtonFormField(
              value: selectedCategory,
              onChanged: (value) {
                setState(() {
                  selectedCategory = value.toString();
                });
              },
              items: categoryImageUrls.keys.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Get the image URL for the selected category
                String imageUrl = categoryImageUrls[selectedCategory] ?? '';

                // Create new course object
                Course newCourse = Course(
                  title: titleController.text,
                  description: descriptionController.text,
                  instructor: instructorController.text,
                  category: selectedCategory,
                  imageUrl: imageUrl,
                   url: 'https://www.example.com/${titleController.text}',
                
                );

                // Access CourseProvider and add the new course
                Provider.of<CourseProvider>(context, listen: false).addCourse(newCourse);

                // Clear text fields after adding the course
                titleController.clear();
                descriptionController.clear();
                instructorController.clear();

                // Show a snackbar or navigate to a different page
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Course added successfully!'),
                  ),
                );
              },
              child: Text('Add Course'),
            ),
          ],
        ),
      ),
    );
  }
}
