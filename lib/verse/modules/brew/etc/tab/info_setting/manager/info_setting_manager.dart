import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/info_edit/src/info_edit_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/manager/helper/info_setting_manager_helper_thumbnail.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/info_setting_tab_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class InfoSettingManager {
  final InfoSettingManagerHelperThumbnail thumbnail;
  final InfoSettingTabManager tab;
  const InfoSettingManager({
    required this.thumbnail,
    required this.tab
  });

  void updateInfo({
    required BuildContext context,
    required Map<String, dynamic> dataMap
  }) async{
    final StatusEnum result = await context.read<InfoEditRepositoryImpl>().updateUser(dataMap: dataMap);
    if(context.mounted){
      if(result == StatusEnum.success){
        fetchUserInfo(context);
        context.read<VerseConfig>().route.closeDialog(context);
      }
      else if(result == StatusEnum.token){
        loseToken(context);
      }
      else{
        showError(context);
      }
    }
  }

  void fetchUserInfo(BuildContext context){
    context.read<VerseConfig>().route.updateInfo(context);
  }

  void loseToken(BuildContext context){
    context.read<VerseConfig>().route.logout(
        context: context,
        idx: context.read<BananaRouteCubit>().state.userVO.mIdx,
        how: true
    );
  }

  void showError(BuildContext context){
    context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '잠시 후, 다시 시도해주세요.');
  }


  void showBottomSheet(BuildContext context){
    context.read<VerseConfig>().tab.mapBottomSheet(
      context: context,
      userVO: context.read<BananaRouteCubit>().state.userVO,
      addressCallback: (AddressVO addressVO) {
        updateInfo(
          context: context,
          dataMap: {
            "M_add": addressVO.address,
            "M_add_dong" : addressVO.dong,
            "M_latitude": addressVO.coordinate.lat,
            "M_longitude": addressVO.coordinate.lnt
          },
        );
      },
      rangeCallback: (int range) {
        updateInfo(context: context,
            dataMap: {
              "M_search_range": range,
            }
        );
      },

    );

  }

}