import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_broad_deal_list_event.dart';
part 'banana_broad_deal_list_state.dart';

class BananaBroadDealListBloc extends Bloc<BananaBroadDealListEvent, BananaBroadDealListState> {
  BananaBroadDealListBloc() : super(const BananaBroadDealListState()) {
    on<InitDealList>();
    on<ReloadDealList>();
    on<FetchDealList>();
  }
}
