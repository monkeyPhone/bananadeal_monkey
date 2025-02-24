import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../models/deal/model_list_mobile.dart';
import '../../../../../../../controllers/search_phone_controllers/search_phone_telecom_controller.dart';


class TelecomList extends GetView<SearchPhoneTelecomController> {
  final ModelListMobile phoneDatas;
  const TelecomList({
    required this.phoneDatas,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      controller: controller.firstController,
      child: ListView.builder(
          shrinkWrap: true,
          controller: controller.firstController,
          itemCount: phoneDatas.list.length,
          itemBuilder:
              (BuildContext context, int index) {
            return
              RippleDecorationButton(
                  onTap: (){
                    if(MediaQuery.of(context).viewInsets.bottom == 0)
                    {
                      controller.openDialogPhoneData(
                          routerContext: context,
                          index:index
                      );
                    }
                    else{
                      FocusScope.of(context).unfocus();
                    }
                  },
                  padding: WidgetSize(context).paddingBodyWhole,
                  border: Border(
                      bottom: BorderSide(
                          width: WidgetSize(context).sizedBox1,
                          color: Style.greyD7D7D7)
                  ),
                  unique: UniqueKey(),
                  width: WidgetSize(context).widthCommon,
                  height: WidgetSize(context).sizedBox77,
                  widget: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: WidgetSize(context).sign2w2,
                          child: RichText(
                            overflow:
                            TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: phoneDatas
                                  .list[index]
                                  .psName,
                              style: TextStyle(
                                fontWeight:
                                FontWeight.w700,
                                color: Style.blackWrite,
                                fontSize:
                                WidgetSize(context).sizedBox14,
                              ),
                            ),
                          )),
                      Row(
                        children: [
                          Text(
                            '${NumberFormat('###,###').format(int.parse(phoneDatas.list[index].mdReleasePrice))}원',
                            style: TextStyle(
                                fontSize:
                                WidgetSize(context).sizedBox14,
                                fontWeight:
                                FontWeight.w400),
                          ),
                          SizedBox(
                            width: WidgetSize(context).sizedBox16,
                          ),
                          RippleDecorationButton(
                              onTap: (){
                                if(MediaQuery.of(context).viewInsets.bottom > 0)
                                {
                                  Get.snackbar('알림', '아직 제품을 검색중입니다.');
                                }
                                else{
                                  controller.moveToDetail(index);
                                }
                              },
                              color: Style.yellow,
                              borderRadius:  BorderRadius.circular(999),
                              padding:  EdgeInsets.symmetric(
                                  horizontal: WidgetSize(context).width003,
                                  vertical: WidgetSize(context).width0017
                              ),
                              widget:  Text(
                                '상세',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight.w400,
                                    fontSize:
                                    WidgetSize(context).sizedBox12,
                                    color: Style.brown),
                              )
                          )
                        ],
                      )
                    ],
                  )
              );
          }),
    );
  }
}
