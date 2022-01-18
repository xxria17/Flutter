import 'package:flutter/material.dart';

class CustomThemeApp extends StatelessWidget {
  const CustomThemeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appName = 'Custom Themes';
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightGreenAccent,
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind')
        )
      ),
      home: const ThemeScreen(
        title: appName
      ),
    );
  }
}

class ThemeScreen extends StatelessWidget {
  final String title;
  const ThemeScreen({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Text with a background color',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.lightBlue),
        child: FloatingActionButton(
          onPressed: () {
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
