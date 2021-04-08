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
            ExplicitAnimation(),
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

class ExplicitAnimation extends StatefulWidget {
  @override
  _ExplicitAnimationState createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _iconController;
  bool _isRotating = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _iconController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotationTransition(
            turns: _animationController,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: FlutterLogo(
                size: 100,
              ),
            ),
          ),
          IconButton(
              iconSize: 36.0,
              icon: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: _iconController,
              ),
              onPressed: (){
                if(_isRotating){
                  _animationController.stop();
                  _iconController.reverse();
                } else {
                  _animationController.repeat();
                  _iconController.forward();
                }
                _isRotating = !_isRotating;
              }),
        ],
      ),
    );
  }
}
