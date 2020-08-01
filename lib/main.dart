import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to Flutter', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final suggestions = <WordPair>[];
  final biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: buildSuggestions(),
    );
  }

  Widget buildSuggestions() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd)
        return Divider(
          thickness: 1.0,
          height: 1.0,
        );

      final index = i ~/ 2;

      if (index >= suggestions.length) {
        suggestions.addAll(generateWordPairs().take(10));
      }

      return buildRow(context, suggestions[index]);
    });
  }

  Widget buildRow(BuildContext context, WordPair wordPair) {
    return InkWell(
        child: ListTile(
            title: Text(
          wordPair.asPascalCase,
          style: biggerFont,
        )),
        onTap: () {
          onClick(context, wordPair);
        });
  }

  onClick(BuildContext context, WordPair wordPair) {
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('${wordPair.asPascalCase} was clicked'),
        behavior: SnackBarBehavior.floating));
  }
}
