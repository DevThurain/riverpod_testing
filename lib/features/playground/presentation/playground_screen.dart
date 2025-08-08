import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_testing/features/playground/providers/playground_notifier.dart';
import 'package:riverpod_testing/features/playground/widgets/balance_container_painter.dart';
import 'package:riverpod_testing/features/playground/widgets/card_custom_painter.dart';

class PlaygroundScreen extends HookConsumerWidget {
  const PlaygroundScreen({super.key});
  // final PlaygroundParams params;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(playgroundNotifierProvider, (prev, next) {
      debugPrint(next.toString());
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Stack(
            //     children: [
            //       CustomPaint(painter: CardCustomPainter(height: 235), child: SizedBox(width: 285, height: 235)),
            //       // SVG overlay positioned in the circle area
            //       Positioned(
            //         top: 8, // Adjust to match circle position
            //         right: 8, // Adjust to match circle position
            //         child: SvgPicture.asset(
            //           'assets/svgs/ic_card_arrow.svg',
            //           width: 24, // Adjust size as needed
            //           height: 24,
            //           colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomPaint(
                painter: BalanceContainerPainter(),
                child: SizedBox(width: double.infinity, height: 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
