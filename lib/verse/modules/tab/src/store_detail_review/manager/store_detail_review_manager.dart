import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/flutter_neumorphic.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail_review/state/bloc/banana_store_detail_review/banana_store_detail_review_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailReviewManager {
  final int mIdx;
  final String storeName;
  final String smId;
  final String point;
  final int cnt;
  const StoreDetailReviewManager({
    required this.mIdx,
    required this.storeName,
    required this.smId,
    required this.point,
    required this.cnt
  });

  void clickMoreVert(){}


  void refreshButton(BuildContext context) => context.read<BananaStoreDetailReviewBloc>().add(FirstData(smId: smId, mIdx: mIdx, page: 0, length: 10));


}