import 'package:flutter/material.dart';
import 'package:flutter_project/Student/results/resultModel.dart';
import 'package:flutter_project/Student/results/resultProvider.dart';
import 'package:provider/provider.dart';

class TeacherAddGradePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController subjectController = TextEditingController();
    TextEditingController studentNameController = TextEditingController();
    TextEditingController gradeController = TextEditingController();
    TextEditingController statusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Grade'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              // Clear all grades
              Provider.of<GradeProvider>(context, listen: false).clearGrades();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: subjectController,
              decoration: InputDecoration(labelText: 'Subject'),
            ),
            TextField(
              controller: studentNameController,
              decoration: InputDecoration(labelText: 'Student Name'),
            ),
            TextField(
              controller: gradeController,
              decoration: InputDecoration(labelText: 'Grade'),
            ),
            TextField(
              controller: statusController,
              decoration: InputDecoration(labelText: 'Status (val or ratt)'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Grade newGrade = Grade(
                  subject: subjectController.text,
                  studentName: studentNameController.text,
                  grade: double.tryParse(gradeController.text) ?? 0.0,
                  status: statusController.text,
                );

                Provider.of<GradeProvider>(context, listen: false).addGrade(newGrade);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Grade added successfully!'),
                  ),
                );
              },
              child: Text('Add Grade'),
            ),
          ],
        ),
      ),
    );
  }
}
