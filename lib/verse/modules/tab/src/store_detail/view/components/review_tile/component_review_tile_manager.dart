import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/store_review_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/manager/store_detail_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ComponentReviewTileManager {
  final String storeName;
  final StoreReviewVO review;
  final bool? isOption;
  final GestureTapCallback onTap;

  const ComponentReviewTileManager({
    required this.storeName,
    required this.review,
    required this.isOption,
    required this.onTap,
  });


  List<String> getImageList(){
    List<String> data = [review.ruPathImg1, review.ruPathImg2, review.ruPathImg3,];
    List<String> imageList = data.where((path) => path.isNotEmpty).toList();
    return imageList;
  }

  String getTimeLine(){
    DateTime form = review.ruRegdate.toLocal();
    String allTime = DateFormat("yyyy.MM.dd").format(form);
    return allTime;
  }

  void clickMoreVert(BuildContext context) =>
      context.read<StoreDetailManager>().route.clickMoreVert(context: context, review: review);

}

