import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    child: Text(
                        'Hello! this is a very very long text that might be cross the parent constraint'),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    child: Text('Goodbye!'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    color: Colors.red,
                    child: Text(
                        'Hello! this is a very very long text that might be cross the parent constraint'),
                  ),
                ),
                Flexible(
                  child: Container(
                    color: Colors.green,
                    child: Text('Goodbye!'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
