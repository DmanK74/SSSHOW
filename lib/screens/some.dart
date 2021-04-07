import 'package:flutter/material.dart';
import 'dart:html' as html;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Button(),
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AnimatedButton(
            height: 40,
            width: 120,
            text: 'Emerald',
            animationColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final double height;
  final double width;
  final String text;
  final Color animationColor;

  AnimatedButton({this.height, this.width, this.text, this.animationColor});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  Color textColor;
  Color borderColor;
  AnimationController _controller;
  Animation _animation;
  Animation _borderAnimation;

  @override
  void initState() {
    super.initState();
    textColor = Colors.white;
    borderColor = Colors.white;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _animation = Tween(begin: 0.0, end: 500.0)
        .animate(CurvedAnimation(curve: Curves.easeIn, parent: _controller))
          ..addListener(() {
            setState(() {});
          });
    _borderAnimation =
        ColorTween(begin: Colors.white, end: widget.animationColor).animate(
      CurvedAnimation(curve: Curves.easeInOut, parent: _controller),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: widget.height,
        width: widget.width,
        child: Material(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(
                color: _borderAnimation.value,
                width: 2,
              )),
          child: InkWell(
            onTap: () {},
            onHover: (value) {
              if (value) {
                _controller.forward();
                setState(() {
                  textColor = Colors.red;
                });
              } else {
                _controller.reverse();
                setState(() {
                  textColor = Colors.white;
                });
              }
            },
            child: Container(
              color: Colors.grey,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.animationColor,
                      ),
                      width: _animation.value,
                    ),
                  ),
                  Center(
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 300),
                      style: TextStyle(color: textColor),
                      child: Text(widget.text),
                      curve: Curves.easeIn,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
