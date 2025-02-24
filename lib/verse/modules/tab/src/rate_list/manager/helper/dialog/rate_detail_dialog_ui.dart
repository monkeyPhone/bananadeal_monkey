import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/plan_detail/model/action/plan_detail_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/plan_detail/model/plan_detail_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_detail_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/plan_detail/src/plan_detail_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/manager/helper/dialog/state/bloc/rate_detail/rate_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/error/bd_refresh_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class RateDetailDialogUi extends StatelessWidget {
  final String pIdx;
  final String baseUrl;
  const RateDetailDialogUi({super.key,
    required this.pIdx,
    required this.baseUrl
  });

  @override
  Widget build(BuildContext context) {

    return RepositoryProvider<PlanDetailApiImpl>(
      create: (BuildContext context) => const PlanDetailApiImpl(
        action: PlanDetailAction()
      ),
      child: RepositoryProvider<PlanDetailRepositoryImpl>(
        create: (BuildContext context) => PlanDetailRepositoryImpl(
            api: context.read<PlanDetailApiImpl>(),
            monkeyUrl: baseUrl,
            pIdx: pIdx
        ),
        child: BlocProvider<RateDetailBloc>(
            create: (BuildContext context) => RateDetailBloc(
              repository: context.read<PlanDetailRepositoryImpl>()
            )..add(const InitData()),
          child: const _Src(),
        ),
    ),
);

  }
}


class _Src extends StatelessWidget {
  const _Src();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RateDetailBloc, RateDetailState, StatusEnum>(
        selector: (state) => state.statusEnum,
        builder: (context, status) =>
            switch(status){
              StatusEnum.initial || StatusEnum.loading => const BdLoadingSpin(),
              StatusEnum.success => const _Dialog(),
              _ => BdRefreshButton(
              onTap: (){
                context.read<RateDetailBloc>().add(const InitData());
              },
            )
            }
    );
  }
}


class _Dialog extends StatefulWidget {
  const _Dialog();

  @override
  State<_Dialog> createState() => _DialogState();
}

class _DialogState extends State<_Dialog> {
  late ScrollController _controller;

  @override
  void initState(){
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
    CommonSize size = context.read<VerseConfig>().size;
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(size.dialogCircular))
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.sizedPaddingHalfDouble
            ),
            child: Scrollbar(
              controller: _controller,
              thumbVisibility: true,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal:  size.sized16grid,
                    vertical: size.sized16grid + size.sizedPaddingHalfDouble
                ),
                controller: _controller,
                physics: const ClampingScrollPhysics(),
                child: SizedBox(
                  width: size.widthCommon,
                  child: BlocSelector<RateDetailBloc, RateDetailState, List<PlanDetailDto>>(
                      selector: (state) => state.detail,
                      builder: (context, detail)  =>
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: BdTextWidget(
                                      text: detail.first.pPlanName,
                                      textStyle: titleMainBold,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.sized16grid
                                    ),
                                    child: Icon(Icons.close, size: size.title27, color: white,),
                                  )
                                ],
                              ),
                              const BdCustomPad(padEnum: PadEnum.height16),
                              const BdCustomPad(padEnum: PadEnum.height8),
                              _IconArea(
                                size: size,
                                iconText: [
                                  detail.first.pTel, detail.first.pSms, detail.first.pLte
                                ],
                              ),
                              const BdCustomPad(padEnum: PadEnum.height16),
                              const BdCustomPad(padEnum: PadEnum.height8),
                              HtmlWidget(
                                context.read<PlanDetailRepositoryImpl>().convertHtml(detail.first.pInfo),
                                textStyle: TextStyle(
                                    fontSize: size.callout,
                                    fontWeight: FontWeight.w400
                                ),
                              )
                            ],
                          )
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.sized16grid,
            right: size.sized16grid,
            child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, size: size.title27,)
            ),
          ),
        ],
      ),
    );
  }
}



class _IconArea extends StatelessWidget {
  final CommonSize size;
  final List<String> iconText;
  const _IconArea({
    required this.size,
    required this.iconText
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:  CrossAxisAlignment.center,
        children: [
          Flexible(
            child:  _IconRow(
              size: size,
              icon: Icons.phone_outlined,
              text: iconText[0],
            ),
          ),
          Flexible(
            child:  _IconRow(
              size: size,
              icon: Icons.mail_outline,
              text: iconText[1],
            ),
          ),
          Flexible(
            child:  _IconRow(
              size: size,
              icon: Icons.signal_cellular_alt,
              text: iconText[2],
            ),
          ),
        ],
      ),
    );
  }
}


class _IconRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final CommonSize size;
  const _IconRow({
    required this.icon,
    required this.text,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            flex: 2,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(icon,
                  size: size.body,
                )
            )
        ),
        SizedBox(
          width: size.sizedPaddingHalfDouble,
        ),
        Flexible(
            flex: 4,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: BdTextWidget(
                  text: text,
                  textStyle: subBold,
                )
            )
        ),
      ],
    );
  }
}