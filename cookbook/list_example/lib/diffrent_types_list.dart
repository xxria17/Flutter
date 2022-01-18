import 'package:flutter/material.dart';

class ListApp extends StatelessWidget {

  List<ListItem> items = List.generate(1000, (i) => i % 6 == 0
  ? HeadingItem('Heading $i')
  : MessageItem('Sender $i', 'Message body $i'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mixed List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mixed List'),
        ),
        body: ListView.builder(
          itemCount: items.length,
            itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
          );
        }),
      ),
    );
  }
}


abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildSubtitle(BuildContext context);
}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}