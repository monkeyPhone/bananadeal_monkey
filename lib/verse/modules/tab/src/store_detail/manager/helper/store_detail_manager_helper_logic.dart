import 'dart:convert';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/widget/bottom_sheet_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail/banana_store_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreDetailManagerHelperLogic {
  final bool isStore;
  final String smId;
  final int mIdx;


  const StoreDetailManagerHelperLogic({
    required this.isStore,
    required this.smId,
    required this.mIdx,

  });

  void makePhoneCall({
    required BuildContext context,
  }){
    try{
      _makePhoneCall(
          context.read<BananaStoreDetailBloc>().state.detailVO.smTel
      ).then((value){});
    } catch(_){
      context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '연결에 실패했습니다.');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }


  void shareStore(BuildContext context){
    try{
      _shareStore(context).then((value){});
    }catch(_){
      context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '공유하기 실패했습니다.');
    }
  }


  Future<void> _shareStore(BuildContext context) async{
    String message = "STORE/${context.read<BananaStoreDetailBloc>().state.detailVO.smIdx}";
    String encode = base64.encode(utf8.encode(message));
    String url = '${context.read<VerseConfig>().url.shareMode}/$encode';
    await Share.share("'${context.read<BananaStoreDetailBloc>().state.detailVO.smStoreName}' 추천합니다. 바나나딜 앱에서 확인해보세요.\n$url");
  }


  void inquiryStore({
    required BuildContext context,
  }){
    context.read<VerseConfig>().browser.sheet.showSheet(
        routerContext: context,
        sheetList: [
          isStore
              ?
          BottomSheetVO(
              buttonName: '채팅 문의하기',
              onTap: _chatButton(context)
          )
              :
          BottomSheetVO(
              buttonName: '채팅에서 켰음',
              onTap: (){}
          )
        ]
    );
  }



  GestureTapCallback _chatButton(BuildContext context)
    => (){
      _gotoChatLog(context);
    };

  void _gotoChatLog(BuildContext context) {
    context.read<VerseConfig>().route.closeDialog(context);
    context.read<VerseConfig>().tab.gotoChatLogView(
        isIntro: true,
        context: context,
        prefs: context.read<VerseConfig>().cache.mainCache.prefs,
        isChat: false, mIdx: mIdx, smId: smId
    );
  }



}