import 'package:banana_deal_by_monkeycompany/app/components/store_thumbnail.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/models/store/store_list_info.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/controller/invite_deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/view/invite/helper/invite_deal_body/body_list/invite_deal_card_center.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/view/invite/helper/invite_deal_body/body_list/invite_deal_check/invite_deal_check.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/invite/view/invite/helper/invite_deal_body/body_list/invite_deal_favorite_mark.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InviteDealBodyList extends GetView<InviteDealController> {
  final ScrollController sController;
  final int itemCount;
  final List<Sinfo> store;
  final List invitedList;
  final bool allClick;
  final List deletedList;
  const InviteDealBodyList({
    required this.sController,
    required this.itemCount,
    required this.store,
    required this.invitedList,
    required this.allClick,
    required this.deletedList,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: sController,
      thumbVisibility: true,
      child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          controller: sController,
          itemCount: itemCount,
          itemBuilder: (BuildContext context, index){
            return Stack(
              children: [
                Container(
                    padding: EdgeInsets.only(
                      right: WidgetSize(context).sizedBox16, left: WidgetSize(context).sizedBox16,
                top: WidgetSize(context).etc01, bottom: WidgetSize(context).etc01),
                    decoration: BoxDecoration(
                        color: Style.white,
                        border: Border(
                            bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyDDDDDD)
                        )
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: WidgetSize(context).sizedBox6,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                RippleImageButton(
                                  onTap: (){
                                    controller.gotoDetail(smid: store[index].smMId);
                                  },
                                    image: StoreThumbnail(thumbRadius: WidgetSize(context).sizedBox15, thumbSize: WidgetSize(context).width027, imageUrl: store[index].smPathImg0),
                                ),
                                SizedBox(width: WidgetSize(context).sizedBox8,),
                                GestureDetector(
                                    onTap: (){
                                      controller.listClickEvent(index);
                                    },
                                    child: InviteDealCardCenter(store: store[index])),
                              ],
                            ),
                            GestureDetector(
                              onTap: (){
                                controller.listClickEvent(index);
                              },
                              child: InviteDealCheck(
                                  isInvite: store[index].inviteDeal == 1,
                                  check: invitedList.contains(store[index].smMId) ,
                                  allClick: allClick,
                                  unCheck: deletedList.contains(store[index].smMId),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: WidgetSize(context).sizedBox10,
                        ),
                        GestureDetector(
                          onTap: (){
                            controller.listClickEvent(index);
                          },
                          child: Container(
                              width: WidgetSize(context).width0921,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Style.yellow, width: WidgetSize(context).sizedBox1
                                  ),
                                  borderRadius: BorderRadius.circular(999)
                              ),
                              padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
                              child:  RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                    text: store[index].smStoreIntroduce == '' ? '' : store[index].smStoreIntroduce,
                                    style: TextStyle(color: store[index].smStoreIntroduce == '' ? Style.greyWrite : Style.blackWrite, fontWeight: FontWeight.w400, fontSize: WidgetSize(context).sizedBox12
                                    )
                                ),
                              ),
                            ),
                        ),

                        SizedBox(height: WidgetSize(context).sizedBox14,)
                      ],
                    )
                ),
               InviteDealFavoriteMark(store: store[index]),
                _Positioned(isDealing: store[index].inviteDeal == 1,)
              ],
            );
          }
      ),
    );
  }
}


class _Positioned extends StatelessWidget {
  final bool isDealing;
  const _Positioned({required this.isDealing});

  @override
  Widget build(BuildContext context) {
    return isDealing
      ? Positioned.fill(
        child: Container(
          color: Colors.black45,
          child: Center(
            child: Text('초대 완료',
              style: TextStyle(
                fontSize: WidgetSize(context).sizedBox21,
                color: Style.yellow,
                fontWeight: FontWeight.w900
              ),
            ),
          ),
        )
    )
      : SizedBox();
  }
}
