import 'package:flutter/material.dart';
import '../../../../../../../../../../../models/deal/model_detail_data.dart';
import 'detail_explain_area.dart';
import 'detail_spec_area.dart';



class DetailBodyMainArea extends StatelessWidget {
  final bool currentPage;
  final PhoneSpecDetail phoneSpecDetail;
  final String mk;
  final String design;
  final String special;
  final String camera;
  const DetailBodyMainArea({
    required this.currentPage,
    required this.phoneSpecDetail,
    required this.mk,
    required this.design,
    required this.special,
    required this.camera,
    super.key});

  @override
  Widget build(BuildContext context) {
    return !currentPage
        ? DetailSpecArea(phoneSpecDetail: phoneSpecDetail, mk: mk,)
        : DetailExplainArea(design: design, special: special, camera: camera,);
  }
}
