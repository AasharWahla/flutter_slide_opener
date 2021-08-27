import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wave_static/painters.dart';

class OpenScreen extends StatefulWidget {
  const OpenScreen({Key? key}) : super(key: key);

  @override
  _OpenScreenState createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> with TickerProviderStateMixin {
  late Ticker _ticker;
  int pixelCount = 0;
  double textOpacity = 0;
  @override
  void initState() {
    super.initState();
    _ticker = this.createTicker((elapsed) {
      setState(() {
        pixelCount += 2;
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    super.dispose();
    _ticker.stop();
    _ticker.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    if (pixelCount > height * .6) {
      _ticker.stop();
      setState(() {
        textOpacity = 1;
      });
      print("Ticker Stopped.");
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: height,
              width: width,
              color: Colors.red,
              child: Center(
                child: AnimatedOpacity(
                  opacity: textOpacity,
                  duration: Duration(seconds: 2),
                  child: Text(
                    "Made by Aashar Wahla\nWithout any packages!\n🤯",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Container(
            height: height,
            width: width,
            child: CustomPaint(
              painter: TopPainter(pixelCount: pixelCount),
            ),
          ),
          Container(
            height: height,
            width: width,
            child: CustomPaint(
              painter: BottomPainter(pixelCount: pixelCount),
            ),
          ),
        ],
      ),
    );
  }
}
