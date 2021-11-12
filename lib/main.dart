import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HaiQ',
      theme: ThemeData(),
      home: const AnimatedGradient(title: "HaiQ"),
    );
  }
}

class AnimatedGradient extends StatefulWidget {
  const AnimatedGradient({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _AnimatedGradientState createState() => _AnimatedGradientState();
}
class _AnimatedGradientState extends State<AnimatedGradient> {
  List<Color> colorList = [
    Colors.amber,
    Colors.cyanAccent,
    Colors.lightGreen,
    Colors.red
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.pinkAccent;
  Color topColor = Colors.orange;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 2),
              onEnd: () {
                setState(() {
                  index = index + 1;
                  // animate the color
                  bottomColor = colorList[index % colorList.length];
                  topColor = colorList[(index + 1) % colorList.length];

                  //// animate the alignment
                  // begin = alignmentList[index % alignmentList.length];
                  // end = alignmentList[(index + 2) % alignmentList.length];
                });
              },
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: begin, end: end, colors: [bottomColor, topColor])),
            ),
            Positioned.fill(
              child: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    bottomColor = Colors.red;
                  });
                },
              ),
            )
          ],
        ));
  }
}
