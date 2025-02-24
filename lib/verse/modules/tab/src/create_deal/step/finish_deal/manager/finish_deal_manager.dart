import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishDealManager {
  const FinishDealManager();

  void closePage(BuildContext context){
    context.read<VerseConfig>().route.closePage(context);
    context.read<CreateDealManager>().createCallback();
  }

}