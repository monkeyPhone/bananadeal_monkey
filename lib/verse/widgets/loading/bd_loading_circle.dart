import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';

class BdLoadingCircle extends StatelessWidget {
  const BdLoadingCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Container(
          color: Colors.white60,
          child: const Center(
            child: CircularProgressIndicator(
              color: yellow,
            ),
          ),
        )
    );
  }
}
