import 'package:banana_deal_by_monkeycompany/app/app_outs/widgets/neumorphic/flutter_neumorphic.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/state/bloc/banana_broad_deal/banana_broad_deal_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/state/bloc/banana_home_banner/banana_home_banner_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/home/state/bloc/banana_home_rank/banana_home_rank_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeManager {
  const HomeManager();


  void clickIndicator(BuildContext context){
    context.read<BananaHomeBannerBloc>().add(const HomeBannerListFetch(isLoading: false));
    context.read<BananaHomeRankBloc>().add(const GetHomeRank(isLoading: false));
    context.read<BananaBroadDealBloc>().add(const InitDealData());
  }

  void homeBannerRefresh(BuildContext context){
    context.read<BananaHomeBannerBloc>().add(const HomeBannerListFetch(isLoading: true));
  }

  void homeRankRefresh(BuildContext context){
    context.read<BananaHomeRankBloc>().add(const GetHomeRank(isLoading: true));
  }

}