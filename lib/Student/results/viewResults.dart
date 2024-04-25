import 'package:flutter/material.dart';
import 'package:flutter_project/Student/results/resultModel.dart';
import 'package:flutter_project/Student/results/resultProvider.dart';
import 'package:provider/provider.dart';

class StudentResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Container(
        width: double.infinity, // Full width
        padding: EdgeInsets.all(15.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Consumer<GradeProvider>(
            builder: (context, gradeProvider, child) {
              List<Grade> allGrades = gradeProvider.grades; // Get all grades from provider

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: MediaQuery.of(context).size.width, // Set container width to screen width
                  child: DataTable(
                    dataRowHeight: 80.0,
                    headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blue), // Header row color
                    headingTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    columns: [
                      DataColumn(
                        label: Text('Subject', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
                      ),
                      DataColumn(
                        label: Text('Grade', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
                      ),
                      DataColumn(
                        label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0)),
                      ),
                    ],
                    rows: allGrades.map((grade) {
                      Color statusColor = grade.status == 'val' ? Colors.green : Colors.red;

                      return DataRow(
                        cells: [
                          DataCell(Text(
                            grade.subject,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          DataCell(Text(
                            grade.grade.toString(),
                            style: TextStyle(fontSize: 17.0),
                          )),
                          DataCell(
                            Text(
                              grade.status.toUpperCase(),
                              style: TextStyle(fontSize: 17.0, color: statusColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
