import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/manager/fcm_alert_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class FcmBodyEditModeView extends StatefulWidget {
  final List<NotiEntity> notiDto;
  const FcmBodyEditModeView({super.key,
    required this.notiDto
  });

  @override
  State<FcmBodyEditModeView> createState() => _FcmBodyEditModeViewState();
}

class _FcmBodyEditModeViewState extends State<FcmBodyEditModeView> {

  bool _totalTrue = false;

  List<bool> _deleteMode = [];

  void _setTotalTrue(){
    setState(() {
      if(_totalTrue){
        _totalTrue = false;
        for(int i = 0; i < widget.notiDto.length; i++){
          _deleteMode[i] = false;
        }
      } else{
        _totalTrue = true;
        for(int i = 0; i < widget.notiDto.length; i++){
          _deleteMode[i] = true;
        }
      }
    });
  }

  void _setList(int index){
    setState(() {
      if(_totalTrue){
        _totalTrue = false;
        _deleteMode[index] = false;
      }
      else if(_deleteMode.where((element) => element == true).length == widget.notiDto.length-1){
        if(_deleteMode[index]){
          _deleteMode[index] =! _deleteMode[index];
        }
        else{
          _totalTrue = true;
          _deleteMode[index] =! _deleteMode[index];
        }
      } else{
        _deleteMode[index] =! _deleteMode[index];
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for(int i = 0; i < widget.notiDto.length; i++){
      _deleteMode.add(false);
    }
  }


  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        _SortButtonList(
          size: size,
          buttonList: [
            ('전체 선택',
                (){
              _setTotalTrue();
            },
            _totalTrue
            ),
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(widget.notiDto.length,
                        (index) =>
                        _ListTile(
                          isDelete: _deleteMode[index],
                          onTap: (){
                            _setList(index);
                          },

                          text1: widget.notiDto[index].title,
                          text2: widget.notiDto[index].msg,
                          time: widget.notiDto[index].time,
                        )
                ),
              ),
            )
        ),
        const _Pad(),
        Container(
          color: white,
          child: SafeArea(
            child: SizedBox(
              width: size.widthCommon,
              height:  size.sizedButtonNew,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.sized16grid),
                    child: BdNeoButton(
                      size: size,
                      onPressed: () {
                        if(_deleteMode.where((element) => element == true).isNotEmpty){
                          List<NotiEntity> noti;
                          if (_deleteMode.where((element) => element == false).isEmpty) {
                            noti = [];
                          } else {
                            noti = widget.notiDto
                                .asMap()
                                .entries
                                .where((entry) => !_deleteMode[entry.key])
                                .map((entry) => entry.value)
                                .toList();

                          }

                          context.read<FcmAlertManager>().deleteListDto(
                              dto: noti, context: context
                          );
                          context.read<FcmAlertManager>().changeEditMode(context);
                        }
                      },
                      text: '삭제하기',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class _SortButtonList extends StatelessWidget {
  final CommonSize size;
  final List<(String, GestureTapCallback, bool)> buttonList;
  const _SortButtonList({
    required this.size,
    required this.buttonList
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: white,
        width: size.widthCommon,
        height: size.sizedBox45,
        child: Padding(
          padding: EdgeInsets.only(
              left: size.sizedBox16
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  buttonList.length,
                      (index) =>
                      FittedBox(
                        child: BdRippleButtonBasic(
                            borderRadius: BorderRadius.circular(size.sizedBox8),
                            margin: EdgeInsets.only(
                                right: size.sizedBox16,
                                top: size.sizedBox8,
                                bottom: size.sizedBox8
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: size.sizedBox12,
                                vertical: size.sizedBox6_5
                            ),
                            border: Border.all(
                                color: buttonList[index].$3 ? yellow : greyWrite,
                                width: size.sizedBox1_5
                            ),
                            color: buttonList[index].$3 ? yellow : white,
                            onTap: buttonList[index].$2,
                            child: BdTextWidget(
                              text: buttonList[index].$1,
                              textStyle: buttonList[index].$3 ? footBrown : footGrey,
                            )
                        ),
                      )
              ),
            ),
          ),
        )
    );
  }
}

class _ListTile extends StatelessWidget {
  final bool isDelete;
  final GestureTapCallback onTap;
  final String text1;
  final String text2;
  final String time;
  const _ListTile({
    required this.isDelete,
    required this.onTap,
    required this.text1,
    required this.text2,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Material(
      elevation: size.sizedBox5,
      color: isDelete ? yellowCheck : white,
      child: InkWell(
        // borderRadius: BorderRadius.circular(999),
          splashColor: yellowCheck,
          highlightColor: yellowCheck,
          hoverColor: yellowCheck,
          focusColor: yellowCheck,
          onTap: context.read<VerseConfig>().function.debounce(callback: onTap),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),

            width: size.widthCommon,
            height: size.sizedBox96,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.sizedBox16,
                  vertical: size.sizedBox12
              ),
              child: Row(
                  children: [
                    _FitBox(
                      widget:  Icon( isDelete ? Icons.check_box : Icons.check_box_outline_blank
                        , color: isDelete ? yellow : bananaBack,),
                    ),
                    const _PadWidth(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                              flex: 3,
                              fit: FlexFit.tight,
                              child: BdTextWidget(
                                text: text1,
                                textStyle: bodyBold, maxLines: 1,
                              )
                          ),
                          const Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: SizedBox()
                          ),
                          Flexible(
                              flex: 5,
                              fit: FlexFit.tight,
                              child: BdTextWidget(
                                text: text2,
                                textStyle: sub,
                                maxLines: 2,)
                          ),

                        ],
                      ),
                    ),
                    const _PadWidth(),
                    _TimeLine(time)
                  ]
              ),
            ),
          )
      ),
    );
  }
}

class _FitBox extends StatelessWidget {
  final Widget widget;
  const _FitBox({required this.widget});

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
        height: size.sizedBox25,
        width: size.sizedBox25,
        child:  FittedBox(
          child:
          widget,
        )
    );
  }
}

class _Pad extends StatelessWidget {
  const _Pad();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      height: context.read<VerseConfig>().size.sizedBox16,
    );
  }
}

class _PadWidth extends StatelessWidget {
  const _PadWidth();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.read<VerseConfig>().size.sizedBox16,
    );
  }
}

class _TimeLine extends StatelessWidget {
  final String time;
  const _TimeLine(this.time);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateTimeConfig().now.difference(DateTime.parse(time)).inMinutes == 0
          ? '${DateTimeConfig().now.difference(DateTime.parse(time)).inSeconds}초 전'
          : DateTimeConfig().now.difference(DateTime.parse(time)).inHours == 0
          ? '${DateTimeConfig().now.difference(DateTime.parse(time)).inMinutes}분 전'
          : DateTimeConfig().now.difference(DateTime.parse(time)).inDays == 0
          ? '${DateTimeConfig().now.difference(DateTime.parse(time)).inHours}시간 전'
          :  DateTimeConfig().now.difference(DateTime.parse(time)).inDays <= 6
          ? '${DateTimeConfig().now.difference(DateTime.parse(time)).inDays}일 전'
          : '${DateFormat("yyyy년 MM월 dd일").format(DateTime.parse(time))} 알림',
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: context.read<VerseConfig>().size.sizedBox10,
          color: ultimateGrey
      ),
    );
  }
}