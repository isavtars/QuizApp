import 'package:flutter/material.dart';

import 'screen/quize_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quize app",
      home: QuizeApp(),
    );
  }
}
