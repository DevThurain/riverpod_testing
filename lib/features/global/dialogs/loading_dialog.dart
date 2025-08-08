import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
          width: 80,
          height: 80,
          padding: EdgeInsets.all(14),
          child: LoadingAnimationWidget.hexagonDots(color: Colors.deepPurple, size: 40),
        ),
      ),
    );
  }
}
