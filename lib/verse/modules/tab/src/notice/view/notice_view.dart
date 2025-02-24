import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/notice/model/action/notice_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/notice/model/notice_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/notice_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/notice/src/notice_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/view/components/components_etc_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/notice/state/bloc/banana_notice/banana_notice_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/indicator/bd_refresh_indicator.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoticeView extends StatelessWidget {
  const NoticeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<NoticeApiImpl>(
              create: (BuildContext context) =>
                  const NoticeApiImpl(
                      action: NoticeAction()
                  )
          ),
          RepositoryProvider<NoticeRepositoryImpl>(
              create: (BuildContext context) => NoticeRepositoryImpl(
                  api: context.read<NoticeApiImpl>(),
                  dio: context.read<VerseConfig>().dio
              ),
          )
        ],
        child: BlocProvider<BananaNoticeBloc>(
          create: (BuildContext context) => BananaNoticeBloc(
              repository: context.read<NoticeRepositoryImpl>()
          )..add(const StreamNoticeList()),
          child: const _Canvas(),
        ),
    );
  }
}


class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
        canvasEnum: CanvasEnum.basic,
        appbar: ('공지사항', null, null, null),
        navNullAble: true,
        body: _Body()
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaNoticeBloc, BananaNoticeState, StatusEnum>(
        selector: (state) => state.statusEnum,
        builder: (context, statusEnum) =>
            switch(statusEnum){
              StatusEnum.initial => const BdLoadingSpin(),
              StatusEnum.later => BdUiDefault(
                onTap: (){
                  context.read<BananaNoticeBloc>().add(const StreamNoticeList());
                },
                text: '등록된 공지사항이 없습니다.',),
              StatusEnum.success => const _List(),
              _ => BdRefreshButton(
                onTap: (){
                  context.read<BananaNoticeBloc>().add(const StreamNoticeList());
                },
              )
            }
    );
  }
}



class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return BdRefreshIndicator(
      onRefresh: () async{
        context.read<BananaNoticeBloc>().add(const StreamNoticeList());
      },
      child: BlocSelector<BananaNoticeBloc, BananaNoticeState , List<NoticeVO>>(
          selector: (state) => state.noticeList,
          builder: (context, noticeList) =>
              ListView.builder(
                  itemCount: noticeList.length,
                  physics: const AlwaysScrollableScrollPhysics().applyTo(const ClampingScrollPhysics()),
                  itemBuilder: (BuildContext context, int index) =>
                      ComponentsEtcButton(
                          onTap: (){
                            context.read<VerseConfig>().tab.gotoNoticeDetailView(context: context, noticeVO: noticeList[index]);
                          }, title: noticeList[index].bnTitle)
              )
      ),
    );
  }
}

