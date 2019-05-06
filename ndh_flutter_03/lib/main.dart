import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class RamdomEnglishWords extends StatefulWidget {
  @override
  _RamdomEnglishWordsState createState() => _RamdomEnglishWordsState();
}

class _RamdomEnglishWordsState extends State<RamdomEnglishWords> {
  final _words = <WordPair>[];
  final _checkWords = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of English words"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list, color: Colors.white),
            onPressed: _pushToSaveWordsScreen,
          )
        ],
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        if (index >= _words.length) {
          _words.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_words[index], index);
      }),
    );
  }

  _pushToSaveWordsScreen() {
    final pageRoute = new MaterialPageRoute(builder: (context) {
      final listTitels = _checkWords.map((wordPair) {
        return ListTile(
          title: Text(
            wordPair.asUpperCase,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        );
      });
      return Scaffold(
        appBar: AppBar(
          title: Text("Checked Word"),
        ),
        body: ListView(
          children: listTitels.toList(),
        ),
      );
    });
    Navigator.of(context).push(pageRoute);
  }

  Widget _buildRow(WordPair wordPair, int index) {
    final color = index % 2 == 0 ? Colors.red : Colors.blue;
    final isChecked = _checkWords.contains(wordPair);
    return ListTile(
      leading: Icon(
        isChecked ? Icons.check_box : Icons.check_box_outline_blank,
        color: color,
      ),
      title: Text(
        wordPair.asUpperCase,
        style: TextStyle(fontSize: 18.0, color: color),
      ),
      onTap: () {
        setState(() {
          if (isChecked) {
            _checkWords.remove(wordPair);
          } else {
            _checkWords.add(wordPair);
          }
        });
      },
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "NDH - video 03-04-05",
      home: RamdomEnglishWords(),
    );
  }
}
