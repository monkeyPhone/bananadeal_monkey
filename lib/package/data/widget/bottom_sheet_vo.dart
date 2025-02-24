import 'package:flutter/material.dart';

class BottomSheetVO {
  final String buttonName;
  final GestureTapCallback onTap;
  const BottomSheetVO({
    required this.buttonName,
    required this.onTap,
  });
}