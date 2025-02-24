import 'package:banana_deal_by_monkeycompany/app/components/rich_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_text_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/change_map/widgets/result_area_components/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../sign/views/pages/sign4/widgets/sign4_body/sign4_components/sign4_state_pages/sign4_state_page_widget/active_address_list.dart';
import '../../change_map_controller.dart';

class SearchResult extends GetView<ChangeMapController> {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      child: Column(
        children: [
          Padding(
            padding: WidgetSize(context).paddingBodyWhole,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichTextWidget(
                    list: [
                      (" 검색 결과",
                        TextStyle(
                          fontSize: WidgetSize(context).sizedBox18,
                          color: Style.blackWrite,
                          fontWeight: FontWeight.w700,
                       ),
                      ),
                      ("  ( ${controller.addressInfo.value.results.common.totalCount}개 )",
                      TextStyle(
                        fontSize: WidgetSize(context).sizedBox16,
                        color: Style.blackWrite,
                        fontWeight: FontWeight.w400,
                      ),
                      ),
                    ]
                ),
                ObxValue((extend) =>
                    RippleTextButton(
                      rightPadding: WidgetSize(context).sizedBox5,
                        onTap: (){
                          controller.searchReasultExtendsClick();
                        },
                        text: !extend.value
                            ? "많이 보기"
                            : "적게 보기",
                      fontSize: WidgetSize(context).sizedBox16,
                      fontColor: !extend.value
                          ? Colors.blue
                          : Colors.red,
                    )

                    , controller.extend)

              ],
            ),
          ),

          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              controller: controller.searchListC,
              child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  padding: WidgetSize(context).paddingBodyWhole,
                  controller: controller.searchListC,
                  itemCount: controller.addressInfo.value.results.juso.length,
                  itemBuilder: (BuildContext context, int index){
                    return ActiveAddressList(
                      jibun: controller.addressInfo.value.results.juso[index].jibunAddr,
                      road: controller.addressInfo.value.results.juso[index].roadAddr,
                      onTap: () async{
                        await controller.clickListAddress(context: context, index: index);
                      }
                    ,);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
