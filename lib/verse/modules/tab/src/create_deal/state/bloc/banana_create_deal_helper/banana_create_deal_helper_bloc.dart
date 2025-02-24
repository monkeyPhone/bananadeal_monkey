import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_create_deal_helper_event.dart';
part 'banana_create_deal_helper_state.dart';

class BananaCreateDealHelperBloc extends Bloc<BananaCreateDealHelperEvent, BananaCreateDealHelperState> {
  BananaCreateDealHelperBloc() : super(const BananaCreateDealHelperState()) {

  }

}
