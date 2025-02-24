import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/terms/dialog/terms_dialog.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/terms/state/cubit/terms/terms_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TermsProvider extends StatelessWidget {
  final GestureTapCallback onTap;
  const TermsProvider({super.key, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<TermsDialog>(
      create: (BuildContext context) => const TermsDialog(),
      child: BlocProvider<TermsCubit>(
        create: (BuildContext context) => TermsCubit(
            bananaOpenUrl: context.read<VerseConfig>().url.bananaOpenUrl,
            termDialog: context.read<TermsDialog>(), context: context),
        child: BlocBuilder<TermsCubit, TermsState>(
            builder: (context, state) =>
                _TermBodyCenter(ontap: onTap,)
        ),
      ),
    );
  }
}

class _TermBodyCenter extends StatefulWidget {
  final GestureTapCallback ontap;
  const _TermBodyCenter({
    required this.ontap,
  });

  @override
  State<_TermBodyCenter> createState() => _TermBodyCenterState();
}

class _TermBodyCenterState extends State<_TermBodyCenter> {
  bool _allCheck = false;
  bool _service = false;
  bool _terms = false;
  bool _location = false;

  bool _checkValue(int index) {
    switch(index){
      case 0:
        return _allCheck;
      case 1:
        return _service;
      case 2:
        return _terms;
      case 3:
        return _location;
      default:
        return false;
    }
  }

  void _clickCheck(int index){
    switch(index){
      case 0:
        _clickAllCheck(index);
      case 1:
        _clickBool(context, index, );
      case 2:
        _clickBool(context, index, );
      case 3:
        _clickBool(context, index, );
      default:
        null;
    }
  }

  void _clickAllCheck(int index){
    setState(() {
      _allCheck =! _allCheck;
    });
    if(_allCheck){
      context.read<TermsCubit>().clickDialog(
          context: context,
          index: index,
          sController1: _scrollController1,
          sController2: _scrollController2,
          sController3: _scrollController3
      );
    }
    switch(_allCheck){
      case true:
        setState(() {
          _service = true;
          _terms = true;
          _location = true;
        });
      case false:
        setState(() {
          _service = false;
          _terms = false;
          _location = false;
        });
    }
  }

  void _clickBool(BuildContext context, int index,){
    setState(() {
      switch(index){
        case 1:
          _service =! _service;
          if(_service){
            context.read<TermsCubit>().clickDialog(
                context: context,
                index: index,
                sController1: _scrollController1,
                sController2: _scrollController2,
                sController3: _scrollController3
            );
          }
        case 2:
          _terms =! _terms;
          if(_terms){
            context.read<TermsCubit>().clickDialog(
                context: context,
                index: index,
                sController1: _scrollController1,
                sController2: _scrollController2,
                sController3: _scrollController3
            );
          }
        case 3:
          _location =! _location;
          if(_location){
            context.read<TermsCubit>().clickDialog(
                context: context,
                index: index,
                sController1: _scrollController1,
                sController2: _scrollController2,
                sController3: _scrollController3
            );
          }

      }
    });
    if(_service && _terms && _location){
      setState(() {
        _allCheck = true;
      });
    } else {
      setState(() {
        _allCheck = false;
      });
    }
  }

  late ScrollController _scrollController1;
  late ScrollController _scrollController2;
  late ScrollController _scrollController3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController1 = ScrollController();
    _scrollController2 = ScrollController();
    _scrollController3 = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController1.dispose();
    _scrollController2.dispose();
    _scrollController3.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdCanvas(
        canvasEnum: CanvasEnum.basic,
        appbar: ('약관동의', null, null, null),
        body: ListView(
          controller: ScrollController(),
          physics: const ClampingScrollPhysics(),
          children: [
            _TermBodyTop(size),
            Padding(
              padding: EdgeInsets.only(
                  left: size.sizedBox5,
                  right: size.sizedBox16
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...List.generate(
                      4, (index) =>
                      Container(
                        margin: EdgeInsets.only(
                            top: index == 1 ?  size.sizedBox8 : 0
                        ),
                        width: size.widthCommon,
                        height: size.sizedBox72,
                        decoration:
                        index == 0
                            ? BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                                bottom: BorderSide(
                                    width: size.sizedBox1,
                                    color: greyEAEAEA
                                )
                            )
                        )
                            : const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: BdRippleButtonBasic(
                            height: size.sizedBox72,
                            inerMargin: EdgeInsets.symmetric(
                              horizontal: size.sizedBox8,
                            ),
                            onTap: (){
                              _clickCheck(index);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(children: [
                                  Container(
                                    margin: EdgeInsets.only(right: size.sizedBox12),
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(999)
                                    ),
                                    height: size.sizedBox48,
                                    width: size.sizedBox48,
                                    child: FittedBox(
                                      child: Padding(
                                        padding: EdgeInsets.all(size.sizedBox6_5),
                                        child: Center(child: Icon(
                                          _checkValue(index) ? Icons.check_circle : Icons.circle_outlined ,
                                          color: _checkValue(index)  ? yellow : blackWrite,)),
                                      ),
                                    ),
                                  ),
                                  _TermBodyText(
                                    size: size,
                                    index: index,
                                    color:  _checkValue(index)
                                        ? blackWrite
                                        : grey999999,
                                  ),
                                ],),
                                Icon(Icons.arrow_forward_ios_sharp, color: ultimateGrey, size: size.sizedBox22,)
                              ],
                            )
                        ),
                      )
                  )
                ],
              ),
            ),
            _TermBodyBottom(size)
          ],
        ),
        navbarWidget: _allCheck
            ? BdNeoButton(
                size: size,
                text: '다음',
                onPressed: widget.ontap,
              )
            :  const BdDisabledButton(text: '다음')
    );
  }
}

class _TermBodyTop extends StatelessWidget {
  final CommonSize size;
  const _TermBodyTop(this.size);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: size.widthCommon,
      child: Padding(
        padding: EdgeInsets.all(
            size.sizedBox16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BdTextWidget(
              text: '바나나딜에서 제공하는 서비스를 이용하시려면',
              textStyle: body,
            ),
            SizedBox(
              height: size.sizedBox3,
            ),
            const BdTextWidget(
              text: '아래의 약관 동의 후, 회원가입이 필요해요.',
              textStyle: body,
            ),
          ],
        ),

      ),
    );
  }
}

class _TermBodyText extends StatelessWidget {
  final CommonSize size;
  final int index;
  final Color color;
  const _TermBodyText({
    required this.size,
    required this.index,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        switch(index){
          0 => '전체동의',
          1 => '(필수) 서비스 이용약관',
          2 => '(필수) 개인정보 취급동의',
          3 => '(필수) 위치기반 서비스 이용동의',
          _ => ''
        },
        style: TextStyle(
            color: color,
            fontSize:  size.titleButton,
            fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}

class _TermBodyBottom extends StatelessWidget {
  final CommonSize size;
  const _TermBodyBottom(this.size);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: size.widthCommon,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.sizedBox16,
            horizontal: size.sizedBox32
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BdTextWidget(
              text: '필수약관에 동의하지 않으시면,',
              textStyle: subGrey,
            ),
            SizedBox(
              height:size.sizedBox3,
            ),
            const BdTextWidget(
              text: '회원가입이 제한됩니다.',
              textStyle: subGrey,
            ),
            SizedBox(
              height: size.sizedBox17,
            ),
            const BdTextWidget(
              text: '약관 동의 후, 회원가입을 완료하면',
              textStyle: subGrey,
            ),
            SizedBox(
              height: size.sizedBox3,
            ),
            const BdTextWidget(
              text: '바나나딜 서비스 이용이 가능합니다.',
              textStyle: subGrey,
            ),
          ],
        ),

      ),
    );
  }
}