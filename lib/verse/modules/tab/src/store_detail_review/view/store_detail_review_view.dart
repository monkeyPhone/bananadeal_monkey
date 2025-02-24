import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store_detail_review/model/action/store_detail_review_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/store_detail_review/model/store_detail_review_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/json_bool.dart';
import 'package:banana_deal_by_monkeycompany/package/data/store/store_review_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/store_detail_review/src/store_detail_review_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/components/review_tile/component_review_tile.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail_review/manager/store_detail_review_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail_review/state/bloc/banana_store_detail_review/banana_store_detail_review_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/indicator/bd_refresh_indicator.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_star_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailReviewView extends StatelessWidget {
  final int mIdx;
  final String storeName;
  final String smId;
  final String point;
  final int cnt;
  const StoreDetailReviewView({super.key,
    required this.mIdx,
    required this.storeName,
    required this.smId,
    required this.point,
    required this.cnt
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<StoreDetailReviewApiImpl>(
              create: (BuildContext context) =>
              const StoreDetailReviewApiImpl(
                action: StoreDetailReviewAction()
              )
          ),
          RepositoryProvider<StoreDetailReviewRepositoryImpl>(
              create: (BuildContext context) =>
                  StoreDetailReviewRepositoryImpl(
                     dio: context.read<VerseConfig>().dio,
                      api: context.read<StoreDetailReviewApiImpl>()
                   )

          ),
          RepositoryProvider<StoreDetailReviewManager>(
              create: (BuildContext context) =>
                  StoreDetailReviewManager(
                      mIdx: mIdx,
                      storeName: storeName,
                      smId: smId,
                      point: point,
                      cnt: cnt
                  )
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaStoreDetailReviewBloc>(
                create: (BuildContext context) =>
                BananaStoreDetailReviewBloc(
                    repository: context.read<StoreDetailReviewRepositoryImpl>()
                )..add(FirstData(smId: smId, mIdx: mIdx, page: 0, length: 10))
            ),
            // BlocProvider<BananaStoreDetailOptionBloc>(
            //     create: (BuildContext context) =>
            //         BananaStoreDetailOptionBloc()
            // ),
          ],
          child: const _Canvas(),
        )
    );
  }
}

class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {

    return BdCanvas(
        canvasEnum: CanvasEnum.basic,
        appbar: (context.read<StoreDetailReviewManager>().storeName, null, null, null),
        body: const BdLayoutPadding(
          padding: PaddingEnum.all,
          child: _BodySrc(),
        )
    );
  }
}

class _BodySrc extends StatelessWidget {
  const _BodySrc();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaStoreDetailReviewBloc, BananaStoreDetailReviewState, StatusEnum>(
        selector: (state) => state.statusEnum,
        builder: (context, status) =>
        switch(status){
          StatusEnum.initial => const BdLoadingSpin(),
          StatusEnum.success => const _Body(),
          _ => BdRefreshButton(onTap: () {
            context.read<StoreDetailReviewManager>().refreshButton(context);
          },)
        }
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _Title(),
        BdCustomPad(padEnum: PadEnum.height32),
        _List()
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BdUiStarIcon(
          size: context.read<VerseConfig>().size.sizedBox19,
        ),
        const BdCustomPad(padEnum: PadEnum.width8),
        BdTextWidget(text: '후기 ${context.read<StoreDetailReviewManager>().point} (${context.read<StoreDetailReviewManager>().cnt})',
          textStyle: titleLittleBold,
        )
      ],
    );
  }
}



class _List extends StatefulWidget {
  const _List();

  @override
  State<_List> createState() => _ListState();
}

class _ListState extends State<_List> {
  late ScrollController _controller;
  int _page = 1;
  final int _length = 10;
  bool _next = true;
  // bool _loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _controller.addListener(
            () {
          if(_next){
            if(_controller.position.pixels == _controller.position.maxScrollExtent){
              // setState(() {
              //   _loading = true;
              // });
              context.read<VerseConfig>().function.futureDelay(600);
              context.read<StoreDetailReviewRepositoryImpl>().getData(
                  smMid: context.read<StoreDetailReviewManager>().smId,
                  mIdx: context.read<StoreDetailReviewManager>().mIdx,
                  page: _page*_length,
                  length: _length
              ).then((value) {
                if(context.mounted){
                  if(value.statusEnum == StatusEnum.success){
                    context.read<BananaStoreDetailReviewBloc>().add(GetData(value: convertStoreReviewVO(value.data)));
                    setState(() {
                      _page = _page+1;
                    });
                  } else{
                    setState(() {
                      _next = false;
                    });
                  }
                }
              });
              // Timer(const Duration(seconds: 1),(){
              //   setState(() {
              //     _loading = false;
              //   });
              // });

            }
          }
        }
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocSelector<BananaStoreDetailReviewBloc, BananaStoreDetailReviewState, List<StoreReviewVO>>(
        selector: (state) => state.reviewList,
        builder: (context, reviewList) =>
            BdRefreshIndicator(
              onRefresh: () async{
                context.read<StoreDetailReviewManager>().refreshButton(context);
                setState(() {
                  _page = 1;
                  _next = true;
                });
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics().applyTo(const ClampingScrollPhysics()),
                itemCount: reviewList.length,
                controller: _controller,
                itemBuilder: (BuildContext context, int index) =>
                    ComponentReviewTile(
                      storeName: context.read<StoreDetailReviewManager>().storeName,
                      review: reviewList[index],
                      isCan: reviewList[index].ruActivate == JsonBool.Y && reviewList[index].ruBlock == JsonBool.Y && reviewList[index].ruDeclaration == JsonBool.Y,
                      onTap: (){
                        context.read<StoreDetailReviewManager>().clickMoreVert();
                      },
                    ),
              ),
            ),
      ),
    );

    //   Expanded(
    //   child: Stack(
    //     children: [
    //       BlocSelector<BananaReviewBloc, BananaReviewState, List<StoreReViewListEntity>>(
    //         selector: (state) => state.entity,
    //         builder: (context, entity) =>
    //             ListView.builder(
    //                 physics: const ClampingScrollPhysics(),
    //                 itemCount: entity.length,
    //                 controller: _controller,
    //                 itemBuilder: (BuildContext context, int index) =>
    //                     BdReviewTile(
    //                         widgetSize: context.read<SizeConfig>().widgetSize,
    //                         storeName: context.read<ReviewPageManager>().storeName,
    //                         review: entity[index]
    //                     ),
    //             ),
    //       ),
    //       _loading
    //       ?
    //       Positioned.fill(
    //           child: Container(
    //             color: Colors.black45,
    //             child: const LoadingSpin(),
    //           )
    //       ) : const SizedBox()
    //     ],
    //   ),
    // );
  }
}