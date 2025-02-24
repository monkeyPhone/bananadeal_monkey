import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/state/bloc/banana_info_user/banana_info_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoUserManager {
  const InfoUserManager();

  void listenerError({
    required BuildContext context,
    required String text,
  }) => context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: text);


  void listenerComplete(BuildContext context)
    => context.read<VerseConfig>().route.appRouting(context);

  void Function(AddressVO addressVO) callBack(BuildContext context) => (AddressVO data){
    fetchAddress(context: context, data: data);
  };

  void locationSelect({
    required BuildContext context,
    required int index,
  }) => switch(index){
    0 =>
        context.read<VerseConfig>().tab.gotoAddressView(
            context: context,
            callBack: callBack(context)
        ),
    _ =>
         context.read<VerseConfig>().tab.gotoNaverMapView(
            callback: callBack(context),
            context: context)
  };


  void backSpaceEvent(BuildContext context) {
    if(MediaQuery
        .of(context)
        .viewInsets
        .bottom > 0){
      FocusScope.of(context).unfocus();
    }
    else{
      context.read<BananaInfoUserBloc>().add(BackSpaceEvent(context));
    }

  }

  void onTapEvent(BuildContext context) {
    if(MediaQuery.of(context).viewInsets.bottom > 0){
      FocusScope.of(context).unfocus();
    }
    context.read<BananaInfoUserBloc>().add(const OnTapEvent());
  }

  void navEvent(BuildContext context) => context.read<BananaInfoUserBloc>().add(const NavEvent());

  void fetchAddress({
    required BuildContext context,
    required AddressVO data,
  }) => context.read<BananaInfoUserBloc>().add(BananaInfoUserFetchAddress(data: data));

  void fetchThumbNail({
    required BuildContext context,
    required String thumbNail,
  }) =>
      context.read<BananaInfoUserBloc>().add(BananaInfoUserFetchThumbNail(thumbNail));

  void thumbNailFetchEvent({
    required BuildContext context,
    required int index,
  }) => context.read<BananaInfoUserBloc>().add(ThumbNailFetchEvent(
      context: context, index: index,
      callBack: (String thumbNail) {
        fetchThumbNail(context: context, thumbNail: thumbNail);
      }
  ));

  void fetchIsCrop(BuildContext context){
    context.read<BananaInfoUserBloc>().add(const BananaInfoUserFetchCrop());
  }

  void checkNickName(BuildContext context) =>
      context.read<BananaInfoUserBloc>().add(const BananaInfoUserCheckNickName());

  void _fetchNickName({
    required BuildContext context,
    required String nickname,
  }) => context.read<BananaInfoUserBloc>().add(BananaInfoUserFetchNickName(
      nickname: nickname,
      validate: context.read<VerseConfig>().function.validateNick(nickname)
  ));

  bool nickNext({
    required BuildContext context,
    required String nickname,
  }) => context.read<VerseConfig>().function.nickNext(nickname);


  ValueChanged<String> onChangedNick({
    required BuildContext context,
  }) {
    return (val){
      _fetchNickName(context: context, nickname: val, );
    };
  }

}