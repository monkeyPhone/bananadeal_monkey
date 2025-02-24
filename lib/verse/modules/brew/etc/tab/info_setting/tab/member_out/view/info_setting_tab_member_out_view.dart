import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/info_edit/info_edit_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/member_out/state/bloc/banana_member_out/banana_member_out_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_select_box.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_form_custom.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoSettingTabMemberOutView extends StatelessWidget {
  final InfoEditRepository repository;
  const InfoSettingTabMemberOutView({super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BananaMemberOutBloc>(
      create: (BuildContext context) => BananaMemberOutBloc(
        repository: repository
      ),
      child: const _Canvas(),
    );
  }
}

class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      isForm: true,
      canvasEnum: CanvasEnum.basic,
      appbar: ('회원탈퇴', null, null, null),
      body: _Body(),
      navbarWidget: _Nav(),
    );
  }
}

class _Nav extends StatelessWidget {
  const _Nav();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaMemberOutBloc, BananaMemberOutState, String>(
      selector: (state) => state.answer,
      builder: (context, answer) =>
        switch(answer){
          '' => const BdDisabledButton(text: '탈퇴신청',),
          _ => BdNeoButton(
              size: context.read<VerseConfig>().size,
              onPressed: (){
                context.read<VerseConfig>().browser.dialog.customDialog(
                    routerContext: context,
                    mainText: '바나나딜 탈퇴를 진행하시겠습니까?',
                    captionText: '${context.read<BananaRouteCubit>().state.userVO.mName}(${context.read<BananaRouteCubit>().state.userVO.mEmail})님의 탈퇴가 진행됩니다.',
                    confirmText: "네",
                    conFirmOnTap: (){
                      context.read<BananaMemberOutBloc>().add(MemberOut(context));
                    },
                    cancelText: '아니요',
                    cancelOnTap: (){
                      context.read<VerseConfig>().route.closeDialog(context);
                    });
              },
              text: '탈퇴신청')
        },
    );
  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: const [
        _Top(),
        _Bottom()
      ],
    );
  }
}

class _Top extends StatelessWidget {
  const _Top();

  @override
  Widget build(BuildContext context) {
    return BdLayoutPadding(
      padding: PaddingEnum.dialog,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BdTextWidget(
            text: '${context.read<BananaRouteCubit>().state.userVO.mName}님, 잠깐만요! 계정을 삭제하면...',
            textStyle: titleLittleBrownBold,
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
          const _TopWidget(text: '채팅, 후기 등 모든 회원 정보에 접근할수 없어요.',),
          const _TopWidget(text: '계정이 삭제된 이후에는 회원 정보를 복구할 수 없어요.',),
          const _TopWidget(text: '현재 계정으로 다시 로그인할 수 없으며, 재가입을 해야만 해요.',),
          const _TopWidget(text: '다른 사용자에게 보낸 채팅 메시지, 거래 후기 등 일부 정보는 계속 남아있을 수 있어요.',),
          const BdCustomPad(padEnum: PadEnum.height16),
        ],
      ),
    );
  }
}

class _TopWidget extends StatelessWidget {
  final String text;
  const _TopWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BdTextWidget(text: '-  ', textStyle: callout,),
            Expanded(
              child:  BdTextWidget(text: text, textStyle: callout, maxLines: 3,),
            ),
          ],
        ),
        const BdCustomPad(padEnum: PadEnum.height2),
        const BdCustomPad(padEnum: PadEnum.height2),
      ],
    );
  }
}


class _Bottom extends StatelessWidget {
  const _Bottom();

  @override
  Widget build(BuildContext context) {
    return BdLayoutPadding(
      padding: PaddingEnum.horizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BdTextWidget(
            text: '${context.read<BananaRouteCubit>().state.userVO.mName}님이 계정을 삭제하려는 이유가 궁금해요.',
            textStyle: titleLittleBrownBold,
            textAlign: TextAlign.start,
          ),
          const BdCustomPad(padEnum: PadEnum.height16),
          BlocSelector<BananaMemberOutBloc, BananaMemberOutState, int>(
              selector: (state) => state.currentIndex,
              builder: (context, currentIndex) =>
                  Column(
                    children: [
                      BdRippleSelectBox(
                          buttonList: List.generate(
                              5, (index) =>
                          (
                          switch(index){
                            0 => '더 이상 사용을 안해요.',
                            1 => '딜의 결과가 마음에 들지 않아요.',
                            2 => '고객 응대가 마음에 들지 않아요.',
                            3 => '다른 서비스를 이용하려고 해요.',
                            4 => '기타',
                            _ => ''
                          },
                          '',
                              (){context.read<BananaMemberOutBloc>().add(SelectIndex(index: index));}
                          )
                          ),
                          currentIndex: currentIndex
                      ),
                      currentIndex == 4
                          ? const _InputBox()
                          : const SizedBox(),
                      const BdCustomPad(padEnum: PadEnum.height32)
                    ],
                  )
          )
        ],
      ),
    );
  }
}


class _InputBox extends StatefulWidget {
  const _InputBox();

  @override
  State<_InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<_InputBox> {
  late final TextEditingController _controller;
  bool _finish = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void _input(String text){
    context.read<BananaMemberOutBloc>().add(UpdateAnswer(value: text));
    setState(() {
      if(text != ''){
        _finish = true;
      }
      else{
        _finish = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdTextFormCustom(
        size: size,
        onChanged: _input,
        borderColor: _finish ? yellow : null,
        onFieldSubmitted: _input,
        width: size.widthCommon,
        enabled: true,
        hintText: '계정을 삭져하려는 이유를 작성해주세요.',
        textController: _controller);
  }
}





