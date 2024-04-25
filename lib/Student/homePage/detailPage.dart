import 'package:flutter/material.dart';
import 'sports.dart'; // Import your SportCenter class

class DetailPage extends StatelessWidget {
  final SportCenter sportCenter;

  const DetailPage({Key? key, required this.sportCenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sportCenter.centerName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              sportCenter.imageurl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              "Rating: ${sportCenter.rating}",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "Sports: ${sportCenter.sports.join(", ")}",
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
