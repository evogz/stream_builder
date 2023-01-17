import 'package:flutter/material.dart';
import 'package:stream_builder/word_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Word List',
      debugShowCheckedModeBanner: false,
      home: WordList(),
    );
  }
}
