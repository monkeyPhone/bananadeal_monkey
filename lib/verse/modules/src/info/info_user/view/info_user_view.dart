import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/manager/info_user_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/state/bloc/banana_info_user/banana_info_user_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/state/bloc/info_user_bloc_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/view/widgets/body/finish/info_user_finish_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/view/widgets/body/location/info_user_location_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/view/widgets/body/profile/info_user_profile_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoUserView extends StatelessWidget {
  const InfoUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return BdCanvas(
      canvasEnum: CanvasEnum.userInfo,
      listener: const InfoUserBlocListener(),
      onTap: (){
        context.read<InfoUserManager>().onTapEvent(context);
      },
      appbar: ('', null, null, null),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: context.read<VerseConfig>().size.sizedBox16),
        physics: const ClampingScrollPhysics(),
        children: const [
          _Body()
        ],
      ),
      navbarWidget: const _Nav(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaInfoUserBloc, BananaInfoUserState, InfoUserStateEnum>(
        selector: (state) => state.infoStateEnum,
        builder: (context, infoState) =>
            switch(infoState){
              InfoUserStateEnum.profile => const InfoUserProfileView(),
              InfoUserStateEnum.location => const InfoUserLocationView(),
              InfoUserStateEnum.finish => const InfoUserFinishView(),
            }
    );
  }
}

class _Nav extends StatelessWidget {
  const _Nav();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaInfoUserBloc, BananaInfoUserState>(
        builder: (context, state) {

          bool next1 = state.nickOk;
          bool next2 = state.addressOk;

          bool next = switch(state.infoStateEnum){
            InfoUserStateEnum.profile => next1,
            InfoUserStateEnum.location => next2,
            _ => next1 && next2
          };



          String buttonName = switch(state.infoStateEnum){
            InfoUserStateEnum.finish => '시작하기',
            _ => '다음'
          };

          String disableButtonName = switch(state.infoStateEnum){
            InfoUserStateEnum.profile => state.nickname == ''
                ? '닉네임은 필수 입력 사항입니다.'
                : !state.nickOk
                      ? '닉네임 중복체크를 해주세요.'
                      : '',
            InfoUserStateEnum.location => '주소를 설정해주세요.',
            InfoUserStateEnum.finish => '회원설정을 완료할 수 없습니다.',
          };

          return switch(next){
            true => BdNeoButton(
              size:  context.read<VerseConfig>().size,
              onPressed: () {
                context.read<InfoUserManager>().navEvent(context);
              },
              text: buttonName,
            ),

            false => BdDisabledButton(text: disableButtonName,)
          };
        }
    );
  }
}


