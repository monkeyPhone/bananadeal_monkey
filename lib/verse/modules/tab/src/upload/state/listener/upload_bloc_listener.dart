import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/manager/info_setting_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/manager/info_user_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/manager/chat_log_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/manager/upload_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/bloc/banana_upload_crop/banana_upload_crop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadBlocListener extends StatelessWidget {

  const UploadBlocListener({super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<BananaUploadCropBloc, BananaUploadCropState>(
            listener: (context, state) async{
              if(state.msg != ''){
                context.read<UploadManager>().showSnackBar(context: context, text: state.msg);
              }
              else{
                if(state.canSize){
                  context.read<UploadManager>().callBack(state.croppedFilePath);
                  context.read<VerseConfig>().route.closePage(context);
                } else{
                  if(state.croppedFilePath != ''){
                    if(state.imageSize != ''){
                      context.read<UploadManager>().cropInit(context);
                      context.read<UploadManager>().showSnackBar(text: '${state.croppedFilePath} (${state.imageSize})', context: context);

                    }
                  }

                }
              }
            },
          )
        ],
        child: const SizedBox()
    );
  }
}