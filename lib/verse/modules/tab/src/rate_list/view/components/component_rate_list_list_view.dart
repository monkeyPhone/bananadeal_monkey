import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/rate/plan_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/manager/rate_list_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/rate_list/view/components/compoenet_rate_list_list_tile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComponentRateListListView extends StatelessWidget {
  final CommonSize size;
  final ScrollController controller;
  final List<PlanDto> rateShow;
  final bool isSearch;
  final BuildContext routerContext;
  final BuildContext? readContext;
  const ComponentRateListListView({super.key,
    required this.size,
    required this.controller,
    required this.rateShow,
    required this.isSearch,
    required this.routerContext,
    this.readContext
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Scrollbar(
          controller: controller,
          thumbVisibility: true,
          child: ListView.builder(
              controller: controller,
              physics:  const ClampingScrollPhysics(),
              itemCount: rateShow.length,
              itemBuilder: (BuildContext context, int index) =>
                  ComponentRateListListTileView(
                    size: size,
                    first: index == 0,
                    modelName: rateShow[index].pPlanName,
                    tel: rateShow[index].pTel,
                    sms: rateShow[index].pSms,
                    lte: rateShow[index].pLte,
                    price: rateShow[index].pPlanPrice,
                    onTap: isSearch
                        ? (){
                      readContext!.read<RateListManager>().showDialogSelect(
                          context: readContext!,
                          main: rateShow[index].pPlanName ?? '',
                          cancleOnTap: (){
                            Navigator.pop(context);
                          },
                          conFirmOnTap: (){
                            routerContext.read<CreateDealManager>().changeCreateState2(
                                value: (int.parse(rateShow[index].pIdx!), rateShow[index].pPlanName!), context: routerContext
                            );
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                      );

                    }
                        : (){
                      context.read<RateListManager>().showDialogSelect(
                          context: context,
                          main: rateShow[index].pPlanName ?? '',
                          cancleOnTap: (){
                            Navigator.pop(context);
                          },
                          conFirmOnTap: (){
                            routerContext.read<CreateDealManager>().changeCreateState2(
                                value: (int.parse(rateShow[index].pIdx!), rateShow[index].pPlanName!), context: routerContext
                            );
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                      );

                    },
                    onTapDetail: isSearch
                        ? (){
                      readContext!.read<RateListManager>().gotoRateDetailDialog(
                        context: readContext!,
                        baseUrl: context.read<VerseConfig>().url.monkeyUrl,
                        pIdx: rateShow[index].pIdx!,);
                    } : (){
                      context.read<RateListManager>().gotoRateDetailDialog(
                        context: context ,
                        pIdx: rateShow[index].pIdx!,
                        baseUrl: context.read<VerseConfig>().url.monkeyUrl,
                      );
                    },
                  )
          ),
        )
    );
  }
}



