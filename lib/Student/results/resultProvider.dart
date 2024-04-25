import 'package:flutter/foundation.dart';
import 'package:flutter_project/Student/results/resultModel.dart';

class GradeProvider extends ChangeNotifier {
  List<Grade> _grades = [];

  List<Grade> get grades => _grades;

  void addGrade(Grade grade) {
    _grades.add(grade);
    notifyListeners(); // Notify listeners to rebuild dependent widgets
    printGrades(); // Print grades for debugging
  }
    void clearGrades() {
    _grades.clear();
    notifyListeners();
  }

  void printGrades() {
    for (Grade grade in _grades) {
      print('${grade.subject} - ${grade.studentName} - ${grade.grade} - ${grade.status}');
    }
  }

  // Other methods...
}

