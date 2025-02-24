import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NaverMapPositionedIconView extends StatelessWidget {
  const NaverMapPositionedIconView({super.key});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Positioned(
        child: Center(
          child: Stack(
            children: [
              Container(
                color: Colors.transparent,
                width: size.width01,
                height: size.sizedBox114,
              ),
              Positioned(
                  top: 0,
                  child: Stack(
                    children: [
                      Container(
                        width: size.width01,
                        height: size.sizedBox57,
                        decoration: const BoxDecoration(
                            color: Colors.transparent
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                              width: size.width01,
                              height: size.width0065,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: CustomPaint(painter: _MapDrawTriangle(),)
                          ))
                    ],
                  )),
              Positioned(
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: size.width0017),
                    width: size.width01,
                    height: size.width01,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.sizedBox134),
                        color: yellow
                    ),
                    child: Image.asset(iconBananaBrown, fit: BoxFit.fitWidth,),
                  )),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: size.width01,
                    height: size.sizedBox57,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ))
            ],
          ),
        )
    );
  }
}


class _MapDrawTriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    double triangleWidth = size.width/1.015 ; // 원래 너비의 반만큼으로 설정

    path.moveTo(size.width / 2 - triangleWidth / 2, 0); // 꼭대기 점
    path.lineTo(size.width / 2 + triangleWidth / 2, 0); // 꼭대기 점에서 오른쪽으로 너비 만큼 이동
    path.lineTo(size.width / 2 , size.height); // 왼쪽 아래 점
    path.close();


    // path.lineTo((size.width) / 2, size.height);
    // path.lineTo(size.width / 2, 0);
    // path.moveTo(size.width, 0);
    // path.lineTo(size.width / 2, size.height);
    // path.lineTo(size.width / 2, 0);
    // path.close();
    canvas.drawPath(path, Paint()
      ..color = yellow);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}