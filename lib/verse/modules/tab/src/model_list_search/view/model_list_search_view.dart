import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/mobile_data_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/model_list/model_list_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list/view/widgets/body/model_list/model_list_body_spec_mobile_view.dart';
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


class ModelListSearchView extends StatelessWidget {
  final ModelListRepository repository;
  final BuildContext routerContext;
  final BuildContext readContext;
  final (String tkIdx, List<String> keyword) info;
  const ModelListSearchView({super.key,
    required this.repository,
    required this.readContext,
    required this.routerContext,
    required this.info
  });

  @override
  Widget build(BuildContext context) {
    return BdCanvas(
      canvasEnum: CanvasEnum.basic,
      body: _Body(
        repository: repository,
        readContext: readContext,
        routerContext: routerContext,
        info: info,
      ),
      isCanPop: true,
      isForm: true,
    );
  }
}


class _Body extends StatefulWidget {
  final ModelListRepository repository;
  final BuildContext routerContext;
  final BuildContext readContext;
  final (String tkIdx, List<String> keyword) info;

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
  List<PhoneSpecDto> _specOrigin = [];
  List<PhoneSpecDto> _specList = [];
  List<MobileDataDto> _mobileList = [];


  void _changeIndex(int index){
    setState(() {
      _currentIndex = index;
      if(widget.info.$1 == '0'){
        switch(_currentIndex){
          case 0:
            _specList.clear();
            _specList.addAll(_specOrigin);
          case 1:
            _specList.sort(
                    (a,b) =>
                    b.psReleaseDate.compareTo(a.psReleaseDate)
            );
          case 2:
            _specList.sort(
                    (a,b) =>
                    a.psName.compareTo(b.psName)
            );
          case 3:
            _specList.sort(
                    (a,b) =>
                    b.psName.compareTo(a.psName)
            );
          default:
        }

      } else{
        switch(_currentIndex){
          case 0:
            _mobileList.sort((a, b) =>
                int.parse(b.psOrder).compareTo(int.parse(a.psOrder))
            );
          case 1:
            _mobileList.sort((a, b) =>
            a.mdReleasePrice == b.mdReleasePrice
                ? int.parse(b.psOrder).compareTo(int.parse(a.psOrder))
                : int.parse(a.mdReleasePrice).compareTo(int.parse(b.mdReleasePrice))
            );
          case 2:
            _mobileList.sort((a, b) =>
            a.mdReleasePrice == b.mdReleasePrice
                ? int.parse(b.psOrder).compareTo(int.parse(a.psOrder))
                : int.parse(b.mdReleasePrice).compareTo(int.parse(a.mdReleasePrice))
            );
          case 3:
            _mobileList.sort((a, b) =>
            a.mdReleaseDate == b.mdReleaseDate
                ? int.parse(b.psOrder).compareTo(int.parse(a.psOrder))
                : b.mdReleaseDate.compareTo(a.mdReleaseDate)
            );
          case 4:
            _mobileList.sort((a, b) =>
            a.psName == b.psName
                ? int.parse(b.psOrder).compareTo(int.parse(a.psOrder))
                : a.psName.compareTo(b.psName)
            );
          case 5:
            _mobileList.sort((a, b) =>
            a.psName == b.psName
                ? int.parse(b.psOrder).compareTo(int.parse(a.psOrder))
                : b.psName.compareTo(a.psName)
            );


          default :
        }
      }
    });
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
        _CustomAppbar(
          size: size,
          controller: _controller,
          onTapSearch: () async{
            if(MediaQuery.of(context).viewInsets.bottom > 0){
              FocusScope.of(context).unfocus();
            }
            if(_controller.text != ''){
              if( widget.info.$1 == '0'){
                List<PhoneSpecDto> spec = await widget.repository.getPhoneSpec(keyword: _controller.text);
                setState((){
                  _specList = spec;
                  _keyword = '';
                });
              } else{
                List<MobileDataDto> mobile = await widget.repository.getMobileData(tkIdx: widget.info.$1, keyword: _controller.text);
                setState((){
                  _mobileList = mobile;
                  _keyword = '';
                });
              }
            }
          },
          onChanged: context.read<VerseConfig>().function.debounceText(
                  (val){
                setState(() {
                  _keyword = val;
                  _keywordList = widget.info.$2.where((e) => e.toLowerCase().contains(_keyword.toLowerCase())).map((item)=>item).toList();

                  if(val == ''){
                    _specList.clear();
                    _mobileList.clear();
                    _keywordList.clear();
                    _keyword = '';
                  }
                });
              }
          ),

          onTapDelete: () {
            _controller.clear();
            setState(() {
              _specList.clear();
              _mobileList.clear();
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
          size: size,
        )
            : _keyword != ''
            ?  _keywordList.isEmpty
            ? const _DefaultList()
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
                    height: size.sizedBox50,
                    onTap: () async{
                      if(MediaQuery.of(context).viewInsets.bottom > 0){
                        FocusScope.of(context).unfocus();
                      }
                      if( widget.info.$1 == '0'){
                        List<PhoneSpecDto> spec = await widget.repository.getPhoneSpec(keyword: _keywordList[index]);

                        setState((){
                          _controller.text = _keywordList[index];
                          _specList = spec;
                          _specOrigin = spec;
                          _keyword = '';
                        });
                      } else{
                        List<MobileDataDto> mobile = await widget.repository.getMobileData(tkIdx: widget.info.$1, keyword: _keywordList[index]);
                        setState((){
                          _mobileList = mobile;
                          _controller.text = _keywordList[index];
                          _keyword = '';
                        });
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
        )
            : _specList.isEmpty && _mobileList.isEmpty
            ?  const _DefaultList()
            :
        Expanded(
          child: Column(
            children: [
              _specList.length == 1 || _mobileList.length == 1
                  ?  const BdCustomPad(padEnum: PadEnum.height16)
                  :
              _SortButtonArea(
                size: size,
                isSpec: widget.info.$1 == '0',
                currentSort: _currentIndex,
                onTap: widget.info.$1 == '0' ?
                [
                      (){
                    _changeIndex(0);
                  },
                      (){
                    _changeIndex(1);
                  },
                      (){
                    if(_currentIndex == 2){
                      _changeIndex(3);
                    } else{
                      _changeIndex(2);
                    }
                  },
                      (){
                    _changeIndex(0);
                  },

                ]
                    :
                [
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
              widget.info.$1 == '0'
                  ? ModelListBodySpecView(
                size: size,
                specView: _specList, controller: _scrollController, routerContext: widget.routerContext, readContext: widget.readContext,)
                  : ModelListBodyMobileView(
                  size: size,
                  mobileView: _mobileList, controller: _scrollController, routerContext: widget.routerContext, readContext: widget.readContext),
            ],
          ),
        ),
      ],
    );
  }
}



class _Notice extends StatelessWidget {
  final String tk;
  final CommonSize size;
  const _Notice({
    required this.tk,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return BdLayoutPadding(
      padding: PaddingEnum.horizontal,
      child:  BdLayoutWidth(
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
              text:  '어떤 기종을 찾고 계신가요?',
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
                    text:  " A15  갤럭시  S24  아이폰15  플립5  아이폰",
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
    return  const BdLayoutResize(
      widget: Center(
        child: BdTextWidget(
          text:  '검색된 단말기가 없습니다.',
          textStyle: bodyBold,
        ),
      ),
    );
  }
}




class _SortButtonArea extends StatelessWidget {
  final CommonSize size;
  final bool isSpec;
  final int currentSort;
  final List<GestureTapCallback> onTap;
  const _SortButtonArea({
    required this.size,
    required this.isSpec,
    required this.currentSort,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: size.sized16grid
      ),
      width: size.widthCommon,
      child: Padding(
        padding: EdgeInsets.only(
            left: size.sized16grid),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
          isSpec ?
          Row(
            children: [
              _SortButton(
                size: size,
                text: '기본순',
                isSort: currentSort == 0,
                onTap: onTap[0],
              ),
              _SortButton(
                size: size,
                text: '최신순',
                isSort: currentSort == 1,
                onTap: onTap[1],
              ),
              _SortButton(
                size: size,
                text: currentSort == 3 ? '이름순 ↑' : '이름순 ↓',
                isSort: currentSort == 2 || currentSort == 3,
                onTap: onTap[2],
              ),
            ],
          )

              : Row(
            children: [
              _SortButton(
                size: size,
                text: '기본순',
                isSort: currentSort == 0,
                onTap: onTap[0],
              ),
              _SortButton(
                size: size,
                text:  currentSort == 2 ? '출고가순 ↑' : '출고가순 ↓',
                isSort: currentSort == 1 || currentSort == 2,
                onTap: onTap[1],
              ),
              _SortButton(
                size: size,
                text: '최신순',
                isSort: currentSort == 3,
                onTap: onTap[2],
              ),
              _SortButton(
                size: size,
                text: currentSort == 5 ? '이름순 ↑' : '이름순 ↓',
                isSort: currentSort == 4 || currentSort == 5,
                onTap: onTap[3],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SortButton extends StatelessWidget {
  final CommonSize size;
  final String text;
  final bool isSort;
  final GestureTapCallback onTap;
  const _SortButton({
    required this.size,
    required this.text,
    required this.isSort,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  BdRippleButtonBasic(
        height: size.sizedBox35,
        margin: EdgeInsets.only(
          right: size.sizedPaddingHalf,
        ),
        isDebounce: false,
        borderRadius: BorderRadius.circular(999),
        color: white,
        // isSort ? Style.yellow :Style.white,
        padding: EdgeInsets.symmetric(
            horizontal: size.sizedPaddingW,
            vertical: size.sizedPaddingHalfDouble
        ),
        border:  Border.all(
            width: size.sizedBox1,
            color: isSort ? brown : greyD7D7D7
        ),
        onTap: onTap,
        child: Center(
          child: BdTextWidget(
            text: text,
            textStyle: isSort ? subBrown : subGrey,
          ),
        )
    );
  }
}



class _CustomAppbar extends StatelessWidget {
  final GestureTapCallback onTapSearch;
  final GestureTapCallback onTapDelete;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final CommonSize size;
  const _CustomAppbar({
    required this.onTapSearch,
    required this.onTapDelete,
    required this.controller,
    required this.onChanged,
    required this.size
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

            icon: Icons.arrow_back_ios,
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
                  hintText: '단말기 모델명 또는 기기명 검색',
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
            icon: Icons.search
          ),
        ],
      ),
    );
  }
}