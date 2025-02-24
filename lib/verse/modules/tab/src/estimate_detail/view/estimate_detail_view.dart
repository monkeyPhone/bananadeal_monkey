import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_connect/model/chat_connect_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/estimate_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/esimate_detail/src/estimate_detail_repository_impl.dart';

import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/helper/func/estimate_detail_func.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/manager/estimate_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/view/widgets/estimate_detail_category_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/view/widgets/estimate_detail_rate_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/view/widgets/estimate_detail_terminal_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate_detail/view/widgets/nav/estimate_detail_nav.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstimateDetailView extends StatelessWidget {
  final bool isEstimateView;
  final bool isChatView;
  final EstimateVO estimate;
  final BuildContext routerContext;
  const EstimateDetailView({super.key,
    required this.isChatView,
    required this.isEstimateView,
    required this.estimate,
    required this.routerContext,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<EstimateDetailRepositoryImpl>(
              create: (BuildContext context) =>
                  EstimateDetailRepositoryImpl(
                      chatConnectApi: context.read<ChatConnectApiImpl>(),
                      dio: context.read<VerseConfig>().dio
                  )
          ),

          RepositoryProvider<EstimateDetailManager>(
              create: (BuildContext context) =>
                  EstimateDetailManager(
                      isChatView: isChatView,
                      isEstimateView: isEstimateView,
                      estimate: estimate,
                      routerContext: routerContext,
                      func: const EstimateDetailFunc(),
                      mainPrefs: context.read<VerseConfig>().cache.mainCache.prefs,
                      estimateDetailRepository: context.read<EstimateDetailRepositoryImpl>(),
                  )
          ),
        ],
        child: const _Canvas()
    );
  }
}


class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
      canvasEnum: CanvasEnum.basic,
      appbar: ('견적 상세보기',
          null, null, null),
      body: _Body(),
      navbarWidget: EstimateDetailNav(),
      navNullAble: true,
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
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
    return Scrollbar(
      controller: _controller,
      thumbVisibility: true,
      child: ListView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: context.read<VerseConfig>().size.sized16grid
        ),
        controller: _controller,
        children: const [
          EstimateDetailCategoryView(),
          BdCustomPad(padEnum: PadEnum.height32),
          EstimateDetailTerminalView(),
          BdCustomPad(padEnum: PadEnum.height32),
          EstimateDetailRateView(),
          BdCustomPad(padEnum: PadEnum.height32),
          _Message(),
          BdCustomPad(padEnum: PadEnum.height16),
        ],
      ),
    );
  }
}

class _Message extends StatelessWidget {
  const _Message();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      width: size.widthCommon,
      constraints: BoxConstraints(
        minHeight: size.sizedBox150
      ),
      padding: EdgeInsets.all(
          size.sized16grid
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.sized8grid),
          border: Border.all(
              width: size.sizedBox1_5,
              color: greyDDDDDD
          ),
          color: greyF4F4F4
      ),
      child: BdTextWidget(text: context.read<EstimateDetailManager>().estimate.deSuggestions),
    );
  }
}
