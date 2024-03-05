import 'package:browser_details/browser_details.dart';
import 'package:browser_details/entities/browser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Browser browser = Browser.unknown;
  final _browserDetailsPlugin = BrowserDetails();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: ${browser.bundle}\n'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await _browserDetailsPlugin.getBrowser();
            setState(() {
              browser = result;
            });
          },
          tooltip: 'Get browser',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
