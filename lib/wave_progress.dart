import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WaveProgress extends StatefulWidget {
  final double size;
  final Color borderColor, foregroundWaveColor;
  Color? backgroundWaveColor;
  final double progress;
  final double borderSize;
  final double innerPadding;

  WaveProgress({
    this.borderSize = 10,
    required this.size,
    required this.borderColor,
    required this.foregroundWaveColor,
    this.backgroundWaveColor,
    required this.progress,
    this.innerPadding = 0,
  }) {
    if (backgroundWaveColor == null) {
      backgroundWaveColor = foregroundWaveColor.withOpacity(0.5);
    }
  }

  @override
  WaveProgressState createState() => WaveProgressState();
}

class WaveProgressState extends State<WaveProgress>
    with TickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2500),
    );

    controller?.repeat();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: ClipOval(
        child: Container(
          decoration: ShapeDecoration(
              shape: CircleBorder(
                  side: BorderSide(
                      color: widget.borderColor, width: widget.borderSize))),
          padding: EdgeInsets.all(widget.innerPadding),
          child: ClipOval(
            child: AnimatedBuilder(
              animation: controller!,
              builder: (BuildContext context, Widget? child) {
                return CustomPaint(
                  painter: WaveProgressPainter(
                    controller,
                    widget.backgroundWaveColor!,
                    widget.foregroundWaveColor,
                    widget.progress,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class WaveProgressPainter extends CustomPainter {
  Animation<double>? _animation;
  Color backgroundWaveColor, foregroundWaveColor;
  double _progress;

  WaveProgressPainter(
    this._animation,
    this.backgroundWaveColor,
    this.foregroundWaveColor,
    this._progress,
  ) : super(repaint: _animation);

  @override
  void paint(Canvas canvas, Size size) {
    // draw small wave
    Paint wave2Paint = Paint()..color = backgroundWaveColor;
    double p = _progress / 100.0;
    double n = 4.3;
    double amp = 1.0;
    double baseHeight = (1 - p) * size.height;

    Path path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(
          i,
          baseHeight +
              sin((i / size.width * 2 * pi * n) +
                      (_animation!.value * 2 * pi) +
                      pi * 1) *
                  amp);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    canvas.drawPath(path, wave2Paint);

    // draw big wave
    Paint wave1Paint = Paint()..color = foregroundWaveColor;
    n = 2.2;
    amp = 10.0 * size.height / 180;

    path = Path();
    path.moveTo(0.0, baseHeight);
    for (double i = 0.0; i < size.width; i++) {
      path.lineTo(
          i,
          baseHeight +
              sin((i / size.width * 2 * pi * n) +
                      (_animation!.value * 2 * pi)) *
                  amp);
    }

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    canvas.drawPath(path, wave1Paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
