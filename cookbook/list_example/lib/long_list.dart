import 'package:flutter/material.dart';

class LongListApp extends StatelessWidget {
  List<String> items = List.generate(10000, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Long List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Long List'),
        ),
        body: ListView.builder(
          itemCount: items.length,
            itemBuilder: (context, index) {
          return ListTile(title: Text(items[index]));
        }),
      ),
    );
  }
}
