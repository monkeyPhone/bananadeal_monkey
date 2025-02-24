import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/auth/model/action/auth_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/auth/model/auth_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/upload/model/action/upload_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_edit/model/action/user_edit_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_edit/model/user_edit_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_reg/model/action/user_reg_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/user_reg/model/user_reg_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/info_edit/src/helper/info_edit_validate.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/info_edit/src/info_edit_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/manager/helper/info_setting_manager_helper_thumbnail.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/manager/info_setting_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/state/bloc/banana_info_thumbnail/banana_info_thumbnail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/state/listener/info_setting_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/info_setting_tab_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/user/bd_ui_user_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EtcTabInfoSettingView extends StatelessWidget {
  const EtcTabInfoSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UserEditApiImpl>(
              create: (BuildContext context) =>
                  const UserEditApiImpl(
                      action: UserEditAction()
                  )
          ),
          RepositoryProvider<UserRegApiImpl>(
              create: (BuildContext context) =>
              const UserRegApiImpl(
                  action: UserRegAction()
              )
          ),
          RepositoryProvider<AuthApiImpl>(
              create: (BuildContext context) =>
              const AuthApiImpl(
                  action: AuthAction()
              )
          ),

          RepositoryProvider<InfoEditRepositoryImpl>(
              create: (BuildContext context) =>
                  InfoEditRepositoryImpl(
                      dio: context.read<VerseConfig>().dio,
                      userEditApi: context.read<UserEditApiImpl>(),
                      userRegApi: context.read<UserRegApiImpl>(),
                      authApi: context.read<AuthApiImpl>(),
                      validate: const InfoEditValidate()

                  )
          ),
          RepositoryProvider<InfoSettingManager>(
              create: (BuildContext context) =>
               InfoSettingManager(
                   thumbnail: const InfoSettingManagerHelperThumbnail(
                       action: UploadAction()
                   ),
                 tab: InfoSettingTabManager(
                   repository: context.read<InfoEditRepositoryImpl>()
                 )
               )
          )
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<BananaInfoThumbnailBloc>(
                  create: (BuildContext context) =>
                    BananaInfoThumbnailBloc(
                      repository: context.read<InfoEditRepositoryImpl>()
                    )
              )
            ],
            child: const _Canvas()
        )
    );
  }
}


class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      canvasEnum: CanvasEnum.basic,
      appbar: ('내 정보', null, null, null),
      navNullAble: true,
      listener: InfoSettingListener(),
      body: _Body(),
    );
  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          BdCustomPad(padEnum: PadEnum.height8),
          _Thumbnail(),
          BdCustomPad(padEnum: PadEnum.height16),
          _BodySrc()
        ],
      ),
    );
  }
}

// _Button(
// onTap: (){
// context.read<InfoSettingManager>().thumbnail.fetchThumbNailUrl(context);
// },
// color: Colors.blue,
// title: '저장하기',
// ),
// _Button(
// onTap: (){
// context.read<InfoSettingManager>().thumbnail.initThumbNail(context);
// },
// color: Colors.red,
// title: '취소하기',
// ),
class _BodySrc extends StatelessWidget {
  const _BodySrc();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaInfoThumbnailBloc, BananaInfoThumbnailState, String>(
        selector: (state) => state.fetchUrl,
        builder: (context, fetchUrl) =>
        fetchUrl != ''
            ? const _SelectBox()
            : const _EtcLine()
    );
  }
}

class _SelectBox extends StatelessWidget {
  const _SelectBox();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        const BdCustomPad(padEnum: PadEnum.height32),
        const _TextWidget(text: '대표 이미지를 변경하시겠습니까?', color: Colors.black87,),
        const BdCustomPad(padEnum: PadEnum.height16),
        SizedBox(
          height: size.ratio58_4,
          width: size.widthCommon,
          child: Row(
            children: [
              Expanded(child: BdRippleButtonBasic(onTap: (){
                context.read<InfoSettingManager>().thumbnail.initThumbNail(context);
              }, child: const Center(child: _TextWidget(text: '취소하기', color: specPink,)))),
              Expanded(child: BdRippleButtonBasic(onTap: (){
                context.read<InfoSettingManager>().thumbnail.fetchThumbNailUrl(context);
              }, child: const Center(child: _TextWidget(text: '저장하기', color: Colors.blueAccent,))))
            ],
          ),
        )
      ],
    );
  }
}


class _TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  const _TextWidget({
    required this.text,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: context.read<VerseConfig>().size.titleLittle,
        color: color
      ),
    );
  }
}



class _EtcLine extends StatelessWidget {
  const _EtcLine();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _NickName(),
        const BdCustomPad(padEnum: PadEnum.height16),
        const _Address(),
        const BdCustomPad(padEnum: PadEnum.height32),
        _Info(captions: '아이디', content: context.read<BananaRouteCubit>().state.userVO.mEmail,),
        const BdCustomPad(padEnum: PadEnum.height16),
        _Info(captions: '유형', content: switch(context.read<BananaRouteCubit>().state.userVO.mJoinType){
          'MAIL' => '이메일 로그인',
          _ => '기타'
        },),
        const BdCustomPad(padEnum: PadEnum.height32),
        context.read<BananaRouteCubit>().state.userVO.mJoinType == 'MAIL'
            ? _Button(onTap: (){
          context.read<InfoSettingManager>().tab.passwordDialog(context);
        }, title: '비밀번호 변경')
            : const SizedBox(),
        _Button(onTap: (){
          context.read<InfoSettingManager>().tab.gotoMemberOut(context);
        }, title: '회원탈퇴'),
        _Button(onTap: (){
          context.read<VerseConfig>().browser.dialog.customDialog(
              routerContext: context,
              barrierDismissible: true,
              mainText: '로그아웃을 진행하시겠습니까?',
              captionText: '${context.read<BananaRouteCubit>().state.userVO.mEmail} 계정의 로그아웃이 진행됩니다.',
              confirmText: '로그아웃',
              conFirmOnTap: (){
                context.read<VerseConfig>().route.closeDialog(context);
                context.read<VerseConfig>().route.logout(context: context, idx: context.read<BananaRouteCubit>().state.userVO.mIdx, how: true);
              },
              cancelText: '취소',
              cancelOnTap: (){
                context.read<VerseConfig>().route.closeDialog(context);
              }
          );
        }, title: '로그아웃')
      ],
    );
  }
}



class _Thumbnail extends StatelessWidget {
  const _Thumbnail();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaInfoThumbnailBloc, BananaInfoThumbnailState, String>(
        selector: (state) => state.fetchUrl,
        builder: (context, fetchUrl) =>
            fetchUrl == ''
                ? BlocSelector<BananaRouteCubit, BananaRouteState, String>(
                    selector: (state) => state.userVO.mPathImg,
                    builder: (context, mPathImg) => BdUiUserThumbnail(
                        isNetwork: true,
                        onTap: (){
                          context.read<InfoSettingManager>().thumbnail.showNetworkSheet(context);
                        },
                        thumb: mPathImg
                    ),
                    )
                : BdUiUserThumbnail(
                onTap: (){

                },
                thumb: fetchUrl
            )
    );
  }
}

class _NickName extends StatelessWidget {

  const _NickName();

  @override
  Widget build(BuildContext context) {


    return BlocSelector<BananaRouteCubit, BananaRouteState, String>(
      selector: (state) => state.userVO.mName,
      builder: (context, mName) =>
      _InfoButton(
        onTap: (){
          context.read<InfoSettingManager>().tab.nickNameDialog(context);
        },
        captions: '닉네임',
        content: mName,
      ),
    );
  }
}

class _Address extends StatelessWidget {

  const _Address();

  @override
  Widget build(BuildContext context) {


    return BlocSelector<BananaRouteCubit, BananaRouteState, int>(
      selector: (state) => state.userVO.mSearchRange,
      builder:(context, mSearchRange) => BlocSelector<BananaRouteCubit, BananaRouteState, String>(
        selector: (state) => state.userVO.mAddDong,
        builder: (context, mAddDong) =>
            _InfoButton(
              onTap: (){
                context.read<InfoSettingManager>().showBottomSheet(context);
              },
              captions: '우리 동네',
              content: '$mAddDong (${mSearchRange}km 설정)',
            ),
      ),
    );
  }
}

class _InfoButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String captions;
  final String content;
  const _InfoButton({
    required this.onTap,
    required this.captions,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize widgetSize = context.read<VerseConfig>().size;
    return BdRippleButtonBasic(
      // border: Border.all(
      //   width: widgetSize.sizedBox1,
      //   color: Colors.grey.shade300
      // ),
        height: widgetSize.ratio58_4,
        padding: EdgeInsets.symmetric(
            horizontal: widgetSize.sized16grid,
            vertical: widgetSize.sized8grid
        ),
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BdTextWidget(
                  text: captions,
                  textStyle: captionBold,
                ),
                BdTextWidget(
                  text: content,
                  textStyle: titleLittleBold,
                ),
              ],
            ),

            Icon(Icons.arrow_forward_ios,
              size: widgetSize.sized16grid,
            )
          ],
        )
    );
  }
}


class _Info extends StatelessWidget {
  final String captions;
  final String content;
  const _Info({
    required this.captions,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;

    return Container(
      // border: Border.all(
      //   width: widgetSize.sizedBox1,
      //   color: Colors.grey.shade300
      // ),
      width: size.widthCommon,
      height: size.ratio58_4,
      padding: EdgeInsets.symmetric(
          horizontal: size.sized16grid,
          vertical: size.sized8grid
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BdTextWidget(
              text: captions,
              textStyle: captionBold,
            ),
            BdTextWidget(
              text: content,
              textStyle: titleLittle,
            ),
          ],
        ),
    );
  }
}


class _Button extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  final Color? color;
  const _Button({
    required this.onTap,
    required this.title,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;

    return BdRippleButtonBasic(
      // border: Border.all(
      //   width: widgetSize.sizedBox1,
      //   color: Colors.grey.shade300
      // ),
        height: size.ratio58_4,
        padding: EdgeInsets.only(
            left: size.sized16grid,
            right: size.sized12grid
        ),
        onTap: onTap,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: color ?? Colors.black87,
                fontWeight: FontWeight.w600,
                fontSize: size.titleLittle
              ),
            ),
            Icon(Icons.arrow_forward_ios,
              size: size.sized16grid,
              color: color ?? Colors.black87,
            )
          ],
        )
    );
  }
}



