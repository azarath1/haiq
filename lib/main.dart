import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    Color.fromRGBO(163, 255, 166, 1),
    Color.fromRGBO(138, 236, 159, 1),
    Color.fromRGBO(112, 217, 151, 1),
    Color.fromRGBO(87, 198, 144, 1),
    Color.fromRGBO(61, 179, 136, 1),
    Color.fromRGBO(60, 140, 136, 1),
    Color.fromRGBO(100, 200, 150, 1),
    Color.fromRGBO(120, 255, 190, 1),
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.greenAccent;
  Color topColor = Colors.green;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;


  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        bottomColor = Colors.lightGreen;
      });
    });
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
            Center(
              child: Text('On a withered branch \nA crow has alighted\nNightfall in autumn.',
                style: GoogleFonts.pottaOne(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      letterSpacing: .5,
                      fontSize: 25
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
