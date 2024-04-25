import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion de l\'emploi du temps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SchedulePage(),
    );
  }
}

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final List<List<String>> dailySchedule = [
    [' ', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi'],
    ['08h30 - 10h20', '  Systèmes Embarqués', 'Test', '', '', ''],
    ['10h30 - 12h20', '', '', '', '', ''],
    ['13h30 - 15h20', '', '', '', '', ''],
  ];

  void _handleScheduleUpdate(String newSchedule, int rowIndex, int colIndex) {
    setState(() {
      dailySchedule[rowIndex][colIndex] = newSchedule;
      _sendEmailToStudents(newSchedule);
    });
  }

  void _sendEmailToStudents(String schedule) {
    String subject = 'Changements dans l\'emploi du temps';
    String body = 'L\'emploi du temps a été mis à jour :\n\n$schedule';
    String emailUrl = 'mailto:kenza.raki14@gmail.com,samyakouame@gmail.com'
        '?subject=${Uri.encodeComponent(subject)}'
        '&body=${Uri.encodeComponent(body)}';
    launch(emailUrl);
  }

  @override
  Widget build(BuildContext context) {
    // Transposer les données pour afficher les heures comme headers de colonne
    List<List<String>> transposedSchedule = List.generate(
      dailySchedule[0].length,
      (colIndex) => List.generate(
        dailySchedule.length,
        (rowIndex) => dailySchedule[rowIndex][colIndex],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Gestion de l\'emploi du temps'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          
          dataRowHeight: 90, // Adjust the height of the rows
          columnSpacing: 8, // Adjust the spacing between columns
          columns: List.generate(
            transposedSchedule[0].length,
            (index) {
              // Créer un widget DataColumn personnalisé avec un espace à droite
              return DataColumn(
                label: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    transposedSchedule[0][index],
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
          rows: List.generate(
            transposedSchedule.length - 1, // Exclure la première ligne (jours)
            (rowIndex) => DataRow(
              cells: List.generate(
                transposedSchedule[rowIndex + 1].length,
                (colIndex) {
                  return DataCell(
                    GestureDetector(
                      onTap: () {
                        _showScheduleEditDialog(
                          context,
                          transposedSchedule[rowIndex + 1][colIndex],
                          rowIndex + 1,
                          colIndex,
                        );
                      },
                      child: Text(transposedSchedule[rowIndex + 1][colIndex]),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showScheduleEditDialog(
    BuildContext context,
    String currentSchedule,
    int rowIndex,
    int colIndex,
  ) async {
    TextEditingController _scheduleController =
        TextEditingController(text: currentSchedule);

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Modifier l\'emploi du temps'),
          content: TextField(
            controller: _scheduleController,
            decoration: InputDecoration(
              hintText: 'Entrez le nouvel emploi du temps',
            ),
            minLines: 3,
            maxLines: null,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                String newSchedule = _scheduleController.text;
                _handleScheduleUpdate(newSchedule, rowIndex, colIndex);
                Navigator.pop(context);
              },
              child: Text('Enregistrer'),
            ),
          ],
        );
      },
    );
  }
}
