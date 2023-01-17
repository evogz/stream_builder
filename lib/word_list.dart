import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class WordList extends StatefulWidget {
  const WordList({Key? key}) : super(key: key);

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  List<WordPair> words = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Word List"),
      ),
      body: StreamBuilder<List>(
        stream: getWordList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Waiting...");
          } else {
            if (snapshot.hasData) {
              return Center(
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 8, left: 8),
                    itemCount: words.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const Icon(Icons.star_border_outlined),
                            const SizedBox(width: 10),
                            Text(
                              words[index].toString(),
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    }),
              );
            } else {
              return Text(snapshot.error.toString());
            }
          }
        },
      ),
    );
  }

  Stream<List<WordPair>> getWordList() async* {
    for (int i = 0; i < 5; i++) {
      words.addAll(generateWordPairs().take(2));
      await Future<void>.delayed(const Duration(seconds: 1));
      yield words;
    }
  }
}
