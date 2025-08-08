import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class BalanceContainerPainter extends CustomPainter {
  BalanceContainerPainter();

  @override
  void paint(Canvas canvas, Size size) {
    // Create custom path for upside-down house shape
    final path = Path();
    const double cornerRadius = 16;

    // Calculate dimensions
    final houseWidth = size.width; // Use full width for house body
    final houseHeight = size.height - 20; // Leave 20 pixels at bottom
    final houseLeft = 0.0; // Start from left edge

    // Create rounded rectangle for house body
    final houseRect = Rect.fromLTWH(houseLeft, 0, houseWidth, houseHeight);
    path.addRRect(RRect.fromRectAndRadius(houseRect, const Radius.circular(cornerRadius)));

    // Add triangular roof pointing downward
    final roofWidth = houseWidth - (2 * cornerRadius); // Use full width for roof
    final roofHeight = 20.0; // Height of the roof
    final roofLeft = houseLeft + cornerRadius; // Start from same left edge as house
    final roofTop = houseHeight; // Start at bottom of house body

    // Create triangular path for roof
    path.moveTo(roofLeft, roofTop);
    path.lineTo(roofLeft + roofWidth / 2, roofTop + roofHeight); // Bottom point
    path.lineTo(roofLeft + roofWidth, roofTop);
    path.close();

    // Create paint with gradient for fill
    final fillPaint = Paint()..style = PaintingStyle.fill;
    fillPaint.shader = ui.Gradient.linear(
      Offset(size.width, size.height * 0.5000000),
      Offset(size.width * -0.000001102197, size.height * 0.5000000),
      [ui.Color.fromARGB(255, 220, 220, 220), ui.Color.fromARGB(255, 180, 180, 180)],
      [0, 0.9],
    );

    // Draw the upside-down house shape with gradient fill
    canvas.drawPath(path, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
