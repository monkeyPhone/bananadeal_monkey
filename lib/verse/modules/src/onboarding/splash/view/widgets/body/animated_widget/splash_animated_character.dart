import 'dart:math';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../animated/translation_animated_widget.dart';

class SplashAnimatedCharacter extends StatelessWidget {
  const SplashAnimatedCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return TranslationAnimatedWidget(
      duration: const Duration(seconds: 2),
      values: const [
        Offset(0, 200), // disabled value value
        Offset(0, 250), //intermediate value
        Offset(0, 0) //enabled value
      ],
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(splashImageB),
                fit: BoxFit.fitWidth
            )
        ),
        width: size.sizedBox220,
        height: size.sizedBox220,
      ),
    );
  }
}



class SplashAnimatedString extends StatelessWidget {
  const SplashAnimatedString({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return  Container(
      decoration: const BoxDecoration(
          color: white,
          image: DecorationImage(
              image: AssetImage(splashImageS),
              fit: BoxFit.fill
          )
      ),
      width: size.sizedBox220,
      height: size.sizedBox80,
    );
  }
}


class SplashUiBodyAnimatedProgressbar extends StatefulWidget {
  const SplashUiBodyAnimatedProgressbar({super.key});

  @override
  State<SplashUiBodyAnimatedProgressbar> createState() => _SplashUiBodyAnimatedProgressbarState();
}

class _SplashUiBodyAnimatedProgressbarState extends State<SplashUiBodyAnimatedProgressbar> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1500),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: _GradientCircularProgressIndicator(radius: context.read<VerseConfig>().size.sizedBox40, gradientColors: const [greyF4F4F4, greyD9D9D9, ],),
    );
  }
}



class _GradientCircularProgressIndicator extends StatelessWidget {
  final double radius;
  final List<Color> gradientColors;


  const _GradientCircularProgressIndicator({
    required this.radius,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: GradientCircularProgressPainter(
        radius: radius,
        gradientColors: gradientColors,
        strokeWidth: 10.0,
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
    Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader =
        SweepGradient(colors: gradientColors, startAngle: 0.0, endAngle: 2 * pi)
            .createShader(rect);
    canvas.drawArc(rect, 0.0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

