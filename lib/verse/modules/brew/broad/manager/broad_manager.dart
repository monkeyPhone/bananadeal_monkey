import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/home_banner_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/rank_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/state/cubit/banana_fcm/banana_fcm_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_deal/banana_broad_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_helper/banana_broad_helper_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_nav/banana_broad_nav_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/state/bloc/banana_home_rank/banana_home_rank_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/data/user_vo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BroadManager {
  const BroadManager();


  void backSpace(BuildContext context) => context.read<BananaBroadNavBloc>().add( BackSpace(context));

  void updateUserEvent({
    required Map<String, dynamic> dataMap,
    required BuildContext context})
  =>  context.read<BananaBroadHelperBloc>().add(
      UpdateUserEvent(
          dataMap: dataMap,
          idx: context.read<BananaRouteCubit>().state.userVO.mIdx,
          context: context)
  );


  void mapEvent({
    required BuildContext context,
    required UserVO userVO,
  }) => context.read<BananaBroadHelperBloc>().add(
      MapEvent(context: context, userVO: userVO,
        addressCallback: (AddressVO data){
          updateUserEvent(
            context: context,
              dataMap: {
                "M_add": data.address,
                "M_add_dong" : data.dong,
                "M_latitude": data.coordinate.lat,
                "M_longitude": data.coordinate.lnt
              },
          );
        },
        rangeCallback:(int range){
          updateUserEvent(
            context: context,
            dataMap: {
              "M_search_range": range,
            },
          );
        }
      )
  );


  void changePage({
    required BuildContext context,
    required NavEnum page,
  }) => context.read<BananaBroadNavBloc>().add(ChangePage(page));



  void commitAlert(BuildContext context) => context.read<BananaFcmCubit>().commitAlert();

  void refreshDealData(BuildContext context) {
    context.read<BananaBroadDealBloc>().add(const InitDealData());
  }

  void appRouting(BuildContext context) => context.read<VerseConfig>().route.appRouting(context);

  void gotoFcmView(BuildContext context) => context.read<VerseConfig>().tab.gotoFcmView(context);

  void gotoCreateDealView({
    required BuildContext context,
    bool? isIntro,
    (String psIdx, String ldcpName, String ldcpModel, String piPath)? selectModel,

  }) => context.read<VerseConfig>().tab.gotoCreateDealView(
      context: context,
      selectModel: selectModel,
      isIntro: isIntro,
      createCallback: (){
        refreshDealData(context);
      }
  );

  void gotoModelListDetailEvent({
    required BuildContext context,
    required bool? isIntro,
    required String psIdx, required String ldcpName
  }) => context.read<BananaBroadDealBloc>().add(GotoModelListDetailEvent(context: context, psIdx: psIdx, ldcpName: ldcpName, isIntro: isIntro));




  void rankTileClickEvent({
    required BuildContext context,
    required RankVO rank
  }) => context.read<BananaBroadDealBloc>().add(RankTileClickEvent(context: context, rank: rank));


  void carouselTapEvent({
    required BuildContext context,
    required HomeBannerVO? banner,
  }) => context.read<BananaBroadHelperBloc>().add(CarouselTapEvent(context: context, banner: banner));


  void gotoRankAllView(BuildContext context) => context.read<BananaHomeRankBloc>().add(GotoRankAll(
      context: context, callback: (RankVO rank){
    rankTileClickEvent(context: context, rank: rank);
  }));


}