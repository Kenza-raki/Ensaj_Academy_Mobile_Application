import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'package:flutter_project/Student/courses/courseModel.dart';
import 'package:flutter_project/Student/courses/courseProvider.dart';
import 'package:provider/provider.dart';

class StudentCoursesPage extends StatefulWidget {
  @override
  _StudentCoursesPageState createState() => _StudentCoursesPageState();
}

class _StudentCoursesPageState extends State<StudentCoursesPage> {
  TextEditingController _searchController = TextEditingController();
  String _selectedCategory = ''; // Track selected category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {}); // Trigger rebuild to reflect search results
              },
              decoration: InputDecoration(
                hintText: 'Search courses...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {}); // Trigger rebuild to show all courses again
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<CourseProvider>(
              builder: (context, courseProvider, child) {
                String keyword = _searchController.text.trim().toLowerCase();
                List<Course> filteredCourses = keyword.isEmpty
                    ? courseProvider.courses // Show all courses if search query is empty
                    : courseProvider.filterCourses(keyword);

                // Apply category filter if a category is selected
                if (_selectedCategory.isNotEmpty) {
                  filteredCourses = courseProvider.filterCoursesByCategory(_selectedCategory);
                }

                return ListView.builder(
  itemCount: filteredCourses.length,
  itemBuilder: (context, index) {
    Course course = filteredCourses[index];

    return GestureDetector(
      onTap: () {
        if (course.url != null) {
          _launchURL(course.url!); // Launch URL if it's not null
        } else {
          // Handle null URL case (optional)
          print('Course URL is null');
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                course.imageUrl ?? 'assets/images/5.jpg',
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Instructor: ${course.instructor}',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    course.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  },
);

              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Courses by Categories',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCategoryItem('Math', Icons.calculate),
                    _buildCategoryItem('Science', Icons.science),
                    _buildCategoryItem('Art', Icons.palette),
                    // Add more category items as needed
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String categoryName, IconData iconData) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = categoryName; // Update selected category
        });
      },
      child: Column(
        children: [
          Container(
            width: 80.0,
            height: 85.0,
            decoration: BoxDecoration(
              color: _selectedCategory == categoryName ? Colors.blue.withOpacity(0.5) : Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Center(
              child: Icon(
                iconData,
                size: 55.0,
                color: _selectedCategory == categoryName ? Colors.white : Colors.blue,
              ),
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            categoryName,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: _selectedCategory == categoryName ? Colors.blue : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
