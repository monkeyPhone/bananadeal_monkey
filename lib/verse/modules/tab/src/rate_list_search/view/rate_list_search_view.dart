import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/plan/plan_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/view/components/component_rate_list_list_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/view/components/component_rate_list_sort_bar_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_icons_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_icon_on_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_resize.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_side.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_width.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_form_custom.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class RateListSearchView extends StatelessWidget {
  final BuildContext routerContext;
  final BuildContext readContext;
  final (String tkIdx, List<String> keyword, String psIdx) info;
  final PlanRepository repository;
  const RateListSearchView({super.key,
    required this.readContext,
    required this.routerContext,
    required this.info,
    required this.repository
  });

  @override
  Widget build(BuildContext context) {
    return BdCanvas(
        canvasEnum: CanvasEnum.basic,
        isCanPop: true,
        isForm: true,
        body: _Body(
          repository: repository,
          readContext: readContext,
          routerContext: routerContext,
          info: info,

        )
    );
  }
}

class _Body extends StatefulWidget {
  final PlanRepository repository;
  final BuildContext routerContext;
  final BuildContext readContext;
  final (String tkIdx, List<String> keyword, String psIdx) info;
  const _Body({
    required this.repository,
    required this.readContext,
    required this.routerContext,
    required this.info
  });

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late TextEditingController _controller;
  late ScrollController _scrollController;

  String _keyword = '';

  int _currentIndex = 0;

  List<String> _keywordList = [];
  List<PlanDto> _rateEntity = [];

  void _changeIndex(int index){
    setState(() {
      _currentIndex = index;
      switch(index){
        case 0:
          _rateEntity.sort((a,b) => int.parse(b.pOrder!).compareTo(int.parse(a.pOrder!)));
        case 1:
          _rateEntity.sort((a,b) => int.parse(a.pPlanPrice!).compareTo(int.parse(b.pPlanPrice!)));
        case 2:
          _rateEntity.sort((a,b) => int.parse(b.pPlanPrice!).compareTo(int.parse(a.pPlanPrice!)));
        case 3:
          _rateEntity.sort((a,b) => int.parse(b.pIdx!).compareTo(int.parse(a.pIdx!)));
        case 4:
          _rateEntity.sort((a,b) => a.pPlanName!.compareTo(b.pPlanName!));
        case 5:
          _rateEntity.sort((a,b) => b.pPlanName!.compareTo(a.pPlanName!));
      }
    });
  }

  Future<void> _searchRate(String? list) async{
    if(list != null){
      setState(() {
        _controller.text = list;
      });
    }
    try{
      final List<PlanDto> entity = await widget.repository.getRatePlanSearch(
          tkIdx: widget.info.$1,
          psIdx: widget.info.$3,
          keyword: list ?? _controller.text
      );
      if(entity.isNotEmpty ){
        setState((){
          _rateEntity = entity;
          _keyword = '';
        });
      } else{
        setState((){
          _rateEntity = [];
          _keyword = '';
        });
      }
    } catch(_){
      setState((){
        _rateEntity = [];
        _keyword = '';
      });
      if(context.mounted){
        context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '검색에 실패했습니다. 잠시 후, 다시 시도해주세요.');
      }
    } finally{

    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    _scrollController = ScrollController();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        _AppBar(
          size: size,
          controller: _controller,
          onTapSearch: () async{
            if(MediaQuery.of(context).viewInsets.bottom > 0){
              FocusScope.of(context).unfocus();
            }
            if(_controller.text != ''){
              await _searchRate(null);
            }
          },
          onChanged: context.read<VerseConfig>().function.debounceText(
                  (val){
                setState(() {
                  _keyword = val;
                  _keywordList = widget.info.$2.where((e) => e.toLowerCase().contains(_keyword.toLowerCase())).map((item)=>item).toList();
                  if(val == ''){
                    _rateEntity.clear();
                    _keywordList.clear();
                    _keyword = '';
                  }
                });
              }
          ),

          onTapDelete: () {
            _controller.clear();
            setState(() {
              _rateEntity.clear();
              _keywordList.clear();
              _keyword = '';
            });
          },

        ),


        const BdCustomPad(padEnum: PadEnum.height16),
        _controller.text == ''
            ? _Notice(
          tk: switch(widget.info.$1){
            '0'=> '상관없음',
            '1'=> 'SK',
            '2'=> 'KT',
            '3'=> 'LG',
            '4'=> '7모바일',
            '5'=> 'M모바일',
            '6'=> 'U모바일',
            '8'=> 'Hello모바일 (KT망)',
            '12'=> 'Hello모바일 (LG망)',
            '14'=> '기타',
            _ => ''
          },
        )
            : _keyword != ''
            ?  _keywordList.isEmpty
            ?  const _DefaultList()
            : BdLayoutResize(
          widget: const SizedBox(),
          listWidget: ListView.builder(
              itemCount: _keywordList.length,
              itemBuilder: (context, index) {

                Widget buildHighlightedText() {

                  String text = _keywordList[index];
                  String keyword = _keyword;

                  List<TextSpan> spans = [];

                  // lowercase 변환
                  String lowerCaseText = text.toLowerCase();
                  String lowerCaseKeyword = keyword.toLowerCase();

                  // 시작 위치
                  int start = 0;

                  // 키워드가 존재할 때까지 실행
                  while (start < text.length) {
                    int startIndex = lowerCaseText.indexOf(lowerCaseKeyword, start);
                    if (startIndex == -1) {
                      // 키워드를 더 이상 찾을 수 없으면 나머지 텍스트를 일반 스타일로 추가
                      spans.add(TextSpan(text: text.substring(start), style: const TextStyle(color: Colors.black)));
                      break;
                    } else {
                      // 이전 일반 텍스트 추가
                      if (startIndex > start) {
                        spans.add(TextSpan(text: text.substring(start, startIndex),
                            style: TextStyle(
                                color: bananaBack,
                                fontSize: size.callout)
                        ));
                      }

                      // 키워드를 강조된 스타일로 추가
                      int endIndex = startIndex + keyword.length;
                      spans.add(TextSpan(text: text.substring(startIndex, endIndex), style: TextStyle( color: specPink,
                          fontSize: size.callout)));

                      // 다음 검색 시작 위치 설정
                      start = endIndex;
                    }
                  }

                  return RichText(
                    text: TextSpan(children: spans, style: TextStyle( color: specPink,
                        fontSize: size.callout)),
                  );
                }

                return BdRippleButtonBasic(
                    padding:  EdgeInsets.symmetric(horizontal: size.sized16grid),
                    width: size.widthCommon,
                    height:size.sizedBox50,
                    onTap: () async{
                      if(MediaQuery.of(context).viewInsets.bottom > 0){
                        FocusScope.of(context).unfocus();
                      }
                      if(_keywordList.isNotEmpty){
                        await _searchRate(_keywordList[index]);
                      }



                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildHighlightedText()
                      ],
                    )

                );
              }
          ),
        ) : _rateEntity.isEmpty ? const _DefaultList()




            : Expanded(
            child: Column(
              children: [
                _rateEntity.length == 1
                    ? const BdCustomPad(padEnum: PadEnum.height16)
                    :  ComponentRateListSortBarView(
                  size: size,
                  currentSort: _currentIndex,
                  onTap: [
                        (){
                      _changeIndex(0);
                    },
                        (){
                      if(_currentIndex == 1){
                        _changeIndex(2);
                      } else{
                        _changeIndex(1);
                      }
                    },
                        (){
                      _changeIndex(3);
                    },
                        (){
                      if(_currentIndex == 4){
                        _changeIndex(5);
                      } else{
                        _changeIndex(4);
                      }
                    }
                  ],
                ),
                ComponentRateListListView(
                  size: size,
                  controller: _scrollController,
                  rateShow: _rateEntity,
                  isSearch: true,
                  routerContext: widget.routerContext,
                  readContext: widget.readContext,
                )
              ],
            )
        )


      ],
    );
  }
}


class _AppBar extends StatelessWidget {
  final CommonSize size;
  final GestureTapCallback onTapSearch;
  final GestureTapCallback onTapDelete;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const _AppBar({
    required this.size,
    required this.onTapSearch,
    required this.onTapDelete,
    required this.controller,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return BdLayoutSide(
      sidePadding: SidePadding.canvasAppbar,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BdRippleIconOnButton(
              size: size,
              onTap: (){
                if(MediaQuery.of(context).viewInsets.bottom > 0){
                  FocusScope.of(context).unfocus();
                } else{
                  Navigator.pop(context);
                }
              },

              icon: Icons.arrow_back_ios
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: size.sizedPaddingHalf,
                  top: size.sizedBox1_5,
                  bottom: size.sizedBox1_5,
                ),
                child: BdTextFormCustom(
                  size: size,
                  onChanged: onChanged,
                  contentPadding: EdgeInsets.only(
                    left: size.sizedPaddingHalf,
                    top: size.sizedPaddingOnlyAppBar,
                  ),
                  inputBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: karajeck,
                          width: size.sizedBox1_5
                      )
                  ),
                  enabled: true,
                  fontSize: size.body,
                  hintText: '요금제 검색',
                  textController: controller,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                        top: size.sizedBox7_5,

                        bottom: size.sizedBox7_5
                    ),
                    child: BdRippleIconsButton(
                      size: size,
                      onTap: onTapDelete,
                      icon: Icons.cancel,
                      iconColor: ultimateGrey,
                    ),
                  ),
                ),
              )
          ),
          BdRippleIconOnButton(
            size: size,
            onTap: onTapSearch,
            padding: EdgeInsets.all(size.sizedBox11),
            icon: Icons.search,
          ),
        ],
      ),
    );
  }
}


class _Notice extends StatelessWidget {
  final String tk;

  const _Notice({
    required this.tk,

  });

  @override
  Widget build(BuildContext context) {
    return BdLayoutPadding(
      padding: PaddingEnum.horizontal,
      child: BdLayoutWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BdCustomPad(padEnum: PadEnum.height16),
            const BdCustomPad(padEnum: PadEnum.height16),
            Row(
              children: [
                const BdTextWidget(
                  text:  '선택 통신사 : ',
                  textStyle: bodyBold,
                ),
                Expanded(
                  child: BdTextWidget(
                    text:  tk,
                    textStyle: body,
                  ),
                ),
              ],
            ),
            const BdCustomPad(padEnum: PadEnum.height16),
            const BdCustomPad(padEnum: PadEnum.height16),
            const BdTextWidget(
              text:  '어떤 요금제를 찾고 계신가요?',
              textStyle: bodyBold,
            ),
            const BdCustomPad(padEnum: PadEnum.height16),
            const BdTextWidget(
              text:  ' ⸰ 추천 키워드',
              textStyle: body,
            ),
            const BdLayoutPadding(
              padding: PaddingEnum.onlyLeft,
              child: Column(
                children: [
                  BdCustomPad(padEnum: PadEnum.heightQuarter),
                  BdTextWidget(
                    text:  " 5G  LTE",
                    textStyle: callout,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _DefaultList extends StatelessWidget {

  const _DefaultList();

  @override
  Widget build(BuildContext context) {
    return const BdLayoutResize(
      widget: Center(
        child: BdTextWidget(
          text:  '검색된 요금제가 없습니다.',
          textStyle: bodyBold,
        ),
      ),
    );
  }
}