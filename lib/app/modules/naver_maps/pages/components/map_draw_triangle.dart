import 'package:flutter/material.dart';

import '../../../../css/style.dart';

class MapDrawTriangle extends CustomPainter {
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
      ..color = Style.yellow);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}
