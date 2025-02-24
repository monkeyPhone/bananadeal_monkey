import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/deal_edit/model/action/deal_edit_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/deal_edit/model/deal_edit_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/broad/my_deal_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_deal.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/deal/edit/deal_edit_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/deal/edit/state/bloc/deal_edit/deal_edit_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_icons_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DealEdit {
  const DealEdit();

  void gotoDealManagement({
    required BuildContext routerContext,
    required List<MyDealListVO> dealList
  }) async{
    await Future.delayed(
        Duration.zero, (){
          if(routerContext.mounted){
            showDialog<String>(
                context: routerContext,
                barrierDismissible: false,
                builder: (BuildContext context) =>
                    RepositoryProvider<DealEditApiImpl>(
                      create: (BuildContext context) => const DealEditApiImpl(
                        action: DealEditAction()
                      ),
                      child: RepositoryProvider<DealEditManager>(
                        create: (BuildContext context) => DealEditManager(
                            routerContext: routerContext,
                            api: context.read<DealEditApiImpl>(),
                        ),
                      child: BlocProvider<DealEditBloc>(
                        create: (BuildContext context) => DealEditBloc()..add(InitDealList(remote: dealList)),
                        child: const _ManagementDialog(),
                      ),
                    ),
)
            );
          }
        }
    );
  }

}


class _ManagementDialog extends StatelessWidget {
  const _ManagementDialog();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(size.sized12grid)
          )
      ),
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(size.sizedBox12)
              ),
              width: size.widthCommon,
              padding: EdgeInsets.only(
                  top: size.sizedBox15,
                  bottom: size.sizedBox18
              ),
              child: const _Body()
          ),
          const _Positioned()
        ],
      ),
    );
  }
}

class _Positioned extends StatelessWidget {
  const _Positioned();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DealEditBloc, DealEditState, StatusEnum>(
        selector: (state) => state.status,
        builder: (context, status) =>
            switch(status){
              StatusEnum.loading =>
                  Positioned.fill(
                      child: Container(
                        color: Colors.black54,
                        child: const BdLoadingSpin(),
                      )
                  ),
              _ => const SizedBox()
            }
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
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocBuilder<DealEditBloc, DealEditState>(
        builder: (context, state) =>
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: size.widthCommon,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size.sizedBox13,
                        right: size.sizedBox3
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '종료된 딜 관리',
                          style: TextStyle(
                              color: blackWrite,
                              fontSize: size.sizedBox24,
                              fontWeight: FontWeight.w700),
                        ),
                        BdRippleIconsButton(
                          size: size,
                          onTap: (){
                            context.read<VerseConfig>().route.closeDialog(context);
                          },
                          iconSize: size.sizedBox48,
                          icon: Icons.close,
                          iconColor: blackWrite,
                        )
                      ],
                    ),
                  ),
                ),
                const BdCustomPad(padEnum: PadEnum.height16),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.sizedBox6_5,
                  ),
                  child: Row(
                    children: [

                      _ManagementButton(
                          onTap: (){
                            state.dealList.length == state.deleteList.length
                                ?  context.read<DealEditManager>().clickTotalButtonCancel(context)
                                :  context.read<DealEditManager>().clickTotalButtonSuccess(context);
                          },
                          child:  state.dealList.length == state.deleteList.length
                              ? const _SuccessRipple()
                              : const _CancelRipple()
                      ),
                      SizedBox(
                        width: size.sizedBox6_5,
                      ),
                      Text('전체 선택',
                        style: TextStyle(
                            fontSize: size.sizedBox14,
                            fontWeight: FontWeight.w400,
                            color: blackWrite
                        ),
                      ),
                      const BdCustomPad(padEnum: PadEnum.height8),

                      Text('( ${state.deleteList.length} / ${state.dealList.length} 개 )',
                        style: TextStyle(
                            fontSize: size.sizedBox12,
                            fontWeight: FontWeight.w400,
                            color: blackWrite
                        ),
                      ),
                    ],
                  ),
                ),
                const BdCustomPad(padEnum: PadEnum.height20),
                Expanded(
                  child: Scrollbar(
                    controller: _controller,
                    thumbVisibility: true,
                    child: ListView.builder(
                        padding: EdgeInsets.only(left: size.sizedBox6_5, right: size.sizedBox16),
                        controller: _controller,
                        physics: const ClampingScrollPhysics(),
                        itemCount: state.dealList.length,
                        itemBuilder: (BuildContext context, int index){
                          return _ManagementContainer(
                            myDeal:state.dealList[index],
                          );
                        }
                    ),
                  ),
                ),
                const BdCustomPad(padEnum: PadEnum.height16),
                state.deleteList.isNotEmpty
                    ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.sizedBox25),
                    child: BdNeoButton(
                      size: size,
                      height: size.sizedBox50,
                      text: '삭제하기' ,
                      onPressed: () async{
                        await context.read<DealEditManager>().deleteDeal(context: context, deleteList: state.deleteList);
                      },
                      textWidget: Center(
                          child: Text(
                            '삭제하기',
                            style: TextStyle(fontSize: size.sizedBox16, color: brown, fontWeight: FontWeight.w400),
                          )
                      ),
                    )
                )
                    :const SizedBox()
              ],
            )
    );
  }
}



class _ManagementButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget child;
  const _ManagementButton({
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: white,
      child: InkWell(
          highlightColor: Colors.grey.shade100,
          splashColor: Colors.grey.shade200,
          onTap: onTap,
          child: child
      ),
    );
  }
}


class _SuccessRipple extends StatelessWidget {
  const _SuccessRipple();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      color: Colors.transparent,
      height: size.sizedBox48,
      width: size.sizedBox48,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(size.sizedBox2),
          decoration: BoxDecoration(
            color: yellow,
            border: Border.all(width: size.sizedBox1, color: yellow),
          ),
          child: SizedBox(
              height: size.sizedBox22,
              width:size.sizedBox22,
              child: Image.asset(checkImage,
                color: white,)
          ),
        ),
      ),
    );
  }
}


class _CancelRipple extends StatelessWidget {
  const _CancelRipple();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      color: Colors.transparent,
      height: size.sizedBox48,
      width: size.sizedBox48,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(size.sizedBox2),
          decoration: BoxDecoration(
            color: white,
            border: Border.all(width: size.sizedBox1, color: greyAAAAAA),
          ),
          child: SizedBox(
            height: size.sizedBox22,
            width: size.sizedBox22,
          ),
        ),
      ),
    );
  }
}


class _ManagementContainer extends StatelessWidget {
  final MyDealListVO myDeal;
  const _ManagementContainer({
    required this.myDeal,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      margin: EdgeInsets.only(bottom: size.sizedBox8),
      padding: EdgeInsets.only(bottom: size.sizedBox8),
      width: size.widthCommon,
      height: size.height60px,
      decoration: BoxDecoration(
          color: white,
          border: Border(
              bottom: BorderSide(width: size.sizedBox1, color: greyDDDDDD)
          )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocSelector<DealEditBloc, DealEditState, List<MyDealListVO>>(
            selector: (state) => state.deleteList,
            builder: (context, deleteList) =>
                _ManagementButton(
                    onTap: (){
                      context.read<DealEditManager>().fetchDelete(context: context, value: myDeal);
                    },
                    child: deleteList.where((e)=> e.diIdx == myDeal.diIdx).isNotEmpty
                        ? const _SuccessRipple()
                        : const _CancelRipple()
                ),
          ),

          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BdCustomPad(padEnum: PadEnum.height16,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(myDeal.diHopePhone,
                          style: TextStyle(
                              color: blackWrite,
                              fontSize:
                              myDeal.diHopePhone.length > 24
                                  ? size.sizedBox10
                                  :
                              myDeal.diHopePhone.length > 20
                                  ? size.sizedBox12
                                  : size.sizedBox14,
                              fontWeight: FontWeight.w700
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: size.sizedBox3,
                        ),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text:
                              '받은 딜 ',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontSize: size.sizedBox12,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '${myDeal.diEstimateCnt}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: size.sizedBox12,
                                        color: myDeal.diStatus == dealStatusOpen
                                            ? crowdFlower2
                                            : Colors.pinkAccent
                                    )
                                ),
                                TextSpan(
                                    text: '건 ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: size.sizedBox12,
                                        color: Colors.black
                                    )
                                ),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
          ),
          SizedBox(
            width:  size.sizedBox3,
          ),
          Text(
            context.read<VerseConfig>().function.convertTime(myDeal.diRegdate),
            style: TextStyle(
                color: greyAAAAAA,
                fontWeight: FontWeight.w400,
                fontSize: size.sizedBox12
            ),
          )
        ],
      ),
    );
  }
}
