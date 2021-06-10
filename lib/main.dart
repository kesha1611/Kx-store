import 'package:flutter/material.dart';
import 'package:kriskx_store/screens/contacts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Database',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.green,
      ),
      home: Contacts(),
    );
  }
}
