import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class NestedListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: NestedList(),
    );
  }
}

class NestedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested List'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: _buildVerticalItem,
      ),
    );
  }

  Widget _buildVerticalItem(BuildContext context, int verticalIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: SizedBox(
        height: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              WordPair.random().asPascalCase,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              WordPair.random().asPascalCase,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            _buildHorizontalItem(context, verticalIndex),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalItem(BuildContext context, int verticalIndex) {
    return SizedBox(
      height: 240,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemBuilder: (context, horizontalIndex) =>
            _buildHorizontalView(context, verticalIndex, horizontalIndex),
      ),
    );
  }

  Widget _buildHorizontalView(
      BuildContext context, int verticalIndex, int horizontalIndex) {
    final imageUrl =
        'https://source.unsplash.com/random/275x240?sig=$verticalIndex$horizontalIndex';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        child: Image.network(imageUrl),
      ),
    );
  }
}
