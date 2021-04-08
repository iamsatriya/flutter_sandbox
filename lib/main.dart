import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImplicitAnimation(),
            TweenAnimation(),
          ],
        ),
      ),
    );
  }
}

class ImplicitAnimation extends StatefulWidget {
  @override
  _ImplicitAnimationState createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  bool _isBig = false;
  double _size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
            color: Colors.blue,
            height: _size,
            width: _size,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _size = _isBig ? 200 : 100;
                _isBig = !_isBig;
              });
            },
            child: Text('Animate'),
          )
        ],
      ),
    );
  }
}

class TweenAnimation extends StatefulWidget {
  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  double _size = 100.0;
  Tween _animationTween = Tween<double>(begin: 0, end: pi * 2);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: _animationTween,
        duration: Duration(seconds: 3),
        builder: (context, double value, child) {
          return Transform.rotate(
            angle: value,
            child: Container(
              color: Colors.blue,
              height: _size,
              width: _size,
            ),
          );
        },
      ),
    );
  }
}
