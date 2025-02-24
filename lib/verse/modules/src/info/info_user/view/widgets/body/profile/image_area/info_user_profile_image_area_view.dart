import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/manager/info_user_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/state/bloc/banana_info_user/banana_info_user_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/user/bd_ui_user_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class InfoUserProfileImageAreaView extends StatelessWidget {
  const InfoUserProfileImageAreaView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaInfoUserBloc, BananaInfoUserState, String>(
      selector: (state) => state.thumbnail,
      builder: (context, thumb) =>
      BdUiUserThumbnail(
        onTap: (){
          context.read<InfoUserManager>().fetchIsCrop(context);
        },
        thumb: thumb,
      )


          // BdRippleButtonStack(
          //     isDelay: false,
          //     border: Border.all(
          //         color: greyD7D7D7,
          //         width: widgetSize.sizedBox1_5
          //     ),
          //     borderRadius: BorderRadius.circular(999),
          //     onTap: (){
          //       context.read<InfoUserManager>().fetchCrop(context);
          //     },
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(999),
          //     child: switch(thumb){
          //       '' =>
          //           BdAssetImageBinder(
          //             imageHeight: widgetSize.sizedBox121,
          //             imageWidth: widgetSize.sizedBox121,
          //             imageUrl: defaultThumb,
          //             boxFit: BoxFit.cover,
          //           ),
          //       _ =>
          //       !kIsWeb
          //           ?
          //       Image.file(
          //         File(thumb),
          //         fit: BoxFit.cover,
          //         height: widgetSize.sizedBox121,
          //         width: widgetSize.sizedBox121,
          //       )
          //           : Image.network(thumb,   fit: BoxFit.cover,
          //         height: widgetSize.sizedBox121,
          //         width: widgetSize.sizedBox121,)
          //
          //     },
          //   ),
          //   // switch(thumb){
          //   //   '' => onTap,
          //   //   _ => (){
          //   //     context.read<UserInfoEvent>().changeImageDialog(context);
          //   //   }
          //   // },
          // ),
    );
  }
}
