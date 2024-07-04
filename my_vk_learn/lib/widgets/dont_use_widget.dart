import 'dart:math';

import 'package:flutter/material.dart';

class DontUseWidget extends StatefulWidget {
  @override
  State<DontUseWidget> createState() => _DontUseWidgetState();
}

class _DontUseWidgetState extends State<DontUseWidget> {

  late double percents = 0.66;
  late double textPercents = percents * 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: Center(
        child: Container(
          color: Colors.white,
          height: 100,
          width: 100,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomPaint(
                painter: DrawingPainter(),
              ),
              Center(
                  child: Text(
                    textPercents.toInt().toString(),
                style: TextStyle(fontSize: 16, color: Colors.black),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {

  final dontUseWidget = _DontUseWidgetState();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 3
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    canvas.drawArc(
        Offset.zero & size, -pi / 2, pi * 2 * dontUseWidget.percents, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
