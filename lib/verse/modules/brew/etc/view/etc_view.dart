import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/manager/etc_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/view/components/components_etc_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EtcView extends StatelessWidget {
  const EtcView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<EtcManager>(
        create: (BuildContext context) =>
            const EtcManager(),
      child: const _Canvas(),
    );
  }
}

class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      isPage: true,
      canvasEnum: CanvasEnum.homeCom,
      appbar: ('더 보기', null, null, null),
      navNullAble: true,
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        const BdCustomPad(padEnum: PadEnum.height8),
        const _TopButtonArea(),
        const BdCustomPad(padEnum: PadEnum.height16),
        const _Pad(
          title: '앱 설정',
        ),
        _Button(
          title: '알림 설정',
          onTap: (){
            context.read<EtcManager>().gotoEtcTabAlertSettingView(context);
          },
        ),
        _Button(
          onTap: (){

          },
          title: '단골매장 관리',
        ),
        _Button(
          onTap: (){

          },
          title: '후기 관리',
        ),
        _Button(
          onTap: (){

          },
          title: '차단 관리',
        ),
        const _Pad(
          title: '정보',
        ),
        _Button(
          onTap: (){

          },
          title: '이용약관',
        ),
        const _Pad(
          title: 'Q&A',
        ),
        _Button(
          onTap: (){

          },
          title: '1:1 문의',
        ),
        _Button(
          onTap: (){

          },
          title: '자주 하는 질문',
        ),
      ],
    );
  }
}

class _TopButtonArea extends StatelessWidget {
  const _TopButtonArea();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _TopButtonImage(),
        _TopButton(
          color: Colors.black87,
          text: '공지사항',
          onTap: (){
            context.read<VerseConfig>().tab.gotoNoticeView(context: context);
          },
          icon: Icons.campaign_outlined,
        ),
        _TopButton(
          color: Colors.black87,
          text: '이벤트',
          onTap: (){},
          icon: Icons.star_border,
        ),
        _TopButton(
          color: specPink,
          text: '로그아웃',
          onTap: (){
            context.read<EtcManager>().logout(context);
          },
          icon: Icons.power_settings_new,
        ),
      ],
    );
  }
}


class _Button extends StatelessWidget {
  final GestureTapCallback onTap;
  final String title;
  const _Button({
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    
    return ComponentsEtcButton(
      onTap: onTap,
      title: title,
    );
  }
}

class _Pad extends StatelessWidget {
  final String title;
  const _Pad({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      padding: EdgeInsets.only(
        left: size.sized16grid
      ),
      color: Colors.grey.shade100,
      height: size.sized32grid,
      child: Row(
        children: [
          BdTextWidget(
            text: title,
            textStyle: footGreyBold,
          ),
        ],
      ),
    );
  }
}


class _TopButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;
  final IconData icon;
  final Color color;
  const _TopButton({
    required this.onTap,
    required this.text,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: BdRippleButtonBasic(
          borderRadius: BorderRadius.circular(size.sized12grid),
          padding: EdgeInsets.all(size.sized12grid),
          onTap: onTap,
          child: Column(
            children: [
              SizedBox(
                width: size.sized32grid,
                height: size.sized32grid,
                child: Padding(
                  padding: EdgeInsets.all(size.sized4grid),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Icon(
                      icon,
                      color: color,
                      size: size.sized32grid,
                    ),
                  ),
                ),
              ),
              const BdCustomPad(padEnum: PadEnum.height8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: size.callout,
                    color: color
                  ),
                ),
              ),

            ],
          )
      ),
    );
  }
}


class _TopButtonImage extends StatelessWidget {

  const _TopButtonImage();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: BdRippleButtonBasic(
          borderRadius: BorderRadius.circular(size.sized12grid),
          padding: EdgeInsets.all(size.sized12grid),
          onTap: (){
            context.read<EtcManager>().gotoEtcTabInfoSettingView(context);
          },
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: BlocSelector<BananaRouteCubit, BananaRouteState , String>(
                      selector: (state) => state.userVO.mPathImg,
                      builder: (context, mPathImg) =>
                          BdImageBinder(
                            imageUrl: '${context.read<VerseConfig>().url.imageBananaUrl}$mPathImg',
                            imageWidth: size.sized32grid, imageHeight: size.sized32grid, errUrl: defaultThumb, imageLabel: 'thumb',
                          ),
                  )
                ),
              ),
              const BdCustomPad(padEnum: PadEnum.height8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '내 정보',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: size.callout,
                      color: Colors.black87
                  ),
                ),
              ),

            ],
          )
      ),
    );
  }
}



