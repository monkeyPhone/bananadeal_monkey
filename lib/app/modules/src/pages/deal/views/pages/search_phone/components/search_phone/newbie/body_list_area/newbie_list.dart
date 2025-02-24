import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/search_phone_controllers/search_phone_spec_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../models/deal/model_list_phone_spec.dart';


class NewbieList extends GetView<SearchPhoneSpecController> {
  final ModelListPhoneSpec showDatas;
  const NewbieList({
    required this.showDatas,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      controller: controller.firstController,
      child: ListView.builder(
          shrinkWrap: true,
          controller: controller.firstController,
          itemCount: showDatas.list.length,
          itemBuilder:
              (BuildContext context, int index) {
            return
              RippleDecorationButton(
                  onTap: (){
                    if(MediaQuery.of(context).viewInsets.bottom == 0)
                    {
                      controller.openDialogPhoneData(
                          routerContext: context,
                          index: index);
                    }
                    else{
                      FocusScope.of(context).unfocus();
                    }
                  },
                  padding: WidgetSize(context).paddingBodyWhole,
                  border: Border(
                      bottom: BorderSide(
                          width: WidgetSize(context).sizedBox1,
                          color: Style.greyD7D7D7
                      )
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
                              text: showDatas
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
                          SizedBox(
                            width: WidgetSize(context).sizedBox14,
                          ),

                          RippleDecorationButton(
                              onTap: () {
                                if(MediaQuery.of(context).viewInsets.bottom > 0)
                                {
                                  Get.snackbar('알림', '아직 제품을 검색중입니다.');
                                }
                                else{
                                  controller.moveToDetail(index);
                                }
                              },
                              color: Style.yellow,
                              borderRadius: BorderRadius.circular(999),
                              padding: EdgeInsets.symmetric(
                                  horizontal: WidgetSize(context).width003,
                                  vertical: WidgetSize(context).width0017),
                              widget: Text(
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
          }
          ),
    );
  }
}
