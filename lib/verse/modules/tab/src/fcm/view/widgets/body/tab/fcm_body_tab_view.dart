import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_list_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/manager/fcm_alert_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/state/cubit/banana_alert_cubit/banana_alert_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/view/widgets/body/tab/tab_list/fcm_body_tab_list_deal_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/view/widgets/body/tab/tab_list/fcm_body_tab_list_etc_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FcmBodyTabView extends StatelessWidget {
  final int initialIndex;
  const FcmBodyTabView({super.key,
    required this.initialIndex
  });

  @override
  Widget build(BuildContext context) {
    return BdUiTabBar(
      initialIndex: initialIndex,
      buttons: const ['견적 수신함', '공지 수신함'],
      tapView: const [
        _TapBarListDeal(),
        _TapBarListEtc(),
      ],
      onTap: (index){
        context.read<FcmAlertManager>().setCurrentIndex(index: index, context: context);
      },
    );
  }
}


class _TapBarListDeal extends StatelessWidget {
  const _TapBarListDeal();

  @override
  Widget build(BuildContext context) {
    return  BlocSelector<BananaAlertCubit, BananaAlertState, List<NotiEntity>>(
        selector: (state)=> state.notiDealDto,
        builder: (context, dto)=>
          dto.isEmpty
              ? const _TapBarDefault(text: '수신된 알림이 없습니다.',)
              : _FcmList(
                  dtoList: dto,
                  isDeal: true,
                )
    );
  }
}



class _TapBarListEtc extends StatelessWidget {
  const _TapBarListEtc();

  @override
  Widget build(BuildContext context) {
    return  BlocSelector<BananaAlertCubit, BananaAlertState, List<NotiEntity>>(
        selector: (state)=> state.notiEtcDto,
        builder: (context, dto)=>
        dto.isEmpty
            ? const _TapBarDefault(text: '수신된 알림이 없습니다.')
            : _FcmList(dtoList: dto, isDeal: false,)
    );
  }
}



class _TapBarDefault extends StatelessWidget {
  final String text;
  const _TapBarDefault({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
      height: size.heightCommon-size.sizedBox220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
            style: TextStyle(
                color: bananaBack,
                fontWeight: FontWeight.w600,
                fontSize: size.sizedBox17
            ),
          ),
        ],
      ),
    );
  }
}



class _FcmList extends StatefulWidget {
  final List<NotiEntity> dtoList;
  final bool isDeal;
  const _FcmList({
    required this.dtoList,
    required this.isDeal
  });

  @override
  State<_FcmList> createState() => _FcmListState();
}

class _FcmListState extends State<_FcmList> {
  late final ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      color: Colors.grey.shade200,
      child: Scrollbar(
          controller: _controller,
          thumbVisibility: true,
          child: ListView.builder(
            padding: EdgeInsets.only(
              top: size.sizedBox12,
              left: size.sizedBox12,
              right: size.sizedBox12,
            ),
            controller: _controller,
            itemCount: widget.dtoList.length,
            itemBuilder: (BuildContext context, int index) =>
                Column(
                  children: [
                    widget.isDeal
                        ? FcmBodyTabListDealView(dto: widget.dtoList[index],)
                        : FcmBodyTabListEtcView(dto: widget.dtoList[index], dtoList: widget.dtoList, index: index,),
                    _TimeLine(widget.dtoList[index]),
                  ],
                ),
          )
      ),
    );
  }
}


class _TimeLine extends StatelessWidget {
  final NotiEntity dto;
  const _TimeLine(this.dto);
  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return SizedBox(
      width: size.widthCommon,
      child: Padding(
        padding: EdgeInsets.only(
            right: size.sizedBox7_5
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const _PadHeight(),
            Text(
              DateTimeConfig().now.difference(DateTime.parse( dto.time)).inMinutes == 0
                  ? '${DateTimeConfig().now.difference(DateTime.parse( dto.time)).inSeconds}초 전'
                  : DateTimeConfig().now.difference(DateTime.parse( dto.time)).inHours == 0
                  ? '${DateTimeConfig().now.difference(DateTime.parse( dto.time)).inMinutes}분 전'
                  : DateTimeConfig().now.difference(DateTime.parse( dto.time)).inDays == 0
                  ? '${DateTimeConfig().now.difference(DateTime.parse( dto.time)).inHours}시간 전'
                  :  DateTimeConfig().now.difference(DateTime.parse( dto.time)).inDays <= 6
                  ? '${DateTimeConfig().now.difference(DateTime.parse( dto.time)).inDays}일 전'
                  : '${DateFormat("yyyy년 MM월 dd일").format(DateTime.parse(dto.time))} 알림',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: size.sizedBox10,
                  color: ultimateGrey
              ),
            ),
            SizedBox(
              height: size.sizedBox24,
            )
          ],
        ),
      ),
    );
  }
}

class _PadHeight extends StatelessWidget {
  const _PadHeight();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.read<VerseConfig>().size.sizedBox5,
    );
  }
}





