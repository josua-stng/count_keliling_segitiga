import 'package:flutter/material.dart';
import 'package:flutter_application/text_keliling.dart/keliling.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Hitung Keliling Segitiga Sama Sisi'),
    );
  }
}


