import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/manager/info_setting_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/state/bloc/banana_info_thumbnail/banana_info_thumbnail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoSettingListener extends StatelessWidget {
  const InfoSettingListener({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaInfoThumbnailBloc, BananaInfoThumbnailState>(
              listener: (context, state ){
                if(state.statusEnum != StatusEnum.initial){
                  if(state.statusEnum == StatusEnum.success){
                    context.read<InfoSettingManager>().fetchUserInfo(context);
                    context.read<InfoSettingManager>().thumbnail.initThumbNail(context);
                  }
                  else{
                    if(state.statusEnum == StatusEnum.token){
                      context.read<InfoSettingManager>().loseToken(context);
                    }else{
                      context.read<InfoSettingManager>().showError(context);
                    }
                  }
                }
              }
          )
        ],
        child: const SizedBox()
    );
  }
}
