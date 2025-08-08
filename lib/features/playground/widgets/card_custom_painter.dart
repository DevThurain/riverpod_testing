import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CardCustomPainter extends CustomPainter {
  CardCustomPainter({required this.height});

  final double height;

  @override
  void paint(Canvas canvas, Size size) {
    // Create custom path
    final path = Path();
    const cornerRadius = 20.0;
    const cutoutSize = 58.0;
    const circleRadius = 22.0;

    // Start from (0, 0)
    path.moveTo(20, 0);

    // Draw line until (width - cutoutSize, 0)
    path.lineTo(size.width - cutoutSize - cornerRadius, 0);

    // Rounded corner at top-right cutout
    path.quadraticBezierTo(size.width - cutoutSize, 0, size.width - cutoutSize, cornerRadius);

    // Go down to y = cutoutSize
    path.lineTo(size.width - cutoutSize, cutoutSize - cornerRadius);

    // Rounded corner at bottom-right of cutout
    path.quadraticBezierTo(size.width - cutoutSize, cutoutSize, size.width - cutoutSize + cornerRadius, cutoutSize);

    // Go right until max width
    path.lineTo(size.width - cornerRadius, cutoutSize);

    // Rounded corner at top-right
    path.quadraticBezierTo(size.width, cutoutSize, size.width, cutoutSize + cornerRadius);

    // Go down to max height
    path.lineTo(size.width, height - cornerRadius);

    // Rounded corner at bottom-right
    path.quadraticBezierTo(size.width, height, size.width - cornerRadius, height);

    // Go back to x = 0
    path.lineTo(cornerRadius, height);

    // Rounded corner at bottom-left
    path.quadraticBezierTo(0, height, 0, height - cornerRadius);

    // Go up to top
    path.lineTo(0, cornerRadius);

    // Rounded corner at top-left - complete the path
    path.quadraticBezierTo(0, 0, cornerRadius, 0);

    // Create paint with gradient for fill
    final fillPaint = Paint()..style = PaintingStyle.fill;
    fillPaint.shader = ui.Gradient.linear(
      Offset(size.width, size.height * 0.5000000),
      Offset(size.width * -0.000001102197, size.height * 0.5000000),
      [Color(0xFF7FFFD4), Color(0xFFE8FD94)],
      [0, 0.9],
    );

    // Create paint for white border
    final borderPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.white
          ..strokeWidth = 2.0;

    // Draw the path with fill
    canvas.drawPath(path, fillPaint);

    // Draw the path with border
    canvas.drawPath(path, borderPaint);

    // Draw gradient circle in top-right cutout
    final circlePaint = Paint()..style = PaintingStyle.fill;
    circlePaint.shader = ui.Gradient.radial(
      Offset(size.width - circleRadius, circleRadius),
      circleRadius,
      [Color(0xFF7FFFD4), Color(0xFFE8FD94)],
      [0.0, 1.0],
    );

    final circleRect = Rect.fromCenter(
      center: Offset(size.width - circleRadius, circleRadius),
      width: circleRadius * 2,
      height: circleRadius * 2,
    );

    canvas.drawOval(circleRect, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
