import 'package:banana_deal_by_monkeycompany/package/data/estimate_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/estimate/src/estimate_repository_imp.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/manager/estimate_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/state/bloc/banana_estimate/banana_estimate_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/state/bloc/banana_estimate_option/banana_estimate_option_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/estimate/view/widgets/body/list/estimate_body_list_tile_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/indicator/bd_refresh_indicator.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/ui/bd_ui_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstimateBodyListView extends StatelessWidget {
  const EstimateBodyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaEstimateBloc, BananaEstimateState, StatusEnum>(
      selector: (state) => state.statusEnum,
      builder: (context, status) => switch(status){
        StatusEnum.initial => const BdLoadingSpin(),
        StatusEnum.success => const _Src(),
        StatusEnum.loading => const _Src(),
        StatusEnum.later => const _Src(),
        _ => BdRefreshButton(
          onTap: (){
            context.read<EstimateManager>().refreshEstimate(context);
      },
        )
      },
    );
  }
}

class _Src extends StatelessWidget {
  const _Src();

  @override
  Widget build(BuildContext context) {
    return BdRefreshIndicator(
      onRefresh: ()async{
        context.read<EstimateManager>().refreshEstimate(context);
      },
      child: BlocBuilder<BananaEstimateOptionBloc, BananaEstimateOptionState>(
        builder: (context, state) =>
            _List(
              page: state.page,
              isUpdate: state.isUpdate,
              current: state.current,
            ),
      ),
    );
  }
}


class _List extends StatefulWidget {
  final bool isUpdate;
  final int page;
  final int current;
  const _List({
    required this.isUpdate,
    required this.page,
    required this.current
  });

  @override
  State<_List> createState() => _ListState();
}

class _ListState extends State<_List> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('value Check --> page${widget.page} isUpdate${widget.isUpdate} current${widget.current}');
    context.read<BananaEstimateOptionBloc>().scrollController.addListener(() async{
      if(context.read<BananaEstimateOptionBloc>().scrollController.position.pixels == context.read<BananaEstimateOptionBloc>().scrollController.position.maxScrollExtent){
        if(widget.isUpdate == true){
          DataDto check = await
          context.read<EstimateRepositoryImpl>().getEstimate(
              diIdx: context.read<EstimateManager>().myDeal.diIdx,
              start: (widget.page+1)*10,
              order: widget.current,
              length: 10
          );
          if(context.mounted){
            if(check.statusEnum == StatusEnum.success){
              if(check.data.isNotEmpty){
                context.read<EstimateManager>().addMoreEstimate(context: context, statusEnum: check.statusEnum ,valueList: convertEstimateVO(check.data));
                context.read<EstimateManager>().optionSuccess(context: context, index: widget.page+1);
              } else{
                context.read<EstimateManager>().optionFail(context: context, isUpdate: false);
              }
            }
            else{
              context.read<EstimateManager>().addMoreEstimate(context: context, statusEnum: check.statusEnum ,valueList: []);
            }
          }
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaEstimateBloc, BananaEstimateState, List<EstimateVO>>(
      selector: (state) => state.estimateList,
      builder: (context, estimateList) =>
        estimateList.isNotEmpty
        ?
        ListView.builder(
          controller: context.read<BananaEstimateOptionBloc>().scrollController,
          physics: const AlwaysScrollableScrollPhysics().applyTo(const ClampingScrollPhysics()),
          itemCount: estimateList.length,
          itemBuilder: (BuildContext context, int index) =>
              EstimateBodyListTileView(
                key: ValueKey('${estimateList[index].deDIdx}_$index'),
                estimate: estimateList[index],
              ),
        ) :
        BlocSelector<BananaEstimateBloc, BananaEstimateState, StatusEnum>(
            selector: (state) => state.statusEnum,
            builder: (context, status) =>
                BdUiDefault(text: status == StatusEnum.loading || status == StatusEnum.initial ? '데이터를 불러오는 중입니다.' : '아직 참여한 매장이 없습니다.'),
        )
    );
  }
}
