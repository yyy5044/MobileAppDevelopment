import 'package:assignment7/editpage.dart';
import 'package:assignment7/scorepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment7/scores.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Scores(),
      builder: (context, child) => MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: ScorePage(),
      ),
    );
  }
}

