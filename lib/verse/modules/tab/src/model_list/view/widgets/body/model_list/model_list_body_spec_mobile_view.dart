import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/mobile_data_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/create_deal/manager/create_deal_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list/manager/model_list_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class ModelListBodySpecView extends StatelessWidget {
  final BuildContext? readContext;
  final CommonSize size;
  final List<PhoneSpecDto> specView;
  final ScrollController controller;
  final BuildContext routerContext;
  const ModelListBodySpecView({super.key,
    this.readContext,
    required this.size,
    required this.specView,
    required this.controller,
    required this.routerContext,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: specView.isEmpty
            ?  _Default(size)
            : Scrollbar(
          thumbVisibility: true,
          controller: controller,
          child: ListView.builder(
              controller: controller,
              physics: const ClampingScrollPhysics(),
              itemCount: specView.length,
              itemBuilder: (BuildContext context, int index) =>
                  _ListTile(
                    size: size,
                    first: index == 0,
                    modelName: specView[index].psName,
                    onTapDetail: (){
                      routerContext.read<CreateDealManager>().gotoDetail(
                        psIdx:  specView[index].psIdx,
                        name: specView[index].psName, context: routerContext,
                      );
                    },
                    onTap: readContext == null ? (){
                      context.read<ModelListManager>().showDialogSelect(
                          main: specView[index].psName,
                          cancleOnTap: (){
                            Navigator.pop(context);
                          },
                          conFirmOnTap: (){
                            routerContext.read<CreateDealManager>().setModel(
                                psIdx: specView[index].psIdx,
                                ldcpName: specView[index].psName,
                                ldcpModel: specView[index].psModel,
                                piPath: specView[index].piPath, context: routerContext
                            );
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }, context: context
                      );


                    } : (){
                      readContext!.read<ModelListManager>().showDialogSelect(
                          main: specView[index].psName,
                          cancleOnTap: (){
                            Navigator.pop(context);
                          },
                          conFirmOnTap: (){
                            routerContext.read<CreateDealManager>().setModel(
                                psIdx: specView[index].psIdx,
                                ldcpName: specView[index].psName,
                                ldcpModel: specView[index].psModel,
                                piPath: specView[index].piPath, context: routerContext
                            );
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }, context: readContext!
                      );
                    },
                  )
          ),
        )
    );
  }
}


class ModelListBodyMobileView extends StatelessWidget {
  final BuildContext? readContext;
  final CommonSize size;
  final List<MobileDataDto> mobileView;
  final ScrollController controller;
  final BuildContext routerContext;
  const ModelListBodyMobileView({super.key,
    this.readContext,
    required this.size,
    required this.mobileView,
    required this.controller,
    required this.routerContext,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: mobileView.isEmpty
            ?  _Default(size)
            : Scrollbar(
          controller: controller,
          thumbVisibility: true,
          child: ListView.builder(
              controller: controller,
              physics: const ClampingScrollPhysics(),
              itemCount: mobileView.length,
              // padding: EdgeInsets.only(
              //   left: WidgetSize(context).sizedPaddingOnlyAppBar
              // ),
              itemBuilder: (BuildContext context, int index) =>
                  _ListTile(
                    size: size,
                    first: index == 0,
                    modelName: mobileView[index].psName,
                    price: mobileView[index].mdReleasePrice,
                    onTapDetail: (){
                      routerContext.read<CreateDealManager>().gotoDetail(
                          psIdx:  mobileView[index].psIdx,
                          name: mobileView[index].psName, context: routerContext
                      );
                    },
                    onTap: readContext == null ? (){

                      context.read<ModelListManager>().showDialogSelect(
                          context: context,
                          main: mobileView[index].psName,
                          cancleOnTap: (){
                            Navigator.pop(context);
                          },
                          conFirmOnTap: (){
                            routerContext.read<CreateDealManager>().setModel(
                                psIdx: mobileView[index].psIdx,
                                ldcpName: mobileView[index].psName,
                                ldcpModel: mobileView[index].mdModel,
                                piPath: mobileView[index].piPath, context: routerContext
                            );
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                      );
                    } :
                        (){
                      readContext!.read<ModelListManager>().showDialogSelect(
                          context: readContext!,
                          main: mobileView[index].psName,
                          cancleOnTap: (){
                            Navigator.pop(context);
                          },
                          conFirmOnTap: (){
                            routerContext.read<CreateDealManager>().setModel(
                                psIdx: mobileView[index].psIdx,
                                ldcpName: mobileView[index].psName,
                                ldcpModel: mobileView[index].mdModel,
                                piPath: mobileView[index].piPath, context: routerContext
                            );
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }
                      );
                    },
                  )
          ),
        )
    );
  }
}




class _Default extends StatelessWidget {
  final CommonSize size;
  const _Default(this.size);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BdTextWidget(
        text: '선택한 통신사에서 제공하는 단말기가 없습니다.',
        textStyle: bodyBold,
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final bool first;
  final String modelName;
  final String? price;
  final GestureTapCallback onTap;
  final GestureTapCallback onTapDetail;
  final CommonSize size;
  const _ListTile({
    required this.first,
    required this.modelName,
    this.price,
    required this.onTap,
    required this.onTapDetail,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return BdRippleButtonBasic(
        onTap: onTap,
        margin: EdgeInsets.symmetric(horizontal: size.sizedPaddingHalf),
        padding: EdgeInsets.only(
            left: size.sized16grid,
            right:  size.sizedPaddingHalf
        ),
        border:

        first ?
        Border(
            top: BorderSide(
                width: size.sizedBox1,
                color: greyD7D7D7),
            bottom: BorderSide(
                width: size.sizedBox1,
                color: greyD7D7D7)
        )
            :
        Border(
            bottom: BorderSide(
                width: size.sizedBox1,
                color: greyD7D7D7)
        ),
        width: size.widthCommon,
        height: size.sizedBox75,
        child:  Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: price == null ? 11 : 7,
                child:  RichText(
                  overflow:
                  TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: modelName,
                    style: TextStyle(
                      fontWeight:
                      FontWeight.w700,
                      color: blackWrite,
                      fontSize:
                      size.sub,
                    ),
                  ),
                )
            ),
            _Pad(size),
            price == null ? const SizedBox()
                :
            Flexible(
              fit: FlexFit.tight,
              flex: 4,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FittedBox(
                    key: key,
                    alignment: Alignment.centerRight,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      key: key,
                      '${NumberFormat('###,###').format(int.parse(price!))}원',
                      style: TextStyle(
                          fontSize:
                          size.sub,
                          fontWeight:
                          FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: size.sizedBox16,
                  ),
                ],
              ),
            ),
            _Pad2(size),
            Flexible(
                fit: FlexFit.loose,
                flex: 2,
                child:  BdRippleButtonBasic(
                    onTap: onTapDetail,
                    color: yellow,
                    borderRadius:  BorderRadius.circular(999),
                    padding:  EdgeInsets.symmetric(
                        horizontal:size.sizedPaddingW,
                        vertical: size.sizedPaddingHalf
                    ),
                    child:  FittedBox(
                      alignment: Alignment.center,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '상세',
                        style: TextStyle(
                            fontWeight:
                            FontWeight.w400,
                            fontSize:
                            size.foot,
                            color: brown),
                      ),
                    )
                )
            )
          ],
        )
    );
  }
}



class _Pad extends StatelessWidget {
  final CommonSize size;
  const _Pad(this.size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.sizedPaddingOnlyAppBar,
    );
  }
}

class _Pad2 extends StatelessWidget {
  final CommonSize size;
  const _Pad2(this.size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.sizedPaddingHalfDouble,
    );
  }
}