import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RedPositive Contact Us',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Gilroy',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String name;
  late String emailId;
  late String phone;
  bool _loader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        backgroundColor: Colors.grey[50],
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 10, spreadRadius: 2, color: Colors.black12)],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  onChanged: (val) => name = val,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
                TextField(
                  onChanged: (val) => emailId = val,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Your Email',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
                TextField(
                  onChanged: (val) => phone = val,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Your Phone Number',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
                _loader
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          
                        ),
                        child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 20)),
                        onPressed: () async {
                          if (name == null || emailId == null || phone == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Fill The Data')));
                          } else {
                            setState(() => _loader = true);
                            Email email = Email(
                              body: 'Name: $name\nEmail: $emailId\nPhone: $phone\n',
                              subject: 'Contacted from $name',
                              recipients: ['kenza.raki14@gmail.com'],
                              isHTML: false,
                            );

                            try {
                              await FirebaseFirestore.instance.collection('contacted').add({
                                'name': name,
                                'emailId': emailId,
                                'phone': phone,
                
                              });

                              await FlutterEmailSender.send(email);

                              setState(() => _loader = false);

                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Thank you for contacting us'),
                              ));
                            } catch (e) {
                              setState(() => _loader = false);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                            }
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
